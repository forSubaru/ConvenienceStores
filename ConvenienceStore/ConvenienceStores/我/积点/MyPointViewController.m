//
//  MyPointViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/14.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "MyPointViewController.h"
#import "MyPointCell.h"
#import "MyPointHeadView.h"
#import "MyPointTableheadView.h"
static NSString *const kReusableCellIdentifier = @"MypointcellIdentifier";

@interface MyPointViewController ()<UITableViewDelegate,UITableViewDataSource,MyPointHeadViewDelegate,MyPointTableheadViewDelegate>
/**tableView*/
@property (nonatomic,strong) UITableView *tableView;
/**头部*/
@property (nonatomic,strong) MyPointHeadView *headView;

@end

@implementation MyPointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.headView];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)MyPointHeadView:(MyPointHeadView *)headView didSeletedButton:(NSString *)btnTitle{
    NSLog(@"%@", btnTitle);
}
#pragma mark *** TableDelegate ***
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        MyPointTableheadView *cell = [[MyPointTableheadView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"headerder"];
        cell.delegate = self;
        return cell;
    }
    
    MyPointCell *cell = [tableView dequeueReusableCellWithIdentifier:kReusableCellIdentifier];
    if (!cell) {
        cell = [[MyPointCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kReusableCellIdentifier];
    }
    if (indexPath.row==0) {
        cell.cellDetail.textColor = LH_RGBCOLOR(142, 142, 142);
        cell.cellTime.textColor =  cell.cellDetail.textColor;
        cell.cellPoint.textColor =  cell.cellDetail.textColor;
        cell.cellDetail.text = @"详情";
        cell.cellTime.text = @"时间";
        cell.cellPoint.text = @"积点";
    }else{
        
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0;
    }
    return 20*AdaptationWidth();
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 60*AdaptationWidth();
    }
    return 47*AdaptationWidth();
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, 20*AdaptationWidth())];
    headView.backgroundColor = mainBackGrayColor;
    return headView;
}
#pragma mark *** MyPointTableheadViewDelegate ***
-(void)MyPointTableheadView:(MyPointTableheadView *)myheadView didSelectedButtonTitle:(NSString *)title{
    NSLog(@"%@", title);
}
#pragma mark *** getters ***
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, CGRectYH(self.headView), Screen_width-20, Screen_height-64)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[MyPointCell class] forCellReuseIdentifier:kReusableCellIdentifier];
        [_tableView registerClass:[MyPointTableheadView class] forCellReuseIdentifier:@"headerder"];
        _tableView.separatorColor = [UIColor clearColor];
    }
    return _tableView;
}
-(MyPointHeadView *)headView{
    if (!_headView) {
        _headView = [[MyPointHeadView alloc] initWithFrame:CGRectMake(0, 64, Screen_width-20, 185*AdaptationWidth())];
        _headView.delegate = self;
    }
    return _headView;
}
@end
