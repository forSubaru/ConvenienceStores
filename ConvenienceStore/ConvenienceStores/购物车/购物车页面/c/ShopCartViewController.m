//
//  ShopCartViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/8/29.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "ShopCartViewController.h"
#import "ShopCartTopHeadView.h"
#import "ShopCartCell.h"
#import "ShopCartFootView.h"

#import "SureOrderViewController.h"

static NSString *const kReusableCellIdentifier = @"ShopCartcellIdentifier";

@interface ShopCartViewController ()<UITableViewDelegate,UITableViewDataSource,ShopCartCellDelegate,ShopCartFootViewDelegate>
/**头部*/
@property (nonatomic,strong) ShopCartTopHeadView *topHeadView;
/**tableview*/
@property (nonatomic,strong) UITableView *tableView;
/**尾部*/
@property (nonatomic,strong) ShopCartFootView *footView;

@end

@implementation ShopCartViewController

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
    [self.view addSubview:self.topHeadView];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.footView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark *** UITableViewDelegate ***
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShopCartCell *cell = [tableView dequeueReusableCellWithIdentifier:kReusableCellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[ShopCartCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kReusableCellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    return cell;
}
#pragma mark *** cellDelegate ***
//选择某个cell
-(void)ShopCartCellSelected:(ShopCartCell *)cartCell{
    cartCell.cellSelecBtn.selected = !cartCell.cellSelecBtn.selected;
}
//改变商品的number
-(void)ShopCartCell:(ShopCartCell *)cartCell goodsNumberChange:(NSString *)number{
    NSLog(@"%@", number);
}
#pragma mark *** footViewDelegate ***
-(void)ShopCartFootView:(ShopCartFootView *)footView didSelectedButton:(UIButton *)sender{
    if ([sender.titleLabel.text isEqualToString:@"全选"]) {
        sender.selected = !sender.selected;
    }else if ([sender.titleLabel.text isEqualToString:@"去结算"]){
        SureOrderViewController *su = [[SureOrderViewController alloc] initWithHeaderType:HeaderTypeOnlyBack title:@"确认订单" hideTabbar:YES];
        [self.navigationController pushViewController:su animated:YES];
    }
    NSLog(@"%@", sender.titleLabel.text);
}
#pragma mark *** getters ***
-(ShopCartTopHeadView *)topHeadView{
    if (!_topHeadView) {
        _topHeadView = [[ShopCartTopHeadView alloc] initWithFrame:CGRectMake(0, 70, Screen_width, 208*AdaptationWidth())];
        _topHeadView.backgroundColor = [UIColor whiteColor];
    }
    return _topHeadView;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectYH(self.topHeadView)+22*AdaptationWidth(), Screen_width, 770*AdaptationWidth())];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[ShopCartCell class] forCellReuseIdentifier:kReusableCellIdentifier];
        _tableView.rowHeight = 184*AdaptationWidth();
    }
    return _tableView;
}
-(ShopCartFootView *)footView{
    if (!_footView) {
        _footView = [[ShopCartFootView alloc] initWithFrame:CGRectMake(0, Screen_height-50-45, Screen_width, 44)];
        _footView.backgroundColor = [UIColor whiteColor];
        _footView.delegate = self;
    }
    return _footView;
}
@end
