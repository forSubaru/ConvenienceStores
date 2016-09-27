//
//  LoginNormalViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/20.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "LoginNormalViewController.h"
#import "RegisterViewController.h"
#import "LoginVerificationViewController.h"
#import "ForgetPSDViewController.h"
@interface LoginNormalViewController ()

@end

@implementation LoginNormalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initUI];
}
#pragma mark *** 初始化数据 ***
-(void)initData{
    
}
#pragma mark *** 初始化界面 ***
-(void)initUI{
    
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 76, Screen_width, 80)];
    whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:whiteView];
    NSArray *images = @[@"mc",@"mim"];
    NSArray *holds = @[@"请输入手机号码",@"请输入6-16位密码"];
    for (int idx = 0; idx<images.count; idx++) {
        UIButton *imageView = [[UIButton alloc] initWithFrame:CGRectMake(0, 76+40*idx, 40, 40)];
        [imageView setImage:MImage(images[idx]) forState:0];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectXW(imageView), CGRectY(imageView), 400, 40)];
        textField.font = WFont(28);
        textField.placeholder = holds[idx];
        if (idx==0) {
            self.accountTexf = textField;
            imageView.tag = AccountImage;
        }else{
            self.passwordTecf = textField;
            imageView.tag = PassImage;
        }
        [self.view addSubview:imageView];
        [self.view addSubview:textField];
        if (idx==1) {
            UIButton *btn = [[UIButton alloc] initWithFrame:AdaptationFrame(490, 10, 163, 57)];
            btn.titleLabel.font = WFont(29);
            [btn setTitleColor:LH_RGBCOLOR(140, 140, 140) forState:0];
            btn.layer.cornerRadius = btn.bounds.size.height/2;
            btn.layer.borderColor = LH_RGBCOLOR(140, 140, 140).CGColor;
            btn.layer.borderWidth = 1;
            [btn setTitle:@"忘记密码" forState:0];
            [btn addTarget:self action:@selector(respondsToAllBtn:) forControlEvents:UIControlEventTouchUpInside];
            self.forgetPSDBtn = btn;
            [textField addSubview:btn];
        }
    }
    
    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, CGRectYH(whiteView)+10, Screen_width-30, 40)];
    loginBtn.backgroundColor = [UIColor redColor];
    [loginBtn setTitle:@"立即登录" forState:0];
    loginBtn.layer.cornerRadius = 3;
    self.loginNowBtn = loginBtn;
    [loginBtn addTarget:self action:@selector(respondsToAllBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:loginBtn];
    
    NSArray *titles = @[@"新用户注册",@"手机验证登录"];
    for (int idx = 0; idx<titles.count; idx++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectYH(loginBtn), 100, 40)];
        [btn setTitle:titles[idx] forState:0];
        [btn setTitleColor:LH_RGBCOLOR(102, 102, 102) forState:0];
        btn.titleLabel.font = WFont(28);
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(respondsToAllBtn:) forControlEvents:UIControlEventTouchUpInside];
        if (idx==1) {
            btn.frame = CGRectMake(Screen_width-100, btn.frame.origin.y, 100, 40);
            self.mobileVerBtn = btn;
        }else{
            self.regisBtn = btn;
        }
    }
    
}
-(void)respondsToAllBtn:(UIButton *)sender{
    NSLog(@"%@", sender.titleLabel.text);
    NSString *text = sender.titleLabel.text;
    if ([text isEqualToString:@"立即登录"]) {
        NSLog(@"%@-%@", self.accountTexf.text,self.passwordTecf.text);
        [self dismissViewControllerAnimated:YES completion:nil];
    }else if ([text isEqualToString:@"手机验证登录"]){
        LoginVerificationViewController *logV = [[LoginVerificationViewController alloc] initWithHeaderType:HeaderTypeOnlyBack title:@"手机验证登录" hideTabbar:YES];
        [self presentViewController:logV animated:YES completion:nil];
    }else if ([text isEqualToString:@"新用户注册"]){
        RegisterViewController *regisV = [[RegisterViewController alloc] initWithHeaderType:HeaderTypeOnlyBack title:@"注册" hideTabbar:YES];
        [self presentViewController:regisV animated:YES completion:nil];
    }else if ([text isEqualToString:@"忘记密码"]){
        ForgetPSDViewController *forget = [[ForgetPSDViewController alloc] initWithHeaderType:HeaderTypeOnlyBack title:@"忘记密码" hideTabbar:YES];
        [self presentViewController:forget animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)respondsToReturnBtn:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationRootTabbar object:nil userInfo:@{@"index":@0}];
}
@end
