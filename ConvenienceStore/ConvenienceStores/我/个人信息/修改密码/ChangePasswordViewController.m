//
//  ChangePasswordViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/14.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController ()<UITableViewDelegate,UITableViewDataSource>
/**tablview*/
@property (nonatomic,strong) UITableView *tableView;
/**原密码*/
@property (nonatomic,strong) UITextField *oldPSD;
/**新密码*/
@property (nonatomic,strong) UITextField *newsPSD;
/**再次输入*/
@property (nonatomic,strong) UITextField *surePSD;



@end

@implementation ChangePasswordViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.oldPSD];
    [self.view addSubview:self.newsPSD];
    [self.view addSubview:self.surePSD];
    
    UIButton *sureBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, CGRectYH(self.surePSD)+20, Screen_width-20, 45)];
    sureBtn.backgroundColor = [UIColor redColor];
    sureBtn.layer.cornerRadius = 3;
    [sureBtn setTitle:@"确定" forState:0];
    sureBtn.titleLabel.font = WFont(36);
    [sureBtn addTarget:self action:@selector(respondsToSureBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sureBtn];
    
}
-(void)respondsToSureBtn{
    NSLog(@"old:%@\nnew:%@\nsure:%@", self.oldPSD.text,self.newsPSD.text,self.surePSD.text);
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sexCell"];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
    }else{
    }
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark *** getters ***
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 74, Screen_width, 120)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"sexCell"];
        _tableView.rowHeight = 40;
        _tableView.bounces = false;
        _tableView.userInteractionEnabled = false;
        
    }
    return _tableView;
}

-(UITextField *)oldPSD{
    if (!_oldPSD) {
        _oldPSD = [[UITextField alloc] initWithFrame:CGRectMake(15, 74, 200, 40)];
        _oldPSD.font = WFont(30);
        _oldPSD.placeholder = @"原密码";
    }
    return _oldPSD;
}
-(UITextField *)newsPSD{
    if (!_newsPSD) {
        _newsPSD = [[UITextField alloc] initWithFrame:CGRectMake(15, 74+40, 200, 40)];
        _newsPSD.font = self.oldPSD.font;
        _newsPSD.placeholder = @"新密码";
    }
    return _newsPSD;
}
-(UITextField *)surePSD{
    if (!_surePSD) {
        _surePSD = [[UITextField alloc] initWithFrame:CGRectMake(15, 74+80, 200, 40)];
        _surePSD.font = self.oldPSD.font;
        _surePSD.placeholder = @"再次输入";
    }
    return _surePSD;
}
@end
