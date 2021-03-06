//
//  GoodsDetailViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/5.
//  Copyright © 2016年 王子豪. All rights reserved.
//
#define contenSize 694.0  //两个scrollView的contentSize大小
#define dragStrength 60.0 //拖拽强度

#define HOMEBTNTAG 20
#define CARTBTNTAG 21

#import "GoodsDetailViewController.h"
#import "SecondPageTopBar.h"
#import "AllParameterView.h"
#import "PhotoDetailView.h"
#import "EvaDetailView.h"
@interface GoodsDetailViewController ()<UIScrollViewDelegate,SecondPageTopBarDelegate>

@property(nonatomic,strong)UIScrollView * mainScrollView;
@property(nonatomic,strong)UIScrollView * secScrollView;
@property(nonatomic,strong)SecondPageTopBar * topBar;
@property(nonatomic,strong)UILabel * secPageHeaderLabel;

/**滚动图*/
@property (nonatomic,strong) ScrollerView *scroView;
/**详情普通*/
@property (nonatomic,strong) DetailNormalView *normalView;
/**详情团购*/
@property (nonatomic,strong) DetailGroupView *groupView;
/**继续拖动*/
@property (nonatomic,strong) UIButton *dragBtn;
/**加入购物车*/
@property (nonatomic,strong) UIButton *addCartBtn;

/**参数*/
@property (nonatomic,strong) AllParameterView *parDeView;
/**图文详情*/
@property (nonatomic,strong) PhotoDetailView *photoDeView;
/**评价*/
@property (nonatomic,strong) EvaDetailView *evaDeView;

/**首页按钮*/
@property (nonatomic,strong) UIButton *homeBtn;
/**购物车按钮*/
@property (nonatomic,strong) UIButton *cartBtn;





@end

@implementation GoodsDetailViewController

