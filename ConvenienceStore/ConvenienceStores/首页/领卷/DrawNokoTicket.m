//
//  DrawNokoTicket.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/13.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "DrawNokoTicket.h"

@implementation DrawNokoTicket
- (instancetype)initWithFrame:(CGRect)frame buyPercent:(CGFloat)percent
{
    self = [super initWithFrame:frame];
    if (self) {
        _percent = percent;
        
        UILabel *buyLabel = [[UILabel alloc] initWithFrame:AdaptationFrame(30, 30, 60, 50)];
        buyLabel.font = WFont(20);
        buyLabel.textColor = [UIColor whiteColor];
        buyLabel.numberOfLines = 2;
        buyLabel.text = [NSString stringWithFormat:@"已抢%.0lf%%",percent*100];
        [self addSubview:buyLabel];
        
    }
    return self;
}
-(void)drawRect:(CGRect)rect{
    //1.获取画板（上下文）
    CGContextRef context = UIGraphicsGetCurrentContext();
    //2.设置画笔颜色
    CGContextSetStrokeColorWithColor(context, LH_RGBCOLOR(24, 140, 249).CGColor);
    //3.设置画笔宽度
    CGContextSetLineWidth(context, 5.0f);
    //方法1 CGContextAddArc
    //    参数：上下文，圆心，半径，起始角度，结束角度，方向 0顺1逆
    CGContextAddArc(context, self.bounds.size.width/2, self.bounds.size.height/2, 40*AdaptationWidth(), 0.75*M_PI, 2.25*M_PI, 0);
    CGContextStrokePath(context);
    
    
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    //3.设置画笔宽度
    CGContextSetLineWidth(context, 5.0f);
    //方法1 CGContextAddArc
    //    参数：上下文，圆心，半径，起始角度，结束角度，方向 0顺1逆
    
    CGFloat thePoint = _percent*1.5;
    
    CGContextAddArc(context, self.bounds.size.width/2, self.bounds.size.height/2, 40*AdaptationWidth(), 0.75*M_PI, (0.75+thePoint)*M_PI, 0);
    CGContextStrokePath(context);
    
    
    
    
    
    
}
@end
