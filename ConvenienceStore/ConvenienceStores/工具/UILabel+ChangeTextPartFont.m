//
//  UILabel+ChangeTextPartFont.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/14.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "UILabel+ChangeTextPartFont.h"

@implementation UILabel (ChangeTextPartFont)
+ (void)setLabeltextAttributes:(UILabel *)label withFont:(UIFont *)font range:(NSRange)range {
    
    
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:label.text];
    [attri addAttribute:NSFontAttributeName value:font range:range];
    
    [label setAttributedText:attri];
}

@end
