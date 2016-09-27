//
//  SearchGoodsViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/26.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "SearchGoodsViewController.h"

@interface SearchGoodsViewController ()<SearchViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSArray <NSString *>*_recentSearchData;
    NSArray <NSString *>*_dataSource;
    NSArray <NSString *>*_minaSerarch;
}
/**搜索栏*/
@property (nonatomic,strong) SearchView *topSearView;
/**搜索结果*/
@property (nonatomic,strong) UICollectionView *collectionView;

@end

@implementation SearchGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initUI];
}
#pragma mark *** 初始化数据 ***
-(void)initData{
    _recentSearchData = @[@"纸尿裤",@"奶粉",@"手办"];
    _minaSerarch = @[@"爬行垫",@"亲子装",@"婴儿床",@"纸尿裤",@"奶粉",@"手办",@"纸尿裤",@"奶粉",@"手办"];
    _dataSource = @[@"爬行垫",@"亲子装",@"婴儿床",@"纸尿裤",@"奶粉",@"手办",@"纸尿裤",@"奶粉",@"手办"];
}
#pragma mark *** 初始化界面 ***
-(void)initUI{
    [self.backView addSubview:self.topSearView];
    [self initSearchContent];
}
-(void)initSearchContent{
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 74, Screen_width, 450*AdaptationWidth())];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    
    NSArray *titlesArrs = @[@"最近搜索",@"大家都在搜"];
    NSArray *imageArrs = @[@"rej",@"rej"];
    for (int idx = 0; idx<titlesArrs.count; idx++) {
        UIImageView *image = [[UIImageView alloc] initWithFrame:AdaptationFrame(10, 23+150*idx, 35, 27)];
        image.contentMode = UIViewContentModeScaleAspectFit;
        image.image = MImage(imageArrs[idx]);
        [backView addSubview:image];
        
        UILabel *label = [[UILabel alloc] initWithFrame:AdaptationFrame(CGRectXW(image)/AdaptationWidth(), 150*idx, 150, 77)];
        label.font = WFont(30);
        label.textColor = LH_RGBCOLOR(150, 150, 150);
        label.text = titlesArrs[idx];
        [backView addSubview:label];
    }
    
    
    
    
    for (int idx = 0; idx<_recentSearchData.count; idx++) {
        CGFloat btnWidth = 0;
        btnWidth = (_recentSearchData[idx].length*25+40)*AdaptationWidth();
        UIButton *btn = [[UIButton alloc] initWithFrame:AdaptationFrame(10+133*idx, 80, 113, 61)];
        [btn setTitle:_recentSearchData[idx] forState:0];
        [btn setTitleColor:[UIColor blackColor] forState:0];
        btn.layer.borderColor = mainGrayColor.CGColor;
        btn.layer.borderWidth = 1;
        btn.titleLabel.font = WFont(30);
        [backView addSubview:btn];
    }
    
    for (int idx = 0; idx<_minaSerarch.count; idx++) {
        CGFloat btnWidth = 0;
        btnWidth = (_minaSerarch[idx].length*25+40)*AdaptationWidth();
        UIButton *btn = [[UIButton alloc] initWithFrame:AdaptationFrame(10+133*(idx%5), 249+(idx/5*88), 113, 61)];
        [btn setTitle:_minaSerarch[idx] forState:0];
        [btn setTitleColor:[UIColor blackColor] forState:0];
        btn.layer.borderColor = mainGrayColor.CGColor;
        btn.layer.borderWidth = 1;
        btn.titleLabel.font = WFont(30);
        [backView addSubview:btn];
    }
    
}

-(void)SearchView:(SearchView *)searView didSelectedSearchButton:(UIButton *)sender{
    NSLog(@"搜索东西");
}
-(void)respondsToCancelBtn:(UIButton *)sender{
    NSLog(@"取消");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(SearchView *)topSearView{
    if (!_topSearView) {
        _topSearView = [[SearchView alloc] initWithFrame:CGRectMake(0, 0, 500*AdaptationWidth(), 50*AdaptationWidth())];
        _topSearView.center = CGPointMake(self.backView.center.x, self.backView.center.y-20);

        _topSearView.delegate = self;
        
        UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(Screen_width-50, 0, 44, 44)];
        cancelBtn.titleLabel.font = WFont(30);
        [cancelBtn setTitle:@"取消" forState:0];
        [cancelBtn setTitleColor:LH_RGBCOLOR(52, 0, 6) forState:0];
        [cancelBtn addTarget:self action:@selector(respondsToCancelBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.backView addSubview:cancelBtn];
    }
    return _topSearView;
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 10;
        flowLayout.itemSize = AdaptationSize(230, 308);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 74, Screen_width, Screen_height-74) collectionViewLayout:flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
    }
    return _collectionView;
}
@end
