//
//  MyOrderCenterViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/14.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "MyOrderCenterViewController.h"
#import "MyOrderTopView.h"
#import "MyOrderTableCell.h"

#import "OrderRefundViewController.h"

static NSString *const kReusableCellIdentifier = @"OrdercellIdentifier";

@interface MyOrderCenterViewController ()<MyOrderTopViewDelegate,UITableViewDelegate,UITableViewDataSource,MyOrderTableCellDelegate>
{
    NSArray <NSArray *> *_dataSource;
}
/**头部选择按钮*/
@property (nonatomic,strong) MyOrderTopView *topView;
/**详细*/
@property (nonatomic,strong) UITableView *orderTable;

@end

@implementation MyOrderCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initUI];
}
#pragma mark *** 初始化数据 ***
-(void)initData{
    _dataSource = @[@[@"1"],@[@"2"],@[@"3",@"2"],@[@"4",@"2",@"3"],@[@"1"]];
}
#pragma mark *** 初始化界面 ***
-(void)initUI{
    [self.view addSubview:self.topView];
    [self.view addSubview:self.orderTable];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)MyOrderTopView:(MyOrderTopView *)topView didSelectedButtonTitle:(NSString *)title{
    NSLog(@"%@", title);
}
#pragma mark *** TableViewDelegate ***
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    MyOrderTableCell *cell = [tableView dequeueReusableCellWithIdentifier:kReusableCellIdentifier forIndexPath:indexPath];
//    if (!cell) {
//        cell = [[MyOrderTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kReusableCellIdentifier];
//    }
    MyOrderTableCell *cell = [[MyOrderTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kReusableCellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
#warning 可以试试在这里直接变frame 。backView的
    cell.delegate = self;
    [cell initWithDataModel:_dataSource[indexPath.row]];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger count = _dataSource[indexPath.row].count;
    return (244+count*190)*AdaptationWidth();
}
#pragma mark *** cellDelegate ***
-(void)MyOrderTableCell:(MyOrderTableCell *)orderCell didTapButtonWithTitle:(NSString *)title{
    
    NSLog(@"%@", title);
    
    if ([title isEqualToString:@"申请退款"]) {
        OrderRefundViewController *oderVc = [[OrderRefundViewController alloc] initWithHeaderType:HeaderTypeOnlyBack title:@"申请退款" hideTabbar:YES];
        [self.navigationController pushViewController:oderVc animated:YES];
    }
}
#pragma mark *** getters ***
-(MyOrderTopView *)topView{
    if (!_topView) {
        _topView = [[MyOrderTopView alloc] initWithFrame:CGRectMake(0, 64, Screen_width, 82*AdaptationWidth())];
        _topView.delegate = self;
    }
    return _topView;
}
-(UITableView *)orderTable{
    if (!_orderTable) {
        _orderTable = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectYH(self.topView)+10, Screen_width, Screen_height-74-82*AdaptationWidth())];
        _orderTable.separatorColor = [UIColor clearColor];
        _orderTable.dataSource = self;
        _orderTable.delegate = self;
        _orderTable.backgroundColor = [UIColor clearColor];
        [_orderTable registerClass:[MyOrderTableCell class] forCellReuseIdentifier:kReusableCellIdentifier];
    }
    return _orderTable;
}
@end
