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
static NSString *const kReusableCellIdentifier = @"MypointcellIdentifier";

@interface MyPointViewController ()<UITableViewDelegate,UITableViewDataSource>
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

#pragma mark *** TableDelegate ***
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyPointCell *cell = [tableView dequeueReusableCellWithIdentifier:kReusableCellIdentifier];
    if (!cell) {
        cell = [[MyPointCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kReusableCellIdentifier];
    }
    return cell;
}
#pragma mark *** getters ***
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, CGRectYH(self.headView), Screen_width-20, Screen_height-64)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[MyPointCell class] forCellReuseIdentifier:kReusableCellIdentifier];
        _tableView.rowHeight = 47*AdaptationWidth();
    }
    return _tableView;
}
-(MyPointHeadView *)headView{
    if (!_headView) {
        _headView = [[MyPointHeadView alloc] initWithFrame:CGRectMake(0, 64, Screen_width, 253*AdaptationWidth())];
        
    }
    return _headView;
}
@end