- (instancetype)initWithHeaderType:(HeaderType)headerType title:(NSString *)title GoodsDetailType:(GoodsDetailType)type
{
    self = [super initWithHeaderType:headerType title:title];
    if (self) {
        if (type==GoodsDetailTypeNormal) {
            
        }else{
            [self.normalView removeFromSuperview];
            [self.mainScrollView addSubview:self.groupView];
            
        }
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}


#pragma mark *** 初始化数据 ***
-(void)initData{
    
}
#pragma mark *** 初始化界面 ***
-(void)initUI{
     [self setFirstPageView];
    [self.view addSubview:self.addCartBtn];
    
    [self.view addSubview:self.homeBtn];
    [self.view addSubview:self.cartBtn];
}
-(void)setFirstPageView{
    
    self.mainScrollView.contentSize=CGSizeMake(0, contenSize);
    //banner图
    [self.mainScrollView addSubview:self.scroView];
    [self.mainScrollView addSubview:self.normalView];
    //加载更多
    [self.mainScrollView addSubview:self.dragBtn];
}
-(void)setSecondPageView{
    
    [self.secScrollView addSubview:self.parDeView];
}
//点击主页和购物车按钮
#pragma mark *** EVENTS ***
-(void)respondsToRightDoubleBtn:(UIButton *)sender{
    
    self.tabBarController.tabBar.hidden = false;

    switch (sender.tag) {
        case HOMEBTNTAG:
        {
            [self.navigationController popViewControllerAnimated:false];
            [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationRootTabbar object:nil userInfo:@{@"index":@"0"}];
        }
            break;
        case CARTBTNTAG:
        {
            [self.navigationController popViewControllerAnimated:false];
            [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationRootTabbar object:nil userInfo:@{@"index":@"3"}];
            
        }
            break;
        default:
            break;
    }
}
#pragma mark--UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(scrollView.tag == 100){
        if(scrollView.contentOffset.y<0){
            scrollView.contentOffset = CGPointMake(0, 0);//限制不能下拉
        }
    }
    if (scrollView.tag==200) {
        //在0-60之间 懒加载子控件，并且随拖动的幅度改变子控件的标题和alpha
        CGFloat  mininumContenOffSet_Y=0;
        CGFloat  maxContentOffSet_Y=-dragStrength;
        self.secPageHeaderLabel.alpha=scrollView.contentOffset.y/maxContentOffSet_Y;
        if (scrollView.contentOffset.y>maxContentOffSet_Y&&scrollView.contentOffset.y<mininumContenOffSet_Y) {
            self.secPageHeaderLabel.text=@"下拉，回到宝贝详情";
            [self.view addSubview:self.secPageHeaderLabel];
        }
        if(scrollView.contentOffset.y<maxContentOffSet_Y){
            self.secPageHeaderLabel.text=@"释放，回到宝贝详情";
        }
    }
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (scrollView.tag==100) {
        CGFloat mininumContentset_Y=self.mainScrollView.contentSize.height-Screen_height+BottomH +dragStrength;
        if(scrollView.contentOffset.y>mininumContentset_Y){
            //此时第一屏滑到底部 可调滑动手势强度
            [self setSecondPageView];
//            self.topBar.hidden=NO;
//            self.homeBtn.hidden = false;
            [self.view addSubview:self.topBar];
            //然后懒加载第二屏
            [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
                self.topBar.frame=CGRectMake(0, NaviBarH, Screen_width, TopTabBarH);
                self.secScrollView.frame=CGRectMake(0, NaviBarH+TopTabBarH, Screen_width, Screen_height-NaviBarH-BottomH-TopTabBarH);
                self.mainScrollView.frame=CGRectMake(0, NaviBarH-contenSize, Screen_width, Screen_height);
                
                
            } completion:^(BOOL finished) {
                //隐藏掉两个btn
                [self.homeBtn removeFromSuperview];
                [self.cartBtn removeFromSuperview];
                
            }];
        }
    }
    if (scrollView.tag==200) {
        CGFloat  maxContentOffSet_Y=-dragStrength;
        if (scrollView.contentOffset.y<maxContentOffSet_Y) {
            [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
                self.secPageHeaderLabel.alpha=0;
                self.topBar.frame=CGRectMake(0, Screen_height, Screen_width, TopTabBarH);
                self.secScrollView.frame=CGRectMake(0, Screen_height+TopTabBarH, Screen_width, Screen_height-NaviBarH-BottomH-TopTabBarH);
                self.mainScrollView.frame=CGRectMake(0, 64, Screen_width, Screen_height-BottomH);
            } completion:^(BOOL finished) {
//                self.topBar.hidden=YES;
                [self.view addSubview:self.homeBtn];
                [self.view addSubview:self.cartBtn];
                [self.topBar removeFromSuperview];
            }];
        }
    }
}
#pragma mark *** topbarDelegate ***
-(void)tabBar:(SecondPageTopBar *)tabBar didSelectIndex:(NSInteger)index{
    
    NSArray *arr = @[self.parDeView,self.photoDeView,self.evaDeView];
    
    for (int idx = 0; idx<3; idx++) {
        if (idx==index) {
            [self.secScrollView addSubview:arr[index]];
        }else{
            [arr[idx] removeFromSuperview];
        }
    }
    
//    switch (index) {
//        case 0:
//        {
//            NSLog(@"参数");
//            
//            [self.secScrollView addSubview:self.parDeView];
//            [self.photoDeView removeFromSuperview];
//            [self.evaDeView removeFromSuperview];
//        }
//            break;
//        case 1:
//        {
//            NSLog(@"详情");
//            [self.secScrollView addSubview:self.photoDeView];
//            [self.parDeView removeFromSuperview];
//            [self.evaDeView removeFromSuperview];
//        }
//            break;
//        case 2:
//        {
//            NSLog(@"评价");
//            [self.secScrollView addSubview:self.evaDeView];
//            [self.photoDeView removeFromSuperview];
//            [self.parDeView removeFromSuperview];
//        }
//            break;
//        default:
//            break;
//    }
}
#pragma mark *** getters ***

-(UIScrollView*)mainScrollView{
    if (_mainScrollView == nil){
        _mainScrollView = [[UIScrollView alloc] init];
        _mainScrollView.delegate = self;
        _mainScrollView.frame = CGRectMake(0.0, 64, Screen_width, Screen_height-44);
        _mainScrollView.pagingEnabled = NO;
        _mainScrollView.showsVerticalScrollIndicator = NO;
        _mainScrollView.tag =100;
        _mainScrollView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_mainScrollView];

    }
    return _mainScrollView;
}
-(UIScrollView*)secScrollView{
    if (_secScrollView==nil) {
        _secScrollView=[[UIScrollView alloc]init];
        _secScrollView.frame=CGRectMake(0, Screen_height-BottomH, Screen_height, Screen_height-NaviBarH-BottomH-TopTabBarH);
        _secScrollView.delegate=self;
        _secScrollView.pagingEnabled=YES;
        _secScrollView.showsVerticalScrollIndicator=NO;
        _secScrollView.tag=200;
        _secScrollView.backgroundColor = [UIColor whiteColor];
        self.secScrollView.contentSize=CGSizeMake(0, Screen_height-NaviBarH-BottomH-TopTabBarH+3);
        [self.view addSubview:_secScrollView];
        [self.view bringSubviewToFront:self.backView];
        [self.view bringSubviewToFront:self.topBlackView];
    }
    return _secScrollView;
}
-(UILabel*)secPageHeaderLabel{
    if (_secPageHeaderLabel==nil) {
        _secPageHeaderLabel=[[UILabel alloc]init];
        _secPageHeaderLabel.frame=CGRectMake(0, NaviBarH+TopTabBarH+8, Screen_width, 21);
        _secPageHeaderLabel.textColor=[UIColor blackColor];
        _secPageHeaderLabel.font=[UIFont systemFontOfSize:12];
        _secPageHeaderLabel.alpha=0;
        _secPageHeaderLabel.textAlignment=NSTextAlignmentCenter;
    }
    return _secPageHeaderLabel;
}
-(SecondPageTopBar*)topBar{
    if (_topBar==nil) {
        _topBar=[[SecondPageTopBar alloc]initWithArray:@[@"参数",@"详情",@"评价"]];
        _topBar.frame=CGRectMake(0, NaviBarH, Screen_width, TopTabBarH);
        _topBar.delegate=self;
        [self.view addSubview:_topBar];
    }
    return _topBar;
}

