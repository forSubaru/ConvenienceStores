//
//  NSString+JudgeTextsting.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/13.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JudgeTextsting)
//手机号码验证
+ (BOOL) validateMobile:(NSString *)mobile;
@end
