//
//  GoodsDetailViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/5.
//  Copyright © 2016年 王子豪. All rights reserved.
//
#define contenSize 650.0  //两个scrollView的contentSize大小
#define dragStrength 60.0 //拖拽强度

#import "GoodsDetailViewController.h"
#import "SecondPageTopBar.h"
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

@end

@implementation GoodsDetailViewController

- (instancetype)initWithHeaderType:(HeaderType)headerType title:(NSString *)title GoodsDetailType:(GoodsDetailType)type
{
    self = [super initWithHeaderType:headerType title:title];
    if (self) {
        if (type==GoodsDetailTypeNormal) {
            
        }else{
            
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
    UILabel * lab=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, Screen_width, 21)];
    lab.backgroundColor=[UIColor lightGrayColor];
    lab.text=@"我在第二屏的顶头位置";
    lab.textAlignment=NSTextAlignmentCenter;
    [self.secScrollView addSubview:lab];
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
            self.topBar.hidden=NO;
//            [self.view bringSubviewToFront:self.botomView];
//            self.backToTopBtn.hidden=NO;
//            [self.view addSubview:self.backToTopBtn];
            //然后懒加载第二屏
            [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
                self.topBar.frame=CGRectMake(0, NaviBarH, Screen_width, TopTabBarH);
                self.secScrollView.frame=CGRectMake(0, NaviBarH+TopTabBarH, Screen_width, Screen_height-NaviBarH-BottomH-TopTabBarH);
                self.mainScrollView.frame=CGRectMake(0, NaviBarH-contenSize, Screen_width, Screen_height);
            } completion:^(BOOL finished) {
            }];
        }
    }
    if (scrollView.tag==200) {
        CGFloat  maxContentOffSet_Y=-dragStrength;
        if (scrollView.contentOffset.y<maxContentOffSet_Y) {
            
//            self.backToTopBtn.hidden=YES;
//            [self.view bringSubviewToFront:self.botomView];
            
            [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
                self.secPageHeaderLabel.alpha=0;
                self.topBar.frame=CGRectMake(0, Screen_height, Screen_width, TopTabBarH);
                self.secScrollView.frame=CGRectMake(0, Screen_height+TopTabBarH, Screen_width, Screen_height-NaviBarH-BottomH-TopTabBarH);
                self.mainScrollView.frame=CGRectMake(0, 64, Screen_width, Screen_height-BottomH);
            } completion:^(BOOL finished) {
                self.topBar.hidden=YES;
            }];
        }
    }
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
        self.secScrollView.contentSize=CGSizeMake(0, contenSize);
        [self.view addSubview:_secScrollView];
        [self.view bringSubviewToFront:self.backView];
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
        _topBar=[[SecondPageTopBar alloc]initWithArray:@[@"图文详情",@"包装参数",@"商品评价"]];
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
@end
