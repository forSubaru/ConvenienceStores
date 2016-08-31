//
//  HotCollectionView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/8/31.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "HotCollectionView.h"
#import "HotCollectionViewCell.h"
#import "HotCollectionReusableView.h"
static NSString *const kReusableCoelcCellIdentifier = @"kReusableCoelcCellIdentifier";
static NSString *const kReusableheaderIdentifier = @"kReusableheaderIdentifier";

@implementation HotCollectionView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.collectionView];
    }
    return self;
}
#pragma mark *** CollecteDelegate ***
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HotCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kReusableCoelcCellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kReusableheaderIdentifier forIndexPath:indexPath];
    [headerView addSubview:self.hotBtn];
    [headerView addSubview:self.moreBtn];
    headerView.backgroundColor = [UIColor whiteColor];
    NSArray *timeArr = @[@"01",@":",@"27",@":",@"04"];
    for (int idx = 0; idx<timeArr.count; idx++) {
        BOOL time = idx%2==1?false:true;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectXW(self.hotBtn)+
                                                                   30*idx*AdaptationWidth()+(time?0:5)*AdaptationWidth(),
                                                                   15*AdaptationWidth(),
                                                                   time?28*AdaptationWidth():14*AdaptationWidth(),
                                                                   28*AdaptationWidth())];
        label.text = timeArr[idx];
        label.font = WFont(18);
        label.textAlignment = 1;
        label.layer.borderWidth = time?1:0;
        [headerView addSubview:label];
    }
    
    return headerView;

}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld", indexPath.row);
}
#pragma mark ***  ***
-(void)respondsToMoreBtn:(UIButton *)sender{
    NSLog(@"%@", sender.titleLabel.text);
}
#pragma mark *** getters ***
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLay = [[UICollectionViewFlowLayout alloc] init];
        flowLay.minimumLineSpacing = 0;
        flowLay.itemSize = CGSizeMake(Screen_width/4, 255*AdaptationWidth());
        flowLay.minimumInteritemSpacing = 0;
        flowLay.headerReferenceSize = CGSizeMake(Screen_width, 30);
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLay];
        _collectionView.dataSource = self;
        _collectionView.delegate =self;
        _collectionView.bounces = false;
        [_collectionView registerClass:[HotCollectionViewCell class] forCellWithReuseIdentifier:kReusableCoelcCellIdentifier];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kReusableheaderIdentifier];
        
    }
    return _collectionView;
}
-(UIButton *)hotBtn{
    if (!_hotBtn) {
        _hotBtn = [[UIButton alloc] initWithFrame:CGRectMake(2, 0, 120*AdaptationWidth(), 30)];
        [_hotBtn setImage:MImage(@"spike") forState:UIControlStateNormal];
        [_hotBtn setTitle:@"秒杀" forState:UIControlStateNormal];
        [_hotBtn setTitleColor:LH_RGBCOLOR(236, 120, 52) forState:UIControlStateNormal];
        _hotBtn.titleLabel.font =WFont(28);
    }
    return _hotBtn;
}
-(UIButton *)moreBtn{
        if (!_moreBtn) {
            _moreBtn = [[UIButton alloc] initWithFrame:CGRectMake(Screen_width-50, 0, 40, 30)];
            [_moreBtn setTitle:@"更多" forState:UIControlStateNormal];
            [_moreBtn setTitleColor:LH_RGBCOLOR(150, 150, 150) forState:UIControlStateNormal];
            _moreBtn.titleLabel.font = WFont(25);
            [_moreBtn setImage:MImage(@"arrow") forState:UIControlStateNormal];
            _moreBtn.titleEdgeInsets = UIEdgeInsetsMake(0, _moreBtn.imageView.frame.size.width-_moreBtn.frame.size.width+_moreBtn.titleLabel.intrinsicContentSize.width, 0, 0);
            _moreBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -_moreBtn.titleLabel.frame.size.width-_moreBtn.frame.size.width+_moreBtn.imageView.frame.size.width);
            [_moreBtn addTarget:self action:@selector(respondsToMoreBtn:) forControlEvents:UIControlEventTouchUpInside];
        }
        return _moreBtn;
}
@end
