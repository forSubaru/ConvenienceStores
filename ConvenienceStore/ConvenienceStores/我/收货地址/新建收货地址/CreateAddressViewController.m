//
//  CreateAddressViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/20.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "CreateAddressViewController.h"
#import "CreateAddressCell.h"
@interface CreateAddressViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_dataSource;
    
}
/**table*/
@property (nonatomic,strong) UITableView *tableView;
/**设为默认地址*/
@property (nonatomic,strong) UIButton *defaultBtn;

@end

@implementation CreateAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initUI];
}
#pragma mark *** 初始化数据 ***
-(void)initData{
    _dataSource = @[@"收货人",@"手机号码",@"省市地区",@"详细地址"];
}
#pragma mark *** 初始化界面 ***
-(void)initUI{
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.defaultBtn];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark *** tableviewdelegate ***
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CreateAddressCell *cell = [[CreateAddressCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"defaultCell"];
    
    NSArray *holderArr = @[@"请输入收货人",@"请输入手机号码",@"自动获取中...",@"请输入详细地址(5-120字)"];
    cell.label.text = _dataSource[indexPath.row];
    cell.textField.placeholder = holderArr[indexPath.row];
  
    return cell;
}

#pragma mark *** btnEvent ***

-(void)respondsToDefaultBtn{
    self.defaultBtn.selected = !self.defaultBtn.selected;
}
#pragma mark *** getters ***
-(UITableView *)tableView{
    if (!_tableView) {
        
        CGFloat height = _dataSource.count*82;
        if (height>Screen_height-64-70) {
            height = Screen_height-64-70;
        }
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, Screen_width, 200)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 50;
    }
    return _tableView;
}
-(UIButton *)defaultBtn{
    if (!_defaultBtn) {
        _defaultBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectYH(self.tableView)+20, Screen_width, 50)];
        _defaultBtn.backgroundColor = [UIColor whiteColor];
        [_defaultBtn setImage:MImage(@"choose") forState:0];
        [_defaultBtn setTitleColor:[UIColor blackColor] forState:0];
        [_defaultBtn setTitle:@"设为默认地址" forState:0];
        
        [_defaultBtn setImage:MImage(@"Bsuccess") forState:UIControlStateSelected];
        
        _defaultBtn.titleLabel.font = WFont(28);
        _defaultBtn.titleEdgeInsets = UIEdgeInsetsMake(0, _defaultBtn.imageView.frame.size.width-_defaultBtn.frame.size.width+_defaultBtn.titleLabel.intrinsicContentSize.width, 0, 0);
        _defaultBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -_defaultBtn.titleLabel.frame.size.width-_defaultBtn.frame.size.width+_defaultBtn.imageView.frame.size.width+20);
        
        [_defaultBtn addTarget:self action:@selector(respondsToDefaultBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _defaultBtn;
}
@end
