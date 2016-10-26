//
//  RootViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/8/18.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "RootViewController.h"

#import "GoodsTypeViewController.h"
#import "ShopCartViewController.h"
#import "HomeViewController.h"
#import "GroupBuyViewController.h"
#import "MineViewController.h"

#import "LoginNormalViewController.h"
#import "StartSeachShopView.h"
#import "BaiduLocation.h"
#define TabBarBtn_tag 10

@interface RootViewController ()
{
    NSArray *_viewControllersTitles;
    NSArray *_barImageArr;
    NSArray *_barSelectedImageArr;
}

/**检车附近view*/
@property (nonatomic,strong) StartSeachShopView *starView;
/**定位*/
@property (nonatomic,strong) BaiduLocation *location;

-(void)initTabBarItem;/*自定义标签栏item*/
-(void)initData;/*初始化数据*/

@end

@implementation RootViewController
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //检测周围是否有商店
//     [self checkShop];
    
    [self initData];
    [self configViewController];
   

    [self initTabBarItem];
    
    //地图定位
//    _location = [[BaiduLocation alloc] init];
//    [_location startLocation];
//    [_location stopLocation];
  
    
}
//检测附近有没有shop
-(void)checkShop{
    StartSeachShopView *startView = [[StartSeachShopView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:startView];
    self.starView = startView;
}

-(void)initData{
    //标题、图片和选择图片
    _viewControllersTitles = @[kStringWithHomeVcTitle,
                               kStringWithGoodsTypeVcTitle,
                               kStringWithGroupBuyVcTitle,
                               kStringWithShopCartVcTitle,
                               kStringWithPersonalCenterVcTitle];
    _barImageArr = @[kImageWithHomeVc,
                     kImageWithGoodsTypeVc,
                     kImageWithGroupBuyVc,
                     kImageWithShopCartVcVc,
                     kImageWithPersonalCenterVc];
    _barSelectedImageArr = @[kSelectedImageWithHomeVc,
                             kSelectedImageWithGoodsTypeVc,
                             kSelectedImageWithGroupBuyVc,
                             kSelectedImageWithShopCartVc,
                             kSelectedImageWithPersonalCenterVc];
}

-(void)configViewController{
    HomeViewController *homeVc = [[HomeViewController alloc] initWithHeaderType:HeaderTypeHomeVc];
    GoodsTypeViewController *goodVc = [[GoodsTypeViewController alloc] initWithHeaderType:HeaderTypeSupermaket];
    GroupBuyViewController *groupVc = [[GroupBuyViewController alloc] initWithHeaderType:HeaderTypeBackAndThreePoint title:@"团购"];
    ShopCartViewController *cartVc = [[ShopCartViewController alloc] initWithHeaderType:HeaderTypeShopCart title:@"购物车" hideTabbar:false];
    MineViewController *minVc = [[MineViewController alloc] initWithHeaderType:HeaderTypeBackAndThreePoint title:@"个人中心"];
    
    NSArray *viewControllers = @[homeVc,goodVc,groupVc,cartVc,minVc];
    NSMutableArray *naviArrs = [@[] mutableCopy];
    [viewControllers enumerateObjectsUsingBlock:^(UIViewController *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UINavigationController *naviCon = [[UINavigationController alloc] initWithRootViewController:obj];
        naviCon.title = _viewControllersTitles[idx];
        
        obj.navigationController.navigationBar.hidden = true;
        [naviArrs addObject:naviCon];
    }];
    
    self.viewControllers = naviArrs;
    
    [self registerNotification];
}
-(void)registerNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(respondsToRootTabBarNotification:) name:kNotificationRootTabbar object:nil];
}
-(void)respondsToRootTabBarNotification:(NSNotification *)info{
    NSInteger index = [info.userInfo[@"index"] integerValue];
    NSLog(@"%ld", index);
    UIButton *goalBtn = [self.tabBar viewWithTag:TabBarBtn_tag+index];
    [self respondsToItemBtn:goalBtn];
}
#pragma mark *** 自定义标签栏item ***
-(void)initTabBarItem{
    //便利删除标签栏说有控件
    for (UIView *subView in self.tabBar.subviews) {
        [subView removeFromSuperview];
    }
    //自定义Item
    NSInteger itemAmount = _viewControllersTitles.count;
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width/itemAmount;
    CGFloat height = CGRectGetHeight(self.tabBar.bounds);
    
    for (int i = 0; i<itemAmount; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        //设置大小和位置
        //        btn.backgroundColor = [UIColor redColor];
        btn.frame = CGRectMake(i*width, 0, width, height);
        [btn setTitle:_viewControllersTitles[i] forState:UIControlStateNormal];
        
        
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = WFont(25);
        btn.tag=TabBarBtn_tag+i;
        [btn addTarget:self action:@selector(respondsToItemBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.adjustsImageWhenHighlighted = NO;
        [btn setImage:[UIImage imageNamed:_barImageArr[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:_barSelectedImageArr[i]] forState:UIControlStateSelected];
        
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, -btn.imageView.frame.size.width, -btn.imageView.frame.size.height, 0);

        btn.imageEdgeInsets = UIEdgeInsetsMake(-btn.titleLabel.intrinsicContentSize.height, 0, 0, -btn.titleLabel.intrinsicContentSize.width);
        
        //添加按钮
        [self.tabBar addSubview:btn];
        if(i==0){
            btn.selected = true;
        }
    }
}
#pragma mark *** BtnEvents ***

-(void)respondsToItemBtn:(UIButton *)sender{

    
    for (UIButton *btn in self.tabBar.subviews) {
        if(btn.tag>=TabBarBtn_tag&&btn.tag<=TabBarBtn_tag+5){
            if (btn.tag == sender.tag) {
                sender.selected = true;
            }else{
                btn.selected = false;
            }
        }
    }
    self.selectedIndex = sender.tag-TabBarBtn_tag;
    
    NSLog(@"%ld", self.selectedIndex);
    
    if (self.selectedIndex==4) {
        [self judgeLoginState];
    }
}
-(void)judgeLoginState{
    if (![USERDEFAULT objectForKey:kUserDefaultLogin]) {
        NSLog(@"未登录");
        
        LoginNormalViewController *normal = [[LoginNormalViewController alloc] initWithHeaderType:HeaderTypeOnlyBack title:@"登录" hideTabbar:YES];
        [self presentViewController:normal animated:YES completion:nil];
        
    }else{
        NSLog(@"已登录");
    }
}

@end
