//
//  MyPointHeadView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/14.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "MyPointHeadView.h"

@implementation MyPointHeadView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.pointNum];
    }
    return self;
}
#pragma mark *** getters ***
-(UILabel *)pointNum{
    if (!_pointNum) {
        
        UIButton *viewBtn = [[UIButton alloc]initWithFrame:AdaptationFrame(9, 36, 44, 48)];
        [viewBtn setImage:MImage(@"jinbi") forState:0];
        [self addSubview:viewBtn];
        
        _pointNum = [[UILabel alloc] initWithFrame:AdaptationFrame(53, CGRectY(viewBtn)/AdaptationWidth(), 115, 48)];
        _pointNum.text = @"0积点";
        _pointNum.font = WFont(35);
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"0积点"];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0,1)];
        _pointNum.attributedText = str;
    }
    return _pointNum;
}

@end
