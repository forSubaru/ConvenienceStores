//
//  SureOrderViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/24.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "SureOrderViewController.h"
#import "SureAddressCell.h"
#import "SureOrderCell.h"
#import "DiscountCell.h"
#import "PayMoneyViewController.h"

#import "SelectPayTypeView.h"
#import "SelectSendTimeView.h"

@interface SureOrderViewController ()<UITableViewDelegate,UITableViewDataSource,SelectPayTypeViewDelegate,SelectSenderTimeDelegate>
{
    NSDictionary *_addressDic; /** 地址数据 */
    NSArray *_dataSource; /** 商品数据 */
    NSArray *_otherData; /** 其他数据 */
    
    NSArray *_leftArr;
    NSArray *_rightArr;
    
}
/**tableview*/
@property (nonatomic,strong) UITableView *tableView;
/**底部总价*/
@property (nonatomic,strong) RedPriceLabel *priceLabel;
/**选择付款方式View*/
@property (nonatomic,strong) SelectPayTypeView *SpayView;
/**选择时间View*/
@property (nonatomic,strong) SelectSendTimeView *StimeView;

/**备注*/
@property (nonatomic,strong) UITextField *commentTF;


@end

@implementation SureOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initUI];
    [self.view addSubview:self.priceLabel];
}
#pragma mark *** 初始化数据 ***
-(void)initData{
    _addressDic = @{@"name":@"凶真",
                    @"mobile":@"13555554444",
                    @"province":@"湖南省",
                    @"city":@"邵阳市",
                    @"area":@"大祥区欲",
                    @"address":@"3-2单元20399"};
    _dataSource = @[@"1",@"2",@"3"];
    _otherData = @[@"0",@"2",@"3",@"1",@"59.4"];
    _leftArr = @[@"支付方式",@"配送时间",@"配送费",@"满减优惠",@"深夜附加费",@"备注",@""];
    _rightArr = @[@"在线支付",@"尽快送达",@"0",@"2",@"5",@"",@"合计"];
}
#pragma mark *** 初始化界面 ***
-(void)initUI{
    [self.view addSubview:self.tableView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark *** UITableViewDelegate ***
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return _dataSource.count+7;
    }
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //地址
    if (indexPath.section==0) {
        SureAddressCell *cell = [[SureAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"surecell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    //商品信息
    if (indexPath.section==1) {
        if (indexPath.row<_dataSource.count) {
            SureOrderCell *cell = [[SureOrderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sureOrder"];
            return cell;
        }
        
        NSInteger index = indexPath.row-_dataSource.count;
        
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"ss"];
        cell.textLabel.text = _leftArr[index];
        cell.textLabel.font = WFont(27);
        cell.detailTextLabel.text = _rightArr[index];
        cell.detailTextLabel.font = WFont(27);
        if (index>1&&index<5) {
            cell.detailTextLabel.textColor = [UIColor redColor];
        }
        if (index<2) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        //备注
        if (index==5) {
            [cell.contentView addSubview:self.commentTF];
        }
        //合计
        if (index==6) {
            cell.detailTextLabel.text = @"共计1件商品 合计：¥64.50";
            cell.detailTextLabel.textColor = [UIColor blackColor];
            [UILabel setLabeltextAttributes:cell.detailTextLabel withColor:[UIColor redColor] range:NSMakeRange(10, 6)];
        }
        return cell;
    }
    //优惠
    DiscountCell *cell = [[DiscountCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"discell"];
    cell.textLabel.text = @"优惠券(现有0张)";
    cell.textLabel.font = WFont(27);
    [UILabel setLabeltextAttributes:cell.textLabel withColor:[UIColor orangeColor] range:NSMakeRange(3, 6)];
    cell.cellSwitch.on = true;
    
    return cell;
        
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0||section==1) {
        return 10;
    }
    return 15;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 218*AdaptationWidth();
    }else if (indexPath.section==1){
        if (indexPath.row<_dataSource.count) {
            return 210*AdaptationWidth();
        }
    }
    return 90*AdaptationWidth();
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, 20)];
    view.backgroundColor = mainBackGrayColor;
    return view;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1 ) {
        NSInteger Index = indexPath.row-_dataSource.count;
        if (Index==0) {
            SelectPayTypeView *payView = [[SelectPayTypeView alloc] initWithFrame:self.view.bounds];
            payView.delegate = self;
            [self.view addSubview:payView];
        }else if (Index==1) {
            SelectSendTimeView *payView = [[SelectSendTimeView alloc] initWithFrame:self.view.bounds];
            payView.delegate = self;
            [self.view addSubview:payView];
        }
    }
}
#pragma mark *** SelectPayTypeViewDelegate ***
-(void)selectedPayType:(NSString *)title{
    _rightArr = @[title,_rightArr[1],@"0",@"2",@"5",@"",@"合计"];
    [self.tableView reloadData];
}
-(void)senderTimeString:(NSString *)timeTitle{
    NSLog(@"%@", timeTitle);
    
    _rightArr = @[@"在线支付",timeTitle,@"0",@"2",@"5",@"",@"合计"];
    [self.tableView reloadData];
}
#pragma mark *** 提交订单 ***
-(void)redpondsToComitBtn{
    if ([_rightArr[0] isEqualToString:@"货到付款"]) {
        [Tools showAlertViewcontrollerWithTarGet:self Message:@"确认下单吗？" complete:^(BOOL sure) {
            if (sure) {
                [SXLoadingView showAlertHUD:@"下单成功，请耐心等待" duration:0.5];
                [self.navigationController popViewControllerAnimated:YES];
            }
        }];
        return;
    }
    NSLog(@"提交订单");
    PayMoneyViewController *payMoney = [[PayMoneyViewController alloc] initWithHeaderType:HeaderTypeOnlyBack title:@"收银台" hideTabbar:YES];
    [self.navigationController pushViewController:payMoney animated:YES];
}
#pragma mark *** getters ***
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, Screen_width, HeightExceptNaviAndTabbar-50)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
}
-(RedPriceLabel *)priceLabel{
    if (!_priceLabel) {
        
        UILabel *btView = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectYH(self.tableView), Screen_width, 50)];
        btView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:btView];
        
        UILabel *theLabel = [[UILabel alloc] initWithFrame:CGRectMake(5,  CGRectYH(self.tableView), 120*AdaptationWidth(), 50)];
        theLabel.font = WFont(30);
        theLabel.text = @"实付款：";
        [self.view addSubview:theLabel];
        
        UIButton *comitBtn = [[UIButton alloc] initWithFrame:CGRectMake(Screen_width-100, CGRectYH(self.tableView), 100, 50)];
        comitBtn.backgroundColor = mainYellowColor;
        [comitBtn setTitle:@"提交订单" forState:0];
        comitBtn.titleLabel.font = WFont(30);
        [comitBtn setTitleColor:[UIColor blackColor] forState:0];
        [comitBtn addTarget:self action:@selector(redpondsToComitBtn) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:comitBtn];
        
        _priceLabel = [[RedPriceLabel alloc] initWithFrame:CGRectMake(CGRectXW(theLabel), CGRectYH(self.tableView), 100, 50) string:@"63.40" priceLabeltype:PriceLabelTypeRedSameLetterAndNumber];
        _priceLabel.price.font = WFont(32);
        _priceLabel.letter.font = WFont(28);
        
    }
    return _priceLabel;
}
-(UITextField *)commentTF{
    if (!_commentTF) {
        _commentTF = [[UITextField alloc] initWithFrame:AdaptationFrame(Screen_width/AdaptationWidth()-450, 0, 450, 90)];
        _commentTF.textAlignment = 1;
        _commentTF.font = WFont(25);
        _commentTF.placeholder = SureCommentPSD;
    }
    return _commentTF;
}
@end
