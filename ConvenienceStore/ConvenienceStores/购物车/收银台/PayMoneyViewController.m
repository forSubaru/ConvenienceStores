//
//  PayMoneyViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/24.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "PayMoneyViewController.h"

#import "PayMoneyCell.h"

#define cellHeight 100*AdaptationWidth()
@interface PayMoneyViewController ()<UITableViewDelegate,UITableViewDataSource>
/**tableview*/
@property (nonatomic,strong) UITableView *tableView;
/**金额Label*/
@property (nonatomic,strong) UILabel *money;
/**付款数*/
@property (nonatomic,copy) NSString *payMoney;


@end

@implementation PayMoneyViewController

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
    [self.view addSubview:self.money];
    self.payMoney = @"66.66";
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==1) {
        return 3;
    }
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"moneycel"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section==0&&indexPath.row==2) {
        cell.textLabel.text = @"使用工商银行储蓄卡（2837）";
        cell.textLabel.font = WFont(30);
    }
    if (indexPath.section==0&&indexPath.row==3) {
        UIButton *payBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 20*AdaptationWidth(), Screen_width-20, 70*AdaptationWidth())];
        payBtn.layer.cornerRadius = 5;
        [payBtn setTitle:@"立即支付" forState:0];
        payBtn.backgroundColor = [UIColor redColor];
        [payBtn addTarget:self action:@selector(respondsToPayBtn:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:payBtn];
        
        UIButton *hepBtn = [[UIButton alloc] initWithFrame:CGRectMake(Screen_width-135*AdaptationWidth(), CGRectYH(payBtn), 135*AdaptationWidth(), 60*AdaptationWidth())];
        hepBtn.titleLabel.font = WFont(25);
        [hepBtn setTitle:@"支付失败？" forState:0];
        [hepBtn setTitleColor:LH_RGBCOLOR(150, 150, 150) forState:0];
        [hepBtn addTarget:self action:@selector(respondsToPayBtn:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:hepBtn];
        
    }
    if (indexPath.row==1) {
        PayMoneyCell *cell = [[PayMoneyCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"paycell"];
        if (indexPath.section==0) {
            [cell.cellImage setImage:MImage(@"shortcut") forState:0];
            cell.cellTitle.text = @"快捷支付";
            cell.cellDetail.text = @"社区快捷支付服务";
        }else{
            [cell.cellImage setImage:MImage(@"weixinwm") forState:0];
            cell.cellTitle.text = @"微信支付";
            cell.cellDetail.text = @"微信安全支付";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        return cell;
    }
    if (indexPath.section==1&&indexPath.row==2) {
        PayMoneyCell *cell = [[PayMoneyCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"paycell"];
        [cell.cellImage setImage:MImage(@"alipay") forState:0];
        cell.cellTitle.text = @"支付宝";
        cell.cellDetail.text = @"支付宝安全支付";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    if (indexPath.section==1&&indexPath.row==0) {
        cell.textLabel.text = @"其他支付方式";
        cell.textLabel.font  = WFont(30);
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==3) {
        return 160*AdaptationWidth();
    }
    return cellHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0;
    }
    return 10;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, 10)];
    view.backgroundColor = mainBackGrayColor;
    return view;
}
#pragma mark *** events ***
-(void)respondsToPayBtn:(UIButton *)sender{
    NSLog(@"%@", sender.titleLabel.text);
}
#pragma mark *** setters ***
-(void)setPayMoney:(NSString *)payMoney{
    _payMoney = payMoney;
    
    self.money.text = [NSString stringWithFormat:@"%@元",payMoney];
    [UILabel setLabeltextAttributes:self.money withFont:WFont(25) range:NSMakeRange(2, 4)];
}
#pragma mark *** getters ***
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, Screen_width, 760*AdaptationWidth()+10)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = false;
    }
    return _tableView;
}
-(UILabel *)money{
    if (!_money) {
        
        UILabel *thelabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 74, 100, 100*AdaptationWidth())];
        thelabel.text = @"订单金额";
        thelabel.font = WFont(30);
        [self.view addSubview:thelabel];
        
        _money = [[UILabel alloc] initWithFrame:CGRectMake(Screen_width-110, 74, 100, 100*AdaptationWidth())];
        _money.textAlignment = 2;
        _money.font = WFont(35);
        _money.text = @"59.40元";
        _money.textColor = [UIColor redColor];
    }
    return _money;
}
@end
