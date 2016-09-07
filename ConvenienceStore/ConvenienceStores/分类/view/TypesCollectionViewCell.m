//
//  TypesCollectionViewCell.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/5.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "TypesCollectionViewCell.h"
@interface TypesCollectionViewCell()
/**添加按钮*/
@property (nonatomic,strong) UIButton *addBtn;

@end
@implementation TypesCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.cellImage];
        [self addSubview:self.cellLabel];
        [self addSubview:self.cellPrice];
        [self addSubview:self.addBtn];
    }
    return self;
}
#pragma mark *** getters ***
-(void)respondsToAddBtn{
    NSLog(@"%@", self.cellLabel.text);
}
-(UIImageView *)cellImage{
    if (!_cellImage) {
        _cellImage = [[UIImageView alloc] initWithFrame:AdaptationFrame(0, 0, 287, 227)];
        _cellImage.image = MImage(@"fangbianmian");
        
    }
    return _cellImage;
}
-(UILabel *)cellLabel{
    if (!_cellLabel) {
        _cellLabel = [[UILabel alloc] initWithFrame:AdaptationFrame(0, CGRectYH(self.cellImage)/AdaptationWidth(), 287, 44)];
        _cellLabel.text = @"康师傅红烧牛肉面";
        _cellLabel.textAlignment = 1;
        _cellLabel.font = WFont(31);
    }
    return _cellLabel;
}
-(RedPriceLabel *)cellPrice{
    if (!_cellPrice) {
        _cellPrice = [[RedPriceLabel alloc] initWithFrame:AdaptationFrame(15, CGRectYH(self.cellLabel)/AdaptationWidth(), 120, 31) string:@"59.40" priceLabeltype:PriceLabelTypeRedSmallLetterAndNumber];
        _cellPrice.letter.frame = CGRectMake(0, 0, 10, 22);
        _cellPrice.letter.font = WFont(19);
        _cellPrice.price.font = WFont(25);
        _cellPrice.price.frame = CGRectMake(CGRectXW(_cellPrice.letter)-3, 0, 45, 22);
    }
    return _cellPrice;
}
-(UIButton *)addBtn{
    if (!_addBtn) {
        _addBtn = [[UIButton alloc] initWithFrame:AdaptationFrame(247, CGRectYH(self.cellLabel)/AdaptationWidth()+5, 33, 33)];
        [_addBtn setImage:MImage(@"jia") forState:UIControlStateNormal];
        [_addBtn addTarget:self action:@selector(respondsToAddBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addBtn;
}
@end
