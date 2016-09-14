//
//  GetTicketViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/8/29.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "GetTicketViewController.h"
#import "TicketTableCell.h"
static NSString *const kReusableCellIdentifier = @"TicketcellIdentifier";

@interface GetTicketViewController ()<UITableViewDelegate,UITableViewDataSource>
/**滚动图*/
@property (nonatomic,strong) ScrollerView *scroView;
/**tableive*/
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation GetTicketViewController

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
    self.view.backgroundColor = mainBackGrayColor;
    [self.view addSubview:self.scroView];
    [self.view addSubview:self.tableView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark *** tableviewdelegate ***
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TicketTableCell *cell = [tableView dequeueReusableCellWithIdentifier:kReusableCellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[TicketTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kReusableCellIdentifier];
    }
    cell.backgroundColor = [UIColor whiteColor];
    if (indexPath.row==2) {
        [cell initSellout];
        
    }else{
        [cell initGetButtonWithPercent:0.37];
    }
    return cell;
}
#pragma mark *** getters ***
-(ScrollerView *)scroView{
    if (!_scroView) {
        _scroView = [[ScrollerView alloc] initWithFrame:CGRectMake(0, 64+40*AdaptationWidth(), Screen_width, 339*AdaptationWidth()) images:[@[@"gundong2",@"gundong3",@"gundong4"] mutableCopy]];
    }
    return _scroView;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(5, CGRectYH(self.scroView)+5, Screen_width-10, HeightExceptNaviAndTabbar-CGRectGetMaxY(self.scroView.frame))];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 203*AdaptationWidth();
        [_tableView registerClass:[TicketTableCell class] forCellReuseIdentifier:kReusableCellIdentifier];
        _tableView.showsVerticalScrollIndicator = false;
    }
    return _tableView;
}

@end
