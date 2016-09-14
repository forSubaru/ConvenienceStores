//
//  UILabel+ChangeTextPartFont.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/14.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ChangeTextPartFont)
+ (void)setLabeltextAttributes:(UILabel *)label withFont:(UIFont *)font range:(NSRange)range;
@end
