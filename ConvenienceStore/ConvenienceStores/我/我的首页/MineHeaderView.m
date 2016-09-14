//
//  MineHeaderView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/13.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "MineHeaderView.h"
@implementation MineHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *backImage = [[UIImageView alloc] initWithFrame:AdaptationFrame(0, 0, Screen_width/AdaptationWidth(), 237)];
        backImage.image = MImage(@"beijing");
        [self addSubview:backImage];
        [self addSubview:self.headImage];
        [self addSubview:self.headName];
        [self addSubview:self.phoneNum];
        [self addSubview:self.changePerInfo];
        [self initThreeButton];
    }
    return self;
}
//三个按钮
-(void)initThreeButton{
    
    UIView *backView = [[UIView alloc] initWithFrame:AdaptationFrame(0, 237, Screen_width/AdaptationWidth(), 110)];
    backView.backgroundColor = [UIColor whiteColor];
    [self addSubview:backView];
    
    NSArray *title = @[@"我的订单",@"积点",@"优惠券"];
    NSArray *images = @[@"dingdan",@"jidian",@"quan"];
    for (int i = 0; i<title.count; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:AdaptationFrame(90+i*233, 237, 122, 110)];
        [btn setTitle:title[i] forState:UIControlStateNormal];
        [btn setTitleColor:LH_RGBCOLOR(87, 87, 87) forState:UIControlStateNormal];
        btn.titleLabel.font = WFont(25);
        [btn addTarget:self action:@selector(respondsToItemBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [btn setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, -btn.imageView.frame.size.width, -btn.imageView.frame.size.height, 0);
        
        btn.imageEdgeInsets = UIEdgeInsetsMake(-btn.titleLabel.intrinsicContentSize.height, 0, 0, -btn.titleLabel.intrinsicContentSize.width);
        
        //添加按钮
        [self addSubview:btn];
        
    }

}
-(void)respondsToItemBtn:(UIButton *)sender{
    NSLog(@"%@", sender.titleLabel.text);
    if (_delegate && [_delegate respondsToSelector:@selector(MineHeaderView:didSelectedItem:)]) {
        [_delegate MineHeaderView:self didSelectedItem:sender.titleLabel.text];
    };
}
-(void)respondsToClickHead{
    NSLog(@"头像");
    if (_delegate && [_delegate respondsToSelector:@selector(MineHeaderView:didSelectedItem:)]) {
        [_delegate MineHeaderView:self didSelectedItem:@"头像"];
    };
}
-(void)respondsToChangeInfo{
    NSLog(@"点击修改信息");
    if (_delegate && [_delegate respondsToSelector:@selector(MineHeaderView:didSelectedItem:)]) {
        [_delegate MineHeaderView:self didSelectedItem:@"修改信息"];
    };
}

#pragma mark *** getters ***
-(UIButton *)headImage{
    if (!_headImage) {
        _headImage = [[UIButton alloc] initWithFrame:AdaptationFrame(40, 40, 145, 145)];
        _headImage.layer.cornerRadius = _headImage.bounds.size.height/2;
        _headImage.layer.masksToBounds = true;
        _headImage.layer.borderWidth = 5;
        _headImage.layer.borderColor = LH_RGBCOLOR(252, 238, 127).CGColor;
        [_headImage setBackgroundImage:MImage(@"icon") forState:0];
        [_headImage addTarget:self action:@selector(respondsToClickHead) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headImage;
}
-(UILabel *)headName{
    if (!_headName) {
        _headName = [[UILabel alloc] initWithFrame:AdaptationFrame(CGRectXW(self.headImage)/AdaptationWidth()+16, 66, 250, 60)];
        _headName.font = WFont(28);
        _headName.textColor = LH_RGBCOLOR(81, 42, 8);
        _headName.text = @"随风漂流";
        _headName.textAlignment = 0;
    }
    return _headName;
}
-(UIButton *)phoneNum{
    if (!_phoneNum) {
        _phoneNum = [[UIButton alloc] initWithFrame:CGRectMake(CGRectX(self.headName), CGRectYH(self.headName), 185*AdaptationWidth(), 41*AdaptationWidth())];
        [_phoneNum setImage:MImage(@"wode_08") forState:0];
        [_phoneNum setTitle:@"13998855577" forState:0];
        [_phoneNum setTitleColor:LH_RGBCOLOR(81, 42, 8) forState:0];
        _phoneNum.titleLabel.font = WFont(25);
        
    }
    return _phoneNum;
}
-(UIButton *)changePerInfo{
    if (!_changePerInfo) {
        _changePerInfo = [[UIButton alloc] initWithFrame:CGRectMake(Screen_width-82, 90*AdaptationWidth(), 90, 50*AdaptationWidth())];
        _changePerInfo.backgroundColor = LH_RGBCOLOR(253, 229, 94);
        [_changePerInfo setTitle:@"修改个人信息" forState:0];
        [_changePerInfo setTitleColor:LH_RGBCOLOR(81, 42, 8) forState:0];
        _changePerInfo.titleLabel.font = WFont(24);
        _changePerInfo.layer.cornerRadius = 25*AdaptationWidth();
        [_changePerInfo addTarget:self action:@selector(respondsToChangeInfo) forControlEvents:UIControlEventTouchUpInside];
    }
    return _changePerInfo;
}
@end
