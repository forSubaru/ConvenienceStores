//
//  ChageNickNameViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/14.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "ChageNickNameViewController.h"
@interface ChageNickNameViewController ()<UITextFieldDelegate>


@end

@implementation ChageNickNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
}

-(void)initView{
    
    //背景视图
    UIView *backV = [[UIView alloc]initWithFrame:CGRectMake(0, 64, Screen_width, Screen_height-64)];
    [self.view addSubview:backV];
    //    backV.backgroundColor = LH_RGBCOLOR(230, 230, 230);
    backV.backgroundColor = mainBackGrayColor;
    
    
    UIView *mainV = [[UIView alloc]initWithFrame:CGRectMake(0, 8, Screen_width, 44)];
    [backV addSubview:mainV];
    mainV.backgroundColor = [UIColor whiteColor];
    
    //文本框
    _nameTF = [[UITextField alloc]initWithFrame:CGRectMake(15, 0, Screen_width-30, 44)];
    [mainV addSubview:_nameTF];
    _nameTF.delegate = self;
    _nameTF.backgroundColor = [UIColor clearColor];
    
    _nameTF.font = WFont(32);

    _nameTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    //说明 label
    UILabel *noteLb = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectYH(mainV), Screen_width-30, 30)];
    [backV addSubview:noteLb];
    noteLb.textAlignment = NSTextAlignmentLeft;
    noteLb.backgroundColor = [UIColor clearColor];
    noteLb.textColor= mainGrayColor;
    noteLb.font = MFont(12);
    noteLb.text = @"4-20个字符，可由中英文、“_”、“-”组成";
    
    //确定 按钮
    UIButton *saveBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, CGRectYH(noteLb)+10, Screen_width-30, 40)];
    [backV addSubview:saveBtn];
    saveBtn.backgroundColor    = [UIColor redColor];
    saveBtn.layer.cornerRadius = 4.0f;
    saveBtn.titleLabel.font    = MFont(15);
    [saveBtn setTitle:@"确定" forState:0];
    [saveBtn setTitleColor:[UIColor whiteColor] forState:0];
    [saveBtn addTarget:self action:@selector(saveAction) forControlEvents:UIControlEventTouchUpInside];
}
//确定按钮
-(void)saveAction{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