-(ScrollerView *)scroView{
    if (!_scroView) {
        _scroView = [[ScrollerView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, 750*AdaptationWidth()) images:[@[@"gundong",@"gundong2",@"gundong3",@"gundong4"] mutableCopy]];
    }
    return _scroView;
}
-(DetailNormalView *)normalView{
    if (!_normalView) {
        _normalView = [[DetailNormalView alloc] initWithFrame:CGRectMake(0, CGRectYH(self.scroView), Screen_width, 450*AdaptationWidth())];
        _normalView.backgroundColor = [UIColor whiteColor];
        
    }
    return _normalView;
}
-(DetailGroupView *)groupView{
    if (!_groupView) {
        _groupView = [[DetailGroupView alloc] initWithFrame:CGRectMake(0, CGRectYH(self.scroView), Screen_width, 450*AdaptationWidth())];
        
    }
    return _groupView;
}
-(UIButton *)dragBtn{
    if (!_dragBtn) {
        _dragBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectYH(self.normalView), Screen_width, 60*AdaptationWidth())];
        _dragBtn.backgroundColor = LH_RGBCOLOR(233, 233, 233);
        [_dragBtn setTitle:@"继续拖动，查看图文详情" forState:UIControlStateNormal];
        [_dragBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_dragBtn setImage:MImage(@"xiat") forState:UIControlStateNormal];
        _dragBtn.titleLabel.font = WFont(25);
    }
    return _dragBtn;
}
-(UIButton *)addCartBtn{
    if (!_addCartBtn) {
        _addCartBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, Screen_height-44, Screen_width, 44)];
        [_addCartBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
        _addCartBtn.backgroundColor = LH_RGBCOLOR(238, 48, 56);
        _addCartBtn.titleLabel.font = WFont(37);
    }
    return _addCartBtn;
}
-(AllParameterView *)parDeView{
    if (!_parDeView) {
        _parDeView = [[AllParameterView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height-64-TopTabBarH-44)];
    }
    return _parDeView;
}
-(PhotoDetailView *)photoDeView{
    if (!_photoDeView) {
        _photoDeView = [[PhotoDetailView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, CGRectGetHeight(self.parDeView.bounds))];
        
    }
    return _photoDeView;
}
-(EvaDetailView *)evaDeView{
    if (!_evaDeView) {
        _evaDeView = [[EvaDetailView alloc] initWithFrame:self.photoDeView.bounds];
    }
    return _evaDeView;
}
-(UIButton *)homeBtn{
    if (!_homeBtn) {
        _homeBtn = [[UIButton alloc] initWithFrame:AdaptationFrame(Screen_width/AdaptationWidth()-200, 70/AdaptationWidth(), 75, 75)];
        [_homeBtn setImage:MImage(@"leaf") forState:0];
        _homeBtn.tag = HOMEBTNTAG;
        [_homeBtn addTarget:self action:@selector(respondsToRightDoubleBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _homeBtn;
}
-(UIButton *)cartBtn{
    if (!_cartBtn) {
        _cartBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectXW(self.homeBtn)+25*AdaptationWidth(), CGRectY(self.homeBtn), 75*AdaptationWidth(), 75*AdaptationWidth())];
        [_cartBtn setImage:MImage(@"cart") forState:0];
        _cartBtn.tag = CARTBTNTAG;
        [_cartBtn addTarget:self action:@selector(respondsToRightDoubleBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cartBtn;
}

@end
