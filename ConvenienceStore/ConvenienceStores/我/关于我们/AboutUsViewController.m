//
//  AboutUsViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/19.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *leftImages = @[@"weixinwm",@"youxiangwm",@"shoujiwm"];
    NSArray *leftTitles = @[@"微信公众号",@"联系邮箱",@"加盟电话"];
    NSArray *rigtArrs = @[@"社区",@"aimin@163.com",@"400+963-8888"];
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 64+10, Screen_width, 120)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    
    for (int idx = 0; idx<leftImages.count; idx++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(5, idx*40, 40, 40)];
        [btn setImage:MImage(leftImages[idx]) forState:0];
        [btn setTitleColor:[UIColor blackColor] forState:0];
        [backView addSubview:btn];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectXW(btn), idx*40, 100, 40)];
        label.textAlignment = 0;
        label.text = leftTitles[idx];
        label.font = WFont(28);
        [backView addSubview:label];
        
        UILabel *riLabel= [[UILabel alloc] initWithFrame:CGRectMake(Screen_width-160, idx*40, 150, 40)];
        riLabel.font = WFont(28);
        riLabel.textColor = LH_RGBCOLOR(122, 122, 122);
        riLabel.text =  rigtArrs[idx];
        riLabel.textAlignment = 2;
        [backView addSubview:riLabel];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(10, 39+idx*40, Screen_width-10, 1)];
        line.backgroundColor = LH_RGBCOLOR(230, 230, 230);
        [backView addSubview:line];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
