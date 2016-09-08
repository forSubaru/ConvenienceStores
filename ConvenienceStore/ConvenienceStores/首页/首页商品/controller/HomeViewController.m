//
//  HomeViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/8/29.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "HomeViewController.h"
#import "FourButtonView.h"
#import "HotCollectionView.h"
#import "GroupBugView.h"
#import "SeckillViewController.h"
#import "RootViewController.h"
@interface HomeViewController ()<FourButtonViewDelegate,HotCollectionViewDelegate,GroupBugViewDelegate>
/**背景滚动图*/
@property (nonatomic,strong) UIScrollView *backScroView;

/**广告滚动图*/
@property (nonatomic,strong) ScrollerView *homeScrollView;
/**四个按钮*/
@property (nonatomic,strong) FourButtonView *fourBtnView;
/**秒杀商品*/
@property (nonatomic,strong) HotCollectionView *hotCollectionView;
/**团购商品*/
@property (nonatomic,strong) GroupBugView *groupView;
/**查看更多商品按钮*/
@property (nonatomic,strong) UIButton *moreGoodsBtn;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initUI];
}

#pragma mark *** 初始化数据 ***
-(void)initData{
    
}
#pragma mark *** 初始化界面 ***
-(void)initUI{
    [self.view addSubview:self.backScroView];
    [self.backScroView addSubview:self.homeScrollView];
    [self.backScroView addSubview:self.fourBtnView];
    [self.backScroView addSubview:self.hotCollectionView];
    [self.backScroView addSubview:self.groupView];
    [self.backScroView addSubview:self.moreGoodsBtn];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark *** viewsDelegate ***
-(void)FourButtonView:(FourButtonView *)fourView didTapItemForTitle:(NSString *)title{
    NSLog(@"%@", title);
    if ([title isEqualToString:@"超市"]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationRootTabbar object:nil userInfo:@{@"index":@"1"}];
    }else if ([title isEqualToString:@"团购"]){
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationRootTabbar object:nil userInfo:@{@"index":@"2"}];
    }
}
-(void)HotColletionView:(HotCollectionView *)hotView selectedItem:(NSString *)itemID{
    NSLog(@"%@", itemID);
    GoodsDetailViewController *detaiVc = [[GoodsDetailViewController alloc] initWithHeaderType:HeaderTypeBackAndThreePoint title:@"商品详情" GoodsDetailType:GoodsDetailTypeNormal];
    [self.navigationController pushViewController:detaiVc animated:true];
}
-(void)HotColletionViewTapMoreButton{
    NSLog(@"秒杀更多");
    SeckillViewController *killView = [[SeckillViewController alloc] initWithHeaderType:HeaderTypeBackAndThreePoint title:@"秒杀"];
    [self.navigationController pushViewController:killView animated:YES];
}
-(void)GroupBuyView:(GroupBugView *)groupView didSeletedItem:(NSString *)itemId{
    NSLog(@"%@", itemId);
    GoodsDetailViewController *detaiVc = [[GoodsDetailViewController alloc] initWithHeaderType:HeaderTypeBackAndThreePoint title:@"商品详情" GoodsDetailType:GoodsDetailTypeNormal];
    [self.navigationController pushViewController:detaiVc animated:true];
}
-(void)GroupBuyViewDidTapMoreButton{
    NSLog(@"团购更多");
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationRootTabbar object:nil userInfo:@{@"index":@"2"}];
}
#pragma mark *** Events ***
-(void)respondsToMoreGoodsBtn:(UIButton *)sender{
    NSLog(@"%@", sender.titleLabel.text);
}
#pragma mark *** getters ***
-(UIScrollView *)backScroView{
    if (!_backScroView) {
        _backScroView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, Screen_width, HeightExceptNaviAndTabbar)];
        CGFloat height = CGRectGetMaxY(self.moreGoodsBtn.frame);
        _backScroView.contentSize = CGSizeMake(Screen_width, height);
        _backScroView.backgroundColor = LH_RGBCOLOR(233, 233, 233);
        _backScroView.showsVerticalScrollIndicator = false;
        _backScroView.showsHorizontalScrollIndicator = false;
    }
    return _backScroView;
}
-(ScrollerView *)homeScrollView{
    if (!_homeScrollView) {
        _homeScrollView = [[ScrollerView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, 300*AdaptationWidth()) images:[@[@"gundong",@"gundong2",@"gundong3",@"gundong4"] mutableCopy]];
    }
    return _homeScrollView;
}
-(FourButtonView *)fourBtnView{
    if (!_fourBtnView) {
        _fourBtnView = [[FourButtonView alloc] initWithFrame:CGRectMake(0, CGRectYH(self.homeScrollView), Screen_width, 180*AdaptationWidth())];
        _fourBtnView.delegate = self;
    }
    return _fourBtnView;
}
-(HotCollectionView *)hotCollectionView{
    if (!_hotCollectionView) {
        _hotCollectionView = [[HotCollectionView alloc] initWithFrame:CGRectMake(0, CGRectYH(self.fourBtnView)+5, Screen_width, 315*AdaptationWidth())];
        _hotCollectionView.backgroundColor = LH_RandomColor;
        _hotCollectionView.delegate = self;
    }
    return _hotCollectionView;
}
-(GroupBugView *)groupView{
    if (!_groupView) {
        _groupView = [[GroupBugView alloc] initWithFrame:CGRectMake(0, CGRectYH(self.hotCollectionView)+5, Screen_width, 702*AdaptationWidth())];
        _groupView.backgroundColor = LH_RandomColor;
        _groupView.delegate = self;
    }
    return _groupView;
}
-(UIButton *)moreGoodsBtn{
    if (!_moreGoodsBtn) {
        _moreGoodsBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectYH(self.groupView), Screen_width*0.3, 80*AdaptationWidth())];
        _moreGoodsBtn.center = CGPointMake(self.view.center.x, _moreGoodsBtn.center.y);
        [_moreGoodsBtn setTitle:@"查看更多商品" forState:UIControlStateNormal];
        [_moreGoodsBtn setTitleColor:LH_RGBCOLOR(150, 150, 150) forState:UIControlStateNormal];
        _moreGoodsBtn.titleLabel.font = WFont(30);
        [_moreGoodsBtn setImage:MImage(@"more") forState:UIControlStateNormal];
        _moreGoodsBtn.titleEdgeInsets = UIEdgeInsetsMake(0, _moreGoodsBtn.imageView.frame.size.width-_moreGoodsBtn.frame.size.width+_moreGoodsBtn.titleLabel.intrinsicContentSize.width, 0, 0);
        _moreGoodsBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -_moreGoodsBtn.titleLabel.frame.size.width-_moreGoodsBtn.frame.size.width+_moreGoodsBtn.imageView.frame.size.width);
        [_moreGoodsBtn addTarget:self action:@selector(respondsToMoreGoodsBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreGoodsBtn;
}
@end
