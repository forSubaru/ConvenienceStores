//
//  BaseViewController.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/8/30.
//  Copyright © 2016年 王子豪. All rights reserved.
//

typedef enum : NSUInteger {
    HeaderTypeHomeVc,
    HeaderTypeSupermaket,
    HeaderTypeBackAndThreePoint,
    HeaderTypeOnlyBack
} HeaderType;

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
/**黄色背景*/
@property (nonatomic,strong) UIView *backView;
//首页VC
- (instancetype)initWithHeaderType:(HeaderType)headerType;

- (instancetype)initWithHeaderType:(HeaderType)headerType title:(NSString *)title;

@end
