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

#define TabBarBtn_tag 10

@interface RootViewController ()
{
    NSArray *_viewControllersTitles;
    NSArray *_barImageArr;
    NSArray *_barSelectedImageArr;
}

-(void)initTabBarItem;/*自定义标签栏item*/
-(void)initData;/*初始化数据*/
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self configViewController];
    [self initTabBarItem];
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
    HomeViewController *homeVc = [[HomeViewController alloc] init];
    GoodsTypeViewController *goodVc = [[GoodsTypeViewController alloc] init];
    GroupBuyViewController *groupVc = [[GroupBuyViewController alloc] init];
    ShopCartViewController *cartVc = [[ShopCartViewController alloc] init];
    MineViewController *minVc = [[MineViewController alloc] init];
    
    NSArray *viewControllers = @[homeVc,goodVc,groupVc,cartVc,minVc];
    NSMutableArray *naviArrs = [@[] mutableCopy];
    [viewControllers enumerateObjectsUsingBlock:^(UIViewController *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UINavigationController *naviCon = [[UINavigationController alloc] initWithRootViewController:obj];
        naviCon.title = _viewControllersTitles[idx];
        obj.view.backgroundColor = LH_RandomColor;
        obj.navigationController.navigationBar.hidden = true;
        [naviArrs addObject:naviCon];
        
        
    }];
    
    self.viewControllers = naviArrs;
    
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
        [btn setImage:[UIImage imageNamed:_barSelectedImageArr[i]] forState:UIControlStateFocused];
        
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, -btn.imageView.frame.size.width, -btn.imageView.frame.size.height, 0);

        btn.imageEdgeInsets = UIEdgeInsetsMake(-btn.titleLabel.intrinsicContentSize.height, 0, 0, -btn.titleLabel.intrinsicContentSize.width);
        
        //添加按钮
        [self.tabBar addSubview:btn];
    }
}
#pragma mark *** BtnEvents ***

-(void)respondsToItemBtn:(UIButton *)sender{
    sender.backgroundColor = [UIColor orangeColor];
    
    self.selectedIndex = sender.tag-TabBarBtn_tag;
}


@end
