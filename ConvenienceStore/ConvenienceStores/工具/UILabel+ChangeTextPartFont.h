//
//  UILabel+ChangeTextPartFont.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/14.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ChangeTextPartFont)
/**
 *  改变一句话某部分字体大小
 *
 *  @param label 改变的label
 *  @param font  改变的大小
 *  @param range 范围
 */
+ (void)setLabeltextAttributes:(UILabel *)label withFont:(UIFont *)font range:(NSRange)range;
/**
 *  改变一句话某部分字体颜色
 *
 *  @param label 改变的label
 *  @param color 改变的颜色
 *  @param range 范围
 */
+ (void)setLabeltextAttributes:(UILabel *)label withColor:(UIColor *)color range:(NSRange)range;

+ (void)setLabeltextWithLine:(UILabel *)label;

@end
