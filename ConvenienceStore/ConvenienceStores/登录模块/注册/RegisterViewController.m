//
//  RegisterViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/21.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.loginNowBtn setTitle:@"注册" forState:0];
    
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 76+80, Screen_width, 80)];
    whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:whiteView];
    NSArray *images = @[@"mim",@"mim"];
    NSArray *holds = @[@"请设置密码(6-16个字符)",@"请再次输入密码"];
    
    for (int idx = 0; idx<images.count; idx++) {
        UIButton *imageView = [[UIButton alloc] initWithFrame:CGRectMake(0, 80+76+40*idx, 40, 40)];
        [imageView setImage:MImage(images[idx]) forState:0];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectXW(imageView), CGRectY(imageView), 400, 40)];
        textField.font = WFont(28);
        textField.placeholder = holds[idx];
        
        [self.view addSubview:imageView];
        [self.view addSubview:textField];
    }
    
    self.loginNowBtn.frame = CGRectMake(self.loginNowBtn.frame.origin.x, self.loginNowBtn.frame.origin.y+80, self.loginNowBtn.bounds.size.width, self.loginNowBtn.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)respondsToAllBtn:(UIButton *)sender{
    NSLog(@"%@", sender.titleLabel.text);
}

@end
