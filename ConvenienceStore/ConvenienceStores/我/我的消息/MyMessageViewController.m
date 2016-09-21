//
//  MyMessageViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/19.
//  Copyright © 2016年 王子豪. All rights reserved.
//
static NSString *const kReusableCellIdentifier = @"cellIdentifier";

#import "MyMessageViewController.h"
#import "MyMessageCell.h"
@interface MyMessageViewController ()<UITableViewDelegate,UITableViewDataSource>
/**table*/
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation MyMessageViewController

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
}

#pragma mark *** tableDelegate ***
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:kReusableCellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[MyMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kReusableCellIdentifier];
    }
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
#pragma mark *** getters ***
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, Screen_width, Screen_height-64)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[MyMessageCell class] forCellReuseIdentifier:kReusableCellIdentifier];
        _tableView.rowHeight = 138*AdaptationWidth();
        _tableView.backgroundColor = [UIColor clearColor];
    }
    return _tableView;
}

@end
