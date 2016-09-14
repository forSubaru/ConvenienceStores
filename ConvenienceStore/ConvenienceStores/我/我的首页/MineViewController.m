//
//  MineViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/8/29.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "MineViewController.h"
#import "MineHeaderView.h"
#import "MineCell.h"
#import "MinePersonalInfoViewController.h"
#import "MyPointViewController.h"
#import "MyOrderCenterViewController.h"
#import "MyDiscountTicketViewController.h"
static NSString *const kReusableCellIdentifier = @"MineCellIdentifier";

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource,MineHeaderViewDelegate>
{
    NSArray *_imagesArr;
    NSArray *_titleArr;
}
/**tableview*/
@property (nonatomic,strong) UITableView *tableView;
/**头部*/
@property (nonatomic,strong) MineHeaderView *headView;


@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initUI];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = false;
}
#pragma mark *** 初始化数据 ***
-(void)initData{
    _imagesArr = @[@[@"jiameng",@"qiandai"],
                   @[@"zuji",@"dizi",@"xiaoxi",@"jianyi",@"wenti",@"kefu",@"bangzu"],
                   @[@"women",@"gengxin",@"jiaru"],
                   @[@"women"]];
    _titleArr = @[@[@"申请加盟",@"邀请好友赚积点"],
                  @[@"我的足迹",@"收货地址",@"我的消息",@"意见建议",@"常见问题",@"联系客服",@"帮助"],
                  @[@"关于我们",@"检查更新",@"加入我们"],
                  @[@"退出登录"]];
}
#pragma mark *** 初始化界面 ***
-(void)initUI{
    self.view.backgroundColor = mainGrayColor;
    [self.view addSubview:self.tableView];
//    [self.view bringSubviewToFront:self.topBlackView];

}
#pragma mark *** MineHeaderViewDelegate ***
-(void)MineHeaderView:(MineHeaderView *)headView didSelectedItem:(NSString *)itemTitle{
    if ([itemTitle isEqualToString:@"修改信息"]) {
        MinePersonalInfoViewController *personInfo = [[MinePersonalInfoViewController alloc] initWithHeaderType:HeaderTypeBackAndThreePoint title:@"个人信息"];
        [self.navigationController pushViewController:personInfo animated:YES];
    }else if ([itemTitle isEqualToString:@"积点"]){
        MyPointViewController *poVc = [[MyPointViewController alloc] initWithHeaderType:HeaderTypeBackAndThreePoint title:@"我的积点"];
        [self.navigationController pushViewController:poVc animated:YES];
    }else if ([itemTitle isEqualToString:@"我的订单"]){
        MyOrderCenterViewController *poVc = [[MyOrderCenterViewController alloc] initWithHeaderType:HeaderTypeBackAndThreePoint title:@"我的订单"];
        [self.navigationController pushViewController:poVc animated:YES];
    }else if ([itemTitle isEqualToString:@"优惠券"]){
        MyDiscountTicketViewController *poVc = [[MyDiscountTicketViewController alloc] initWithHeaderType:HeaderTypeBackAndThreePoint title:@"我的优惠券"];
        [self.navigationController pushViewController:poVc animated:YES];
    }
}
#pragma mark *** UItableViewDataSource ***
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0){
        return 2;
    }else if (section==1){
        return 7;
    }else if (section==2){
        return 3;
    }
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MineCell *cell = [[MineCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"celll"];
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.cellContent setImage:MImage(_imagesArr[indexPath.section][indexPath.row]) forState:0];
    cell.cellTiele.text = _titleArr[indexPath.section][indexPath.row];
    
    if (indexPath.section==3) {
        cell.cellTiele.center = CGPointMake(self.view.center.x, cell.cellTiele.center.y);
        cell.cellTiele.textAlignment =1;
        [cell.cellContent removeFromSuperview];
        [cell.arrBtn removeFromSuperview];
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 86*AdaptationWidth();
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 340*AdaptationWidth()+15;
    }
    return 10;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, 341*AdaptationWidth())];
    view.backgroundColor = mainBackGrayColor;
    if (section==0) {
        [view addSubview:self.headView];
    }
    return view;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld", indexPath.row);
}
#pragma mark *** getters ***
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, Screen_width, HeightExceptNaviAndTabbar)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[MineCell class] forCellReuseIdentifier:@"celll"];
        _tableView.rowHeight = 86*AdaptationWidth();
    }
    return _tableView;
}

-(MineHeaderView *)headView{
    if (!_headView) {
        _headView = [[MineHeaderView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, 340*AdaptationWidth())];
        _headView.delegate = self;
    }
    return _headView;
}

@end
