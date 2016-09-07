//
//  GoodsDetailViewController.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/5.
//  Copyright © 2016年 王子豪. All rights reserved.
//
typedef enum : NSUInteger {
    GoodsDetailTypeGroupDetail,
    GoodsDetailTypeNormal
} GoodsDetailType;
#import "BaseViewController.h"
#import "DetailGroupView.h"
#import "DetailNormalView.h"
@interface GoodsDetailViewController : BaseViewController
- (instancetype)initWithHeaderType:(HeaderType)headerType title:(NSString *)title GoodsDetailType:(GoodsDetailType)type;

@end
