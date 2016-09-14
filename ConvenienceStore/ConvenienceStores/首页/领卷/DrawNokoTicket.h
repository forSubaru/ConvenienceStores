//
//  DrawNokoTicket.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/13.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawNokoTicket : UIView
@property (nonatomic,assign) CGFloat percent; /*百分比*/
- (instancetype)initWithFrame:(CGRect)frame buyPercent:(CGFloat)percent;

@end
