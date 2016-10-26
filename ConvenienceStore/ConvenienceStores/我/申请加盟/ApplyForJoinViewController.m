//
//  ApplyForJoinViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/19.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "ApplyForJoinViewController.h"
#import "JoinUsCell.h"
static NSString *const kReusableCellIdentifier = @"joinuscellIdentifier";

@interface ApplyForJoinViewController ()<UITableViewDelegate,UITableViewDataSource>
/**TableLe*/
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation ApplyForJoinViewController

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
    [self.view addSubview:self.tableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kReusableCellIdentifier];
    if (indexPath.row==0) {
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, 3420*AdaptationWidth())];
        imageV.image = MImage(@"jiameng_image.jpg");
        [cell.contentView addSubview:imageV];
        
        //拨打电话按钮
        UIButton *callBtn = [[UIButton alloc] initWithFrame:AdaptationFrame(142, 3315, Screen_width/AdaptationWidth()-284, 56)];
        [callBtn addTarget:self action:@selector(respondsTocallBtn:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:callBtn];
        
        return cell;
    }else if (indexPath.row==6){
        UIButton *commitBtn = [[UIButton alloc] initWithFrame:AdaptationFrame(28, 67, 688, 64)];
        [commitBtn setTitle:@"提交申请" forState:0];
        commitBtn.backgroundColor = [UIColor redColor];
        commitBtn.layer.cornerRadius = 5;
        commitBtn.titleLabel.font = WFont(28);
        [cell addSubview:commitBtn];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    NSArray *titleArr = @[@"姓名",@"手机",@"省",@"市",@"区/县"];
    NSArray *holderArr = @[@"请输入您的真实姓名",@"请输入您的联系方式",@"请选择省",@"请选择省",@"请选择市"];
    JoinUsCell *jCell = [[JoinUsCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kReusableCellIdentifier];
    if (indexPath.row>2) {
        jCell = [[JoinUsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kReusableCellIdentifier];
    }
    jCell.cellName.text = titleArr[indexPath.row-1];
    jCell.cellTextField.placeholder = holderArr[indexPath.row-1];
    return jCell;
}
#pragma mark *** events ***
-(void)respondsTocallBtn:(UIButton *)sender{

    NSURL *url = [NSURL URLWithString:@"telprompt://400-8201581"];
                  
     [[UIApplication sharedApplication] openURL:url];
}
#pragma mark *** delegate ***
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return 3420*AdaptationWidth();
    }else if (indexPath.row==6){
        return 300*AdaptationWidth();
    }
    return 77*AdaptationWidth();
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, Screen_width, Screen_height-64)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[JoinUsCell class] forCellReuseIdentifier:kReusableCellIdentifier];
    }
    return _tableView;
}

@end
