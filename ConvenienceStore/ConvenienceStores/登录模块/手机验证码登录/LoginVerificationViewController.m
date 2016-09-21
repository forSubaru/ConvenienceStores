//
//  LoginVerificationViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/21.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "LoginVerificationViewController.h"

@interface LoginVerificationViewController ()

@end

@implementation LoginVerificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (UIView *view in self.view.subviews) {
        if (view.tag == AccountImage) {
            UIButton *imageView = (UIButton *)view;
            [imageView setImage:MImage(@"shouji") forState:0];
        }else if (view.tag == PassImage) {
            UIButton *imageView = (UIButton *)view;
            [imageView setImage:MImage(@"youxiang") forState:0];
        }
    }
    self.accountTexf.placeholder = @"请输入11位手机号";
    self.passwordTecf.placeholder = @"请输入短信验证码";
    [self.accountTexf addSubview:self.forgetPSDBtn];
    [self.forgetPSDBtn setTitle:@"获取验证码" forState:0];
    [self.loginNowBtn setTitle:@"立即登录" forState:0];
    [self.regisBtn removeFromSuperview];
    [self.mobileVerBtn removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)respondsToAllBtn:(UIButton *)sender{
    NSLog(@"%@", sender.titleLabel.text);
    if ([sender.titleLabel.text isEqualToString:@"获取验证码"]) {
        
    }else{
        
    }
}

@end
