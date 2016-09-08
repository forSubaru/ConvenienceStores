//
//  GroupVariousCell.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/7.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "GroupVariousCell.h"

@implementation GroupVariousCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.cellImage.frame = CGRectMake(0, 0, self.bounds.size.width, 370*AdaptationWidth());
        self.cellName.frame = CGRectMake(5, CGRectYH(self.cellImage)+5, self.bounds.size.width, 60*AdaptationWidth());
        self.cellName.numberOfLines = 2;
        self.cellName.text = @"超值两件套装，出低价销售各 超细纤维超级材质还有什么能写的";
        self.cellScaleLabel.frame = CGRectMake(CGRectX(self.cellName), CGRectYH(self.cellName)+5, self.bounds.size.width/2, 30*AdaptationWidth());
        self.cellPrice.frame = CGRectMake(5, CGRectYH(self.cellScaleLabel)+10, self.bounds.size.width, 44*AdaptationWidth());
        
        self.cellPrice.letter.frame = CGRectMake(0, -5, 8, self.cellPrice.bounds.size.height);
        self.cellPrice.price.frame = CGRectMake(CGRectXW(self.cellPrice.letter), -5, 40, self.cellPrice.bounds.size.height);
        self.cellPrice.letter.font = WFont(20);
        self.cellPrice.price.font =WFont(30);
        
        [self.cellScaleLabel removeFromSuperview];
        [self addSubview:self.cellPriceLabel];
        [self addSubview:self.cellSellsNumber];
    }
    return self;
}
-(RedPriceLabel *)cellPriceLabel{
    if (!_cellPriceLabel) {
        _cellPriceLabel = [[RedPriceLabel alloc] initWithFrame:CGRectMake(CGRectX(self.cellName), CGRectYH(self.cellName)+5, 105*AdaptationWidth(), 30*AdaptationWidth()) string:@"200.00" priceLabeltype:PriceLabelTypePriceWithLine];
        _cellPriceLabel.price.font = WFont(23);
        _cellPriceLabel.letter.font = WFont(23);
        
    }
    return _cellPriceLabel;
}
-(UILabel *)cellSellsNumber{
    if (!_cellSellsNumber) {
        _cellSellsNumber = [[UILabel alloc] initWithFrame:CGRectMake(253*AdaptationWidth(), CGRectYH(self.cellImage)+121*AdaptationWidth(), 50, 44*AdaptationWidth())];
        _cellSellsNumber.font = WFont(27);
        _cellSellsNumber.textColor = mainGrayColor;
        _cellSellsNumber.text = @"7件已售";
        
    }
    return _cellSellsNumber;
}
@end
