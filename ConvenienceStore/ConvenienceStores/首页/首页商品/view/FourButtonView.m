//
//  FourButtonView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/8/31.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "FourButtonView.h"

@implementation FourButtonView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor  = [UIColor whiteColor];
        [self initUI];
    }
    return self;
}
#pragma mark *** events ***
-(void)respondsToItemBtn:(UIButton *)sender{
    NSLog(@"%@", sender.titleLabel.text);
}
#pragma mark *** 初始化界面 ***
-(void)initUI{
    NSArray *titleArr = @[@"超市",@"团购",@"在线充值",@"领卷"];
    NSArray *imageArr = @[@"supermarket",@"round",@"chongzhi",@"coupon"];
    
    for (int i = 0; i<titleArr.count; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        //设置大小和位置
        btn.frame = AdaptationFrame(50+i*180, 20, 105, 135);
        
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = WFont(25);
        btn.tag=i;
        [btn addTarget:self action:@selector(respondsToItemBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.adjustsImageWhenHighlighted = NO;
        [btn setImage:[UIImage imageNamed:imageArr[i]] forState:UIControlStateNormal];
        
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, -btn.imageView.frame.size.width, -btn.imageView.frame.size.height, 0);
        
        btn.imageEdgeInsets = UIEdgeInsetsMake(-btn.titleLabel.intrinsicContentSize.height, 0, 0, -btn.titleLabel.intrinsicContentSize.width);
        
        //添加按钮
        [self addSubview:btn];
    }

}
@end
