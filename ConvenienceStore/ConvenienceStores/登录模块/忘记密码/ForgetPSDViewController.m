//
//  ForgetPSDViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/24.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "ForgetPSDViewController.h"

@interface ForgetPSDViewController ()

@end

@implementation ForgetPSDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.accountTexf.placeholder = @"请输入找回号码的手机号";
    self.passwordTecf.placeholder = @"请输入短信验证码";
    [self.accountTexf addSubview:self.forgetPSDBtn];
    [self.forgetPSDBtn setTitle:@"获取验证码" forState:0];
    [self.loginNowBtn setTitle:@"验证" forState:0];
    [self.regisBtn removeFromSuperview];
    [self.mobileVerBtn removeFromSuperview];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)respondsToAllBtn:(UIButton *)sender{
    if ([sender.titleLabel.text isEqualToString:@"获取验证码"]) {
        NSLog(@"获取验证码");
    }else if ([sender.titleLabel.text isEqualToString:@"验证"]){
        NSLog(@"验证");
    }
}

@end
