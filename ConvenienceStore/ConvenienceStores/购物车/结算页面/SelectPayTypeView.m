//
//  SelectPayTypeView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/24.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "SelectPayTypeView.h"

@implementation SelectPayTypeView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *backView = [[UIView alloc] initWithFrame:self.bounds];
        backView.backgroundColor = [UIColor blackColor];
        backView.alpha = 0.4;
        [self addSubview:backView];
        
        UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(30, self.center.y, Screen_width-60, 100)];
        whiteView.backgroundColor = [UIColor whiteColor];
        whiteView.layer.cornerRadius = 5;
        [self addSubview:whiteView];
        
        NSArray *titles = @[@"在线支付",@"货到付款"];
        for (int idx = 0; idx<titles.count; idx++) {
            UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(0, idx*50, whiteView.bounds.size.width, 50)];
            [btn setTitle:titles[idx] forState:0];
            [btn setTitleColor:LH_RGBCOLOR(60, 60, 60) forState:0];
            btn.titleLabel.font = WFont(30);
            [btn addTarget:self action:@selector(respondsToSelcBTn:) forControlEvents:UIControlEventTouchUpInside];
            [whiteView addSubview:btn];
        }
        
    }
    return self;
}
-(void)respondsToSelcBTn:(UIButton *)sender{
    if (_delegate && [_delegate respondsToSelector:@selector(selectedPayType:)]) {
        [_delegate selectedPayType:sender.titleLabel.text];
    };
    [self removeFromSuperview];
}
@end
