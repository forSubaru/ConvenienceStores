//
//  HelpViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/19.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "HelpViewController.h"
static NSString *const kReusableCellIdentifier = @"SrecellIdentifier";

@interface HelpViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_dataSource;
}
/**tableview*/
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation HelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initUI];
}
#pragma mark *** 初始化数据 ***
-(void)initData{
    _dataSource = @[@"怎么注册会员",@"怎么注册会员",@"怎么注册会员",@"怎么注册会员",@"怎么注册会员",@"怎么注册会员",@"怎么注册会员",@"怎么注册会员",@"怎么注册会员",@"怎么注册会员",@"怎么注册会员",@"怎么注册会员",@"怎么注册会员",@"怎么注册会员",@"怎么注册会员",@"怎么注册会员",@"怎么注册会员",@"怎么注册会员"];
}
#pragma mark *** 初始化界面 ***
-(void)initUI{
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(10, 64+5, Screen_width-20, 40)];
    backView.layer.cornerRadius = 10;
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    UIButton *searBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [searBtn setImage:MImage(@"rej") forState:0];
    [backView addSubview:searBtn];
    
    UITextField *searTef = [[UITextField alloc] initWithFrame:CGRectMake(CGRectXW(searBtn)+5, 0, 200, 40)];
    searTef.placeholder = @"遇到问题搜一搜";
    [backView addSubview:searTef];
    
    [self.view addSubview:self.tableView];
    
}
#pragma mark *** tableviewdelegate ***
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReusableCellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kReusableCellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@?",_dataSource[indexPath.row]];;
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(Screen_width-40, 0, 40, 40)];
    [btn setImage:MImage(@"arrow") forState:0];
    [cell.contentView addSubview:btn];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 115, Screen_width, Screen_height-115)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kReusableCellIdentifier];
    }
    return _tableView;
}

@end
