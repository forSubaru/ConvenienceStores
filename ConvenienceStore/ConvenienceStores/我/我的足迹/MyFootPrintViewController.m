//
//  MyFootPrintViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/19.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "MyFootPrintViewController.h"
#import "MyfootCell.h"
static NSString *const kReusableCellIdentifier = @"footcellIdentifier";

@interface MyFootPrintViewController ()<UITableViewDelegate,UITableViewDataSource>
/**table*/
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation MyFootPrintViewController

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
    
    UIButton *clearBtn = [[UIButton alloc] initWithFrame:CGRectMake(Screen_width-44, 0, 44, 44)];
    [clearBtn setTitleColor:[UIColor blackColor] forState:0];
    [clearBtn setTitle:@"清空" forState:0];
    [clearBtn addTarget:self action:@selector(respondstoclearBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.backView addSubview:clearBtn];
}
-(void)respondstoclearBtn{
    NSLog(@"清空");
}
#pragma mark *** tableDelegate ***
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyfootCell *cell = [tableView dequeueReusableCellWithIdentifier:kReusableCellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[MyfootCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kReusableCellIdentifier];
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
        [_tableView registerClass:[MyfootCell class] forCellReuseIdentifier:kReusableCellIdentifier];
        _tableView.rowHeight = 200*AdaptationWidth();
        _tableView.backgroundColor = [UIColor clearColor];
    }
    return _tableView;
}

@end
