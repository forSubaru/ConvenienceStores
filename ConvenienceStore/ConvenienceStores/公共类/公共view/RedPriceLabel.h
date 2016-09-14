//
//  RedPriceLabel.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/1.
//  Copyright © 2016年 王子豪. All rights reserved.
//
typedef enum : NSUInteger {
    PriceLabelTypeRedSmallLetterAndNumber,
    PriceLabelTypeRedSameLetterAndNumber,
    PriceLabelTypeBlackSmallLetterAndNumber,
    PriceLabelTypePriceWithLine
} PriceLabelType;
#import <UIKit/UIKit.h>

@interface RedPriceLabel : UIView
/**符号*/
@property (nonatomic,strong) UILabel *letter;
/**价格*/
@property (nonatomic,strong) UILabel *price;
/**划线*/
@property (nonatomic,strong) UIView *lineView;


- (instancetype)initWithFrame:(CGRect)frame string:(NSString *)string priceLabeltype:(PriceLabelType)labelType;

@end
