//
//  StartSeachShopView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/10/24.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "StartSeachShopView.h"
#import "ApplyForJoinViewController.h"
@implementation StartSeachShopView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = true;
        UIView *backView = [[UIView alloc] initWithFrame:self.bounds];
        backView.backgroundColor = [UIColor blackColor];
        backView.alpha = 0.7;
        [self addSubview:backView];
        
        UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(20, self.center.y-50, Screen_width-40, 100)];
        whiteView.backgroundColor = [UIColor whiteColor];
        whiteView.layer.cornerRadius = 10;
        whiteView.layer.masksToBounds = YES;
        
        [self addSubview:whiteView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, self.center.y-50, Screen_width-40, 50)];
        label.font = WFont(30);
        label.textAlignment = 1;
        label.text = @"很抱歉，你附近没有家家电服务站";
        label.textColor = LH_RGBCOLOR(160, 160, 160);
        [self addSubview:label];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(20, self.center.y-1, Screen_width-40, 1)];
        lineView.backgroundColor = LH_RGBCOLOR(60, 60, 60);
        [self addSubview:lineView];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, self.center.y, Screen_width-40, 50)];
        [btn setTitle:@"立即加盟" forState:UIControlStateNormal];
        btn.titleLabel.font = WFont(30);
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(respondsTobtn) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:btn];
    }
    return self;
}
-(void)respondsTobtn{
    ApplyForJoinViewController *app = [[ApplyForJoinViewController alloc] initWithHeaderType:HeaderTypeOnlyBack title:@"申请加盟" hideTabbar:YES];
    [self.viewController presentViewController:app animated:true completion:nil];
}
@end
