//
//  ShopCartTopHeadView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/19.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "ShopCartTopHeadView.h"

@implementation ShopCartTopHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *memberBtn = [[UIButton alloc] initWithFrame:AdaptationFrame(15, 15, 44, 51)];
        [memberBtn setImage:MImage(@"point") forState:0];
        [self addSubview:memberBtn];
        UILabel *memLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectXW(memberBtn), CGRectY(memberBtn), 250, 51*AdaptationWidth())];
        memLabel.text = @"会员尊享购物满20元免运费";
        memLabel.font = WFont(30);
        memLabel.textColor = LH_RGBCOLOR(68, 68, 68);
        [self addSubview:memLabel];
        [UILabel setLabeltextAttributes:memLabel withColor:[UIColor redColor] range:NSMakeRange(7, 2)];
        
        UILabel *disLab = [[UILabel   alloc] initWithFrame:AdaptationFrame(15, CGRectYH(memLabel)/AdaptationWidth()+46, 128, 61)];
        disLab.textColor = memLabel.textColor;
        disLab.font = memLabel.font;
        disLab.text = @"满减优惠";
        [self addSubview:disLab];
        
        NSArray *arr = @[@"满20减1元",@"满50减3元"];
        for (int idx = 0; idx<arr.count; idx++) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectXW(disLab)+5+194*AdaptationWidth()*idx, CGRectY(disLab), 161*AdaptationWidth(), 61*AdaptationWidth())];
            [btn setTitleColor:[UIColor redColor] forState:0];
            btn.titleLabel.font = WFont(25);
            btn.layer.borderColor = mainGrayColor.CGColor;
            btn.layer.borderWidth = 1;
            [btn setTitle:arr[idx] forState:0];
            [self addSubview:btn];
            
        }
    }
    return self;
}

@end
