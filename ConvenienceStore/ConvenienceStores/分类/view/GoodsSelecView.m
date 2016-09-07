

//
//  GoodsSelecView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/5.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "GoodsSelecView.h"
#import "TypesCollectionViewCell.h"

#define leftTag 10
#define topTag 20

static NSString *const kReusableTypeCellIdentifier = @"TypecellIdentifier";

@interface GoodsSelecView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

/**左边数据*/
@property (nonatomic,strong) NSArray *goodsArray;
/**左边视图*/
@property (nonatomic,strong) UIScrollView *leftScroView;

/**上边数据*/
@property (nonatomic,strong) NSArray<NSString *> *topArray;
/**上边view*/
@property (nonatomic,strong) UIScrollView *topScroView;

@end
@implementation GoodsSelecView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initData];
        [self initUI];
    }
    return self;
}
#pragma mark *** 初始化数据 ***
-(void)initData{
    _goodsArray = @[@"食品零食",@"饮料冷饮",@"牛奶乳品",@"礼品",@"速冻食品",@"日用百货",@"办公用品"];
    _topArray = @[@"全部",@"饼干糕点",@"膨化食品",@"干果类"];
}
#pragma mark *** 初始化界面 ***
-(void)initUI{
    [self initLeftView];
    [self initTopView];
    [self addSubview:self.collectionView];
}

-(void)initLeftView{
    UIScrollView *backView = [[UIScrollView alloc] initWithFrame:AdaptationFrame(0, 0, 180, self.bounds.size.height/AdaptationWidth())];
    backView.backgroundColor = [UIColor whiteColor];
    NSInteger count = _goodsArray.count;
    backView.contentSize = AdaptationSize(180, 85*count);
    backView.showsVerticalScrollIndicator = false;
    [self addSubview:backView];
    self.leftScroView = backView;
    
    for (int idx = 0; idx<count; idx++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:AdaptationFrame(0, idx*85, 180, 85)];
        [btn setTitle:_goodsArray[idx] forState:UIControlStateNormal];
        btn.titleLabel.font = WFont(32);
        [btn setTitleColor:LH_RGBCOLOR(40, 40, 40) forState:UIControlStateNormal];
        [btn setTitleColor:LH_RGBCOLOR(243, 191, 8) forState:UIControlStateSelected];
        btn.backgroundColor = LH_RGBCOLOR(241, 242, 247);
        btn.tag = idx+leftTag;
        [btn addTarget:self action:@selector(respondsToLeftBtn:) forControlEvents:UIControlEventTouchUpInside];
        [backView addSubview:btn];
        if (idx==0) {
            btn.selected = true;
            btn.backgroundColor = [UIColor whiteColor];
        }
    }
    
}

-(void)initTopView{
    UIScrollView *backView = [[UIScrollView alloc] initWithFrame:AdaptationFrame(CGRectXW(self.leftScroView)/AdaptationWidth(), 0, 570, 85)];
    backView.backgroundColor = [UIColor whiteColor];
    NSInteger count = _topArray.count;
    backView.contentSize = AdaptationSize(130*count, 85);
    backView.showsHorizontalScrollIndicator = false;
    [self addSubview:backView];
    self.topScroView = backView;
    
    CGFloat gap = 0;
    for (int idx = 0; idx<count; idx++) {
        CGFloat theWidth = _topArray[idx].length *45;
        UIButton *btn = [[UIButton alloc] initWithFrame:AdaptationFrame(gap, 0, theWidth, 85)];
        [btn setTitle:_topArray[idx] forState:UIControlStateNormal];
        btn.titleLabel.font = WFont(32);
        [btn setTitleColor:LH_RGBCOLOR(40, 40, 40) forState:UIControlStateNormal];
        [btn setTitleColor:LH_RGBCOLOR(243, 191, 8) forState:UIControlStateSelected];
        btn.tag = idx + topTag;
        [btn addTarget:self action:@selector(respondsToTopBtn:) forControlEvents:UIControlEventTouchUpInside];
        [backView addSubview:btn];
        if (idx==0) {
            btn.selected = true;
        }
        gap +=theWidth;
        backView.contentSize = AdaptationSize(gap, 85);
    }
    
}
#pragma mark *** delegate ***
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TypesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kReusableTypeCellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[TypesCollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, 285, 337)];
        
    }

    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
#pragma mark *** events ***
-(void)respondsToLeftBtn:(UIButton *)sender{
    
    if (_delegate && [_delegate respondsToSelector:@selector(GoodsSelecView:didSelectedLeftViewTitle:)]) {
        [_delegate GoodsSelecView:self didSelectedLeftViewTitle:sender.titleLabel.text];
    };
    
    for (UIButton *btn in self.leftScroView.subviews) {
        if (btn.tag<leftTag) {
            return;
        }
        if (sender.tag == btn.tag) {
            btn.selected = true;
            btn.backgroundColor = [UIColor whiteColor];
        }else{
            btn.selected = false;
            btn.backgroundColor = LH_RGBCOLOR(241, 242, 247);
        }
    }
    
}
-(void)respondsToTopBtn:(UIButton *)sender{
    for (UIButton *btn in self.topScroView.subviews) {
        if (btn.tag<topTag) {
            return;
        }
        if (sender.tag == btn.tag) {
            btn.selected = true;
        }else{
            btn.selected = false;
        }
    }
}
#pragma mark *** getters ***
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLay = [[UICollectionViewFlowLayout alloc] init];
        flowLay.minimumLineSpacing = 0;
        flowLay.itemSize = AdaptationSize(285, 337);
        flowLay.minimumInteritemSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(CGRectXW(self.leftScroView), CGRectYH(self.topScroView), Screen_width-self.leftScroView.bounds.size.width, 980*AdaptationWidth()) collectionViewLayout:flowLay];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.delegate =self;
        _collectionView.bounces = false;
        _collectionView.showsVerticalScrollIndicator = false;
        [_collectionView registerClass:[TypesCollectionViewCell class] forCellWithReuseIdentifier:kReusableTypeCellIdentifier];
        
    }
    return _collectionView;
}
@end
