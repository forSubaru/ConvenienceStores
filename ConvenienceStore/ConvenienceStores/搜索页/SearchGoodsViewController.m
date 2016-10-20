//
//  SearchGoodsViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/26.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "SearchGoodsViewController.h"
#import "SearchColleCell.h"
static NSString *const kReusableCellIdentifier = @"sraccellIdentifier";

@interface SearchGoodsViewController ()<SearchViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSArray <NSString *>*_recentSearchData;
    NSArray <NSString *>*_dataSource;
    NSArray <NSString *>*_minaSerarch;
}
/**搜索栏*/
@property (nonatomic,strong) SearchView *topSearView;
/**搜索view*/
@property (nonatomic,strong) UIView *searchBackView;

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
    self.searchBackView = backView;
    [self.view addSubview:backView];
    
    
    NSArray *titlesArrs = @[@"最近搜索",@"大家都在搜"];
    NSArray *imageArrs = @[@"rej",@"sous"];
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
        [btn addTarget:self action:@selector(respondsToClickButtonTitle:) forControlEvents:UIControlEventTouchUpInside];
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
        [btn addTarget:self action:@selector(respondsToClickButtonTitle:) forControlEvents:UIControlEventTouchUpInside];
        [backView addSubview:btn];
    }
    
}
#pragma mark *** clickEvents ***
-(void)respondsToClickButtonTitle:(NSString *)title{
    
    NSLog(@"%@", title);
    self.searchBackView.hidden = true;
    [self.view addSubview:self.collectionView];
    
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
#pragma mark *** collectViewDelegate ***
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataSource.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SearchColleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kReusableCellIdentifier forIndexPath:indexPath];
    
    
    return cell;
    
}
#pragma mark *** getters ***
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
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(10*AdaptationWidth(), 74, Screen_width-20*AdaptationWidth(), Screen_height-74) collectionViewLayout:flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[SearchColleCell class] forCellWithReuseIdentifier:kReusableCellIdentifier];
        _collectionView.backgroundColor = mainBackGrayColor;
    }
    return _collectionView;
}
@end
