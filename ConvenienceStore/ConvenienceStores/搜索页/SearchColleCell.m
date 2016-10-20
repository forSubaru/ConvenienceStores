//
//  SearchColleCell.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/28.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "SearchColleCell.h"

@implementation SearchColleCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.cellImage];
        [self.contentView addSubview:self.cellTitle];
        [self.contentView addSubview:self.cellPrice];
    }
    return self;
}
#pragma mark *** getters ***
-(UIImageView *)cellImage{
    if (!_cellImage) {
        _cellImage = [[UIImageView alloc] initWithFrame:AdaptationFrame(0, 0, 225, 225)];
        _cellImage.image = MImage(@"fangbianmian");
    }
    return _cellImage;
}
-(UILabel *)cellTitle{
    if (!_cellTitle) {
        _cellTitle = [[UILabel alloc] initWithFrame:AdaptationFrame(10, CGRectYH(self.cellImage)/AdaptationWidth()+5, 225, 30)];
        _cellTitle.text = @"绿箭口香糖唐";
        _cellTitle.font  =WFont( 28);
        _cellTitle.textAlignment = 0;
        
    }
    return _cellTitle;
}
-(RedPriceLabel *)cellPrice{
    if (!_cellPrice) {
        _cellPrice = [[RedPriceLabel alloc] initWithFrame:AdaptationFrame(10, CGRectYH(self.cellTitle)/AdaptationWidth()+5, 150, 30) string:@"59.44" priceLabeltype:PriceLabelTypeRedSameLetterAndNumber];
        _cellPrice.letter.font = WFont(20);
        _cellPrice.price.font = WFont(30);
    }
    return _cellPrice;
}
@end
