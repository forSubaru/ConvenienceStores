//
//  GroupBuyViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/8/29.
//  Copyright © 2016年 王子豪. All rights reserved.
//
static NSString *const kReusableCoelcCellIdentifier = @"kheacellIdentifier";

#import "GroupBuyViewController.h"
#import "GroupHeaderView.h"
#import "GroupVariouGoodsView.h"
#import "GroupVariousCell.h"
@interface GroupBuyViewController ()<GroupHeaderViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSArray *_dataSource;
}
/**背景滚动图*/
@property (nonatomic,strong) UIScrollView *backScrolView;

/**头部选择*/
@property (nonatomic,strong) GroupHeaderView *headView;
/**滚动视图*/
@property (nonatomic,strong) ScrollerView *scroView;
/**各种图片*/
@property (nonatomic,strong) GroupVariouGoodsView *variouView;
/**collection图片*/
@property (nonatomic,strong) UICollectionView *collectionView;

@end

@implementation GroupBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initUI];
}
#pragma mark *** 初始化数据 ***
-(void)initData{
    _dataSource = @[@"1",@"2",@"3",@"33",@"2"];
}
#pragma mark *** 初始化界面 ***
-(void)initUI{
    [self.view addSubview:self.backScrolView];
    [self.backScrolView addSubview:self.headView];
    [self.backScrolView addSubview:self.scroView];
    [self.backScrolView addSubview:self.variouView];
    [self.backScrolView addSubview:self.collectionView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
#pragma mark *** Delegate ***
//点击头部标题
-(void)GroupHeaderView:(GroupHeaderView *)groupView didSelectedButtonTitle:(NSString *)title{
    NSLog(@"%@", title);
}
#pragma mark *** collectionDelegate ***
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataSource.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GroupVariousCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kReusableCoelcCellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    GoodsDetailViewController *detail = [[GoodsDetailViewController alloc] initWithHeaderType:HeaderTypeBackAndThreePoint title:@"团购商品详情" GoodsDetailType:GoodsDetailTypeGroupDetail];
    [self.navigationController pushViewController:detail animated:true];
}
#pragma mark *** getters ***
-(UIScrollView *)backScrolView{
    if (!_backScrolView) {
        _backScrolView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, Screen_width, HeightExceptNaviAndTabbar)];
        _backScrolView.contentSize = CGSizeMake(Screen_width, CGRectGetMaxY(self.collectionView.frame));
        _backScrolView.backgroundColor = [UIColor whiteColor];
        
    }
    return _backScrolView;
}
-(GroupHeaderView *)headView{
    if (!_headView) {
        _headView = [[GroupHeaderView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, 44)];
        _headView.delegate = self;
    }
    return _headView;
}
-(ScrollerView *)scroView{
    if (!_scroView) {
        _scroView = [[ScrollerView alloc] initWithFrame:CGRectMake(0, CGRectYH(self.headView), Screen_width, 300*AdaptationWidth()) images:[@[@"ad_image.jpg",@"ad_image2.jpg",@"ad_image3.jpg"] mutableCopy]];
    }
    return _scroView;
}
-(GroupVariouGoodsView *)variouView{
    if (!_variouView) {
        _variouView = [[GroupVariouGoodsView alloc] initWithFrame:CGRectMake(0, CGRectYH(self.scroView)+10, Screen_width, 0*AdaptationWidth()) imageArr:@[@"ad_image.jpg",@"ad_image2.jpg",@"ad_image3.jpg",@"ad_image",@"ad_image2",@"ad_image3",@"ad_image"]];
    }
    return _variouView;
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLay = [[UICollectionViewFlowLayout alloc] init];
        flowLay.minimumLineSpacing = 10;
        flowLay.itemSize = CGSizeMake(Screen_width/2-3, 555*AdaptationWidth());
        flowLay.minimumInteritemSpacing = 6;
        NSLog(@"----%ld", _dataSource.count/2);
        BOOL isEvenNumber = _dataSource.count%2==0?true:false;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectYH(self.variouView)+10, Screen_width, (_dataSource.count/2+(isEvenNumber?0:1))*(555*AdaptationWidth()+10)+44) collectionViewLayout:flowLay];
        _collectionView.backgroundColor = LH_RGBCOLOR(233, 233, 233);
        _collectionView.dataSource = self;
        _collectionView.delegate =self;
        _collectionView.bounces = false;
        [_collectionView registerClass:[GroupVariousCell class] forCellWithReuseIdentifier:kReusableCoelcCellIdentifier];
        
    }
    return _collectionView;
}
@end
