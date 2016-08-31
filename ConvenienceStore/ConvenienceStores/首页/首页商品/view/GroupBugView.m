//
//  GroupBugView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/8/31.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "GroupBugView.h"
#import "GroupCollectionViewCell.h"

static NSString *const kReusableheaderCellIdentifier = @"kReusableheaderCellIdentifier";
static NSString *const kReusablecollecCellIdentifier = @"kReusablecollecCellIdentifier";

@implementation GroupBugView

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
    return 6;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GroupCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kReusablecollecCellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kReusableheaderCellIdentifier forIndexPath:indexPath];
    [headerView addSubview:self.hotBtn];
    [headerView addSubview:self.moreBtn];
    headerView.backgroundColor = [UIColor whiteColor];
   
    return headerView;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld", indexPath.row);
}
#pragma mark *** events ***
-(void)respondsToMoreBtn:(UIButton *)sender{
    NSLog(@"%@", sender.titleLabel.text);
}
#pragma mark *** getters ***
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLay = [[UICollectionViewFlowLayout alloc] init];
        flowLay.minimumLineSpacing = 0;
        flowLay.itemSize = CGSizeMake(Screen_width/3, 322*AdaptationWidth());
        flowLay.minimumInteritemSpacing = 0;
        flowLay.headerReferenceSize = CGSizeMake(Screen_width, 30);
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLay];
        _collectionView.dataSource = self;
        _collectionView.delegate =self;
        _collectionView.bounces = false;
        [_collectionView registerClass:[GroupCollectionViewCell class] forCellWithReuseIdentifier:kReusablecollecCellIdentifier];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kReusableheaderCellIdentifier];
    }
    return _collectionView;
}
-(UIButton *)hotBtn{
    if (!_hotBtn) {
        _hotBtn = [[UIButton alloc] initWithFrame:CGRectMake(2, 0, 120*AdaptationWidth(), 30)];
        [_hotBtn setImage:MImage(@"corps") forState:UIControlStateNormal];
        [_hotBtn setTitle:@"团购" forState:UIControlStateNormal];
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
