//
//  SeckillViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/1.
//  Copyright © 2016年 王子豪. All rights reserved.
//

static NSString *const kReusableCellIdentifier = @"SecKillcellIdentifier";

#import "SeckillViewController.h"
#import "SeckillHeaderView.h"
#import "SecKillTableViewCell.h"
@interface SeckillViewController ()<UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate>
/**背景滚动图*/
@property (nonatomic,strong) UIScrollView *backScroView;
/**头部按钮*/
@property (nonatomic,strong) SeckillHeaderView *headView;
/**table*/
@property (nonatomic,strong) UITableView *tableView;
/**data*/
@property (nonatomic,strong) NSArray *dataSource;


@end

@implementation SeckillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
    [self initData];
    [self initUI];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark *** 初始化数据 ***
-(void)initData{
    _dataSource = @[@"0.1",@"0.2",@"0.3",@"0.4",@"0.5",@"0.6"];
}

#pragma mark *** 初始化界面 ***
-(void)initUI{
    [self.view addSubview:self.backScroView];
    [self.backScroView addSubview:self.headView];
    [self.backScroView addSubview:self.tableView];
    //打开定位
//    [self startLocation];
 
}
#pragma mark *** delegate ***
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
      return _dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SecKillTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReusableCellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[SecKillTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kReusableCellIdentifier];
        
    }
    [cell addBarWithPercent:[_dataSource[indexPath.row] floatValue]];
    return cell;
}


#pragma mark *** getters ***
-(UIScrollView *)backScroView{
    if (!_backScroView) {
        _backScroView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, Screen_width, HeightExceptNaviAndTabbar)];
        CGFloat height = CGRectGetMaxY(self.tableView.frame);
        _backScroView.contentSize = CGSizeMake(Screen_width, height);
        _backScroView.backgroundColor = LH_RGBCOLOR(233, 233, 233);
        _backScroView.showsVerticalScrollIndicator = false;
        _backScroView.showsHorizontalScrollIndicator = false;
    }
    return _backScroView;
}
-(SeckillHeaderView *)headView{
    if (!_headView) {
        _headView = [[SeckillHeaderView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, 180*AdaptationWidth()) timeArray:@[@"09",@"07",@"48"]];
        _headView.backgroundColor = [UIColor whiteColor];
    }
    return _headView;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectYH(self.headView), Screen_width, _dataSource.count*314*AdaptationWidth())];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[SecKillTableViewCell class] forCellReuseIdentifier:kReusableCellIdentifier];
        _tableView.rowHeight = 314*AdaptationWidth();
        _tableView.separatorColor = [UIColor clearColor];
        
    }
    return _tableView;
}

@end
