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

#import "ApplyForJoinViewController.h"
#import "InviteFriendViewController.h"
#import "MyFootPrintViewController.h"
#import "MyAddressViewController.h"
#import "MyMessageViewController.h"
#import "SuggestViewController.h"
#import "ContactGMViewController.h"
#import "HelpViewController.h"
#import "NormalQuestionViewController.h"
#import "AboutUsViewController.h"
#import "WjoinUsViewController.h"
#import "CheckUpdateViewController.h"

static NSString *const kReusableCellIdentifier = @"MineCellIdentifier";

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource,MineHeaderViewDelegate,UITabBarDelegate>
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
    
//    [self judgeLoginState];
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
        MyPointViewController *poVc = [[MyPointViewController alloc] initWithHeaderType:HeaderTypeBackAndThreePoint title:@"我的积点" hideTabbar:YES];
        [self.navigationController pushViewController:poVc animated:YES];
    }else if ([itemTitle isEqualToString:@"我的订单"]){
        MyOrderCenterViewController *poVc = [[MyOrderCenterViewController alloc] initWithHeaderType:HeaderTypeBackAndThreePoint title:@"订单中心" hideTabbar:YES];
        [self.navigationController pushViewController:poVc animated:YES];
    }else if ([itemTitle isEqualToString:@"优惠券"]){
        MyDiscountTicketViewController *poVc = [[MyDiscountTicketViewController alloc] initWithHeaderType:HeaderTypeBackAndThreePoint title:@"我的优惠券" hideTabbar:YES];
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
    NSString *celltitle = _titleArr[indexPath.section][indexPath.row];
    
    if (indexPath.section==0) {
        switch (indexPath.row) {
            case 0:
            {
                ApplyForJoinViewController *VC = [[ApplyForJoinViewController alloc] initWithHeaderType:HeaderTypeOnlyBack title:celltitle hideTabbar:YES];
                [self.navigationController pushViewController:VC animated:YES];
            }
                break;
            case 1:
            {
                InviteFriendViewController *VC = [[InviteFriendViewController alloc] initWithHeaderType:HeaderTypeOnlyBack title:celltitle hideTabbar:YES];
                [self.navigationController pushViewController:VC animated:YES];
            }
                break;
            default:
                break;
        }
    }else if (indexPath.section==1){
        switch (indexPath.row) {
            
            case 0:
            {
                MyFootPrintViewController *VC = [[MyFootPrintViewController alloc] initWithHeaderType:HeaderTypeOnlyBack title:celltitle hideTabbar:YES];
                [self.navigationController pushViewController:VC animated:YES];
            }
                break;
            case 1:
            {
                MyAddressViewController *VC = [[MyAddressViewController alloc] initWithHeaderType:HeaderTypeBackAndThreePoint title:celltitle hideTabbar:YES];
                [self.navigationController pushViewController:VC animated:YES];
            }
                break;
            case 2:
            {
                MyMessageViewController *VC = [[MyMessageViewController alloc] initWithHeaderType:HeaderTypeOnlyBack title:celltitle hideTabbar:YES];
                [self.navigationController pushViewController:VC animated:YES];
            }
                break;
            case 3:
            {
                SuggestViewController *VC = [[SuggestViewController alloc] initWithHeaderType:HeaderTypeOnlyBack title:celltitle hideTabbar:YES];
                [self.navigationController pushViewController:VC animated:YES];
            }
                break;
            case 4:
            {
                NormalQuestionViewController *VC = [[NormalQuestionViewController alloc] initWithHeaderType:HeaderTypeOnlyBack title:celltitle hideTabbar:YES];
                [self.navigationController pushViewController:VC animated:YES];
            }
                break;
            case 5:
            {
                ContactGMViewController *VC = [[ContactGMViewController alloc] initWithHeaderType:HeaderTypeOnlyBack title:celltitle hideTabbar:YES];
                [self.navigationController pushViewController:VC animated:YES];
            }
                break;
            case 6:
            {
                HelpViewController *VC = [[HelpViewController alloc] initWithHeaderType:HeaderTypeOnlyBack title:celltitle hideTabbar:YES];
                [self.navigationController pushViewController:VC animated:YES];
            }
                break;
                
            default:
                break;
        }
    }else if (indexPath.section==2){
        switch (indexPath.row) {
            case 0:
            {
                AboutUsViewController *VC = [[AboutUsViewController alloc] initWithHeaderType:HeaderTypeOnlyBack title:celltitle hideTabbar:YES];
                [self.navigationController pushViewController:VC animated:YES];
            }
                break;
            case 1:
            {
                CheckUpdateViewController *VC = [[CheckUpdateViewController alloc] initWithHeaderType:HeaderTypeOnlyBack title:celltitle hideTabbar:YES];
                [self.navigationController pushViewController:VC animated:YES];
            }
                break;
            case 2:
            {
                WjoinUsViewController *VC = [[WjoinUsViewController alloc] initWithHeaderType:HeaderTypeOnlyBack title:celltitle hideTabbar:YES];
                [self.navigationController pushViewController:VC animated:YES];
            }
                break;
            default:
                break;
        }

    }
    
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
