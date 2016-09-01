//
//  SeckillHeaderView.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/1.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SeckillHeaderView : UIView
/**新产品多少个*/
@property (nonatomic,strong) UIButton *theNewGoods;
/**多少点开始的抢购*/
@property (nonatomic,strong) UILabel *buyingLabel;
/**即将开始*/
@property (nonatomic,strong) UILabel *willStartLabel;

- (instancetype)initWithFrame:(CGRect)frame timeArray:(NSArray *)arr;

@end
