//
//  RedPriceLabel.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/1.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "RedPriceLabel.h"

@implementation RedPriceLabel

- (instancetype)initWithFrame:(CGRect)frame string:(NSString *)string priceLabeltype:(PriceLabelType)labelType
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.letter];
        [self addSubview:self.price];
        self.price.text = string;
        if (labelType == PriceLabelTypeRedSmallLetterAndNumber) {
           
        }else if(labelType == PriceLabelTypeRedSameLetterAndNumber){
            self.letter.frame = CGRectMake(0, 0, 10, SelfView_height);
            self.price.frame = CGRectMake(CGRectXW(self.letter), 0, 45, SelfView_height);
        }else if (labelType == PriceLabelTypePriceWithLine) {
            self.letter.frame = CGRectMake(0, 0, 10, SelfView_height);
            self.price.frame = CGRectMake(CGRectXW(self.letter), 0, 45, SelfView_height);
            self.letter.textColor = LH_RGBCOLOR(151, 151, 151);
            self.price.textColor = self.letter.textColor;
            
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height/2+1, SelfView_width, 1)];
            
            lineView.backgroundColor = LH_RGBCOLOR(151, 151, 151);
            [self addSubview:lineView];
            
            
        }
    }
    return self;
}
-(UILabel *)letter{
    if (!_letter) {
        _letter = [[UILabel alloc] initWithFrame:CGRectMake(50*AdaptationWidth(), 0, 5, SelfView_height)];
        _letter.font = WFont(17);
        _letter.textColor = [UIColor redColor];
        _letter.text = @"¥";
    }
    return _letter;
}
-(UILabel *)price{
    if (!_price) {
        _price = [[UILabel alloc] initWithFrame:CGRectMake(CGRectXW(self.letter), 0, 40, SelfView_height)];
        _price.font = WFont(22);
        _price.textColor = [UIColor redColor];
        _price.text = @"88.0";
    }
    return _price;
}
@end
