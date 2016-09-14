//
//  MyDiscountTicketViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/14.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "MyDiscountTicketViewController.h"
#import "TicketTableViewCell.h"
static NSString *const kReusableCellIdentifier = @"TicketcellIdentifier";

@interface MyDiscountTicketViewController ()<UITableViewDelegate,UITableViewDataSource>
/**tableView*/
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation MyDiscountTicketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}
#pragma mark *** TableDelegate ***
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TicketTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReusableCellIdentifier];
    if (!cell) {
        cell = [[TicketTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kReusableCellIdentifier];
    }
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 64, Screen_width-20, Screen_height-64)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[TicketTableViewCell class] forCellReuseIdentifier:kReusableCellIdentifier];
        _tableView.rowHeight = 267*AdaptationWidth();
        _tableView.backgroundColor = [UIColor clearColor];
    }
    return _tableView;
}

@end
