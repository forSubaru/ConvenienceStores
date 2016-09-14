//
//  SureChargeView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/13.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "SureChargeView.h"

@interface SureChargeView()
{
    NSString *_payMoney;
}
@end

@implementation SureChargeView
- (instancetype)initWithFrame:(CGRect)frame
               chargePhoneNum:(NSString *)phoneNum
                    withMoney:(NSString *)money
                     disMoney:(NSString *)disMoney
{
    self = [super initWithFrame:frame];
    if (self) {
        _payMoney = disMoney;
        
        UIView *backGrayView = [[UIView alloc] initWithFrame:self.bounds];
        backGrayView.backgroundColor = [UIColor blackColor];
        backGrayView.alpha = 0.5;
        [self addSubview:backGrayView];
        
        UIView *backWhite = [[UIView alloc] initWithFrame:AdaptationFrame(70, 300, 630, 365)];
        backWhite.backgroundColor = [UIColor whiteColor];
        [self addSubview:backWhite];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, backWhite.bounds.size.width, 80*AdaptationWidth())];
        label.font = WFont(36);
        label.text = @"选择支付方式";
        label.textAlignment = 1;
        [backWhite addSubview:label];
        
        UIButton *closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(backWhite.bounds.size.width-44*AdaptationWidth(), 0, 44*AdaptationWidth(), 44*AdaptationWidth())];
        [closeBtn setImage:MImage(@"chab") forState:0];
        [closeBtn addTarget:self action:@selector(removeSelfView) forControlEvents:UIControlEventTouchUpInside];
        [backWhite addSubview:closeBtn];
        
        UILabel *monLabel = [[UILabel alloc] initWithFrame:CGRectMake(16*AdaptationWidth(), CGRectYH(label), backWhite.bounds.size.width-10, 44*AdaptationWidth())];
        monLabel.text = [NSString stringWithFormat:@"%@元手机话费-%@",money,phoneNum];
        monLabel.font = WFont(30);
        monLabel.textColor = LH_RGBCOLOR(132, 132, 132);
        [backWhite addSubview:monLabel];
        
        NSArray *arr = @[@"weixintu",@"zhifubaotu"];
        for (int idx = 0; idx<arr.count; idx++) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0,CGRectYH(monLabel) + idx*114*AdaptationWidth(), backWhite.bounds.size.width, 114*AdaptationWidth())];
            [btn setImage:MImage(arr[idx]) forState:UIControlStateNormal];
            btn.tag = idx;
            [btn addTarget:self action:@selector(respondsToPay:) forControlEvents:UIControlEventTouchUpInside];
            [backWhite addSubview:btn];
        }
        
    }
    return self;
}
-(void)respondsToPay:(UIButton *)sender{
    if (sender.tag == 0) {
        NSLog(@"微信支付--%@",_payMoney);
    }else{
        NSLog(@"支付宝支付--%@",_payMoney);
    }
}
-(void)removeSelfView{
    [self removeFromSuperview];
}
@end
