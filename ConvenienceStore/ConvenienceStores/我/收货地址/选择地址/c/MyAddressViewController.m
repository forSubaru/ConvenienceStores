//
//  MyAddressViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/19.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "MyAddressViewController.h"
#import "MyAddressCell.h"
#import "CreateAddressViewController.h"
#import "EditAddressViewController.h"
@interface MyAddressViewController ()<UITableViewDelegate,UITableViewDataSource,MyAddressCellDelegate>
{
    NSArray *_dataSource;
}
/**table*/
@property (nonatomic,strong) UITableView *tableView;
/**按钮*/
@property (nonatomic,strong) UIButton *createAddBtn;

@end

@implementation MyAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initUI];
}
#pragma mark *** 初始化数据 ***
-(void)initData{
    _dataSource = @[@"凶真",@"凶真",@"凶真",@"凶真"];
}
#pragma mark *** 初始化界面 ***
-(void)initUI{
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.createAddBtn];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark *** tableviewdelegate ***
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyAddressCell *cell = [[MyAddressCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"defaultCell"];
    cell.nameLb.text = @"凶真";
    cell.addressLb.text = @"[默认]四川省成都市高新区大源村盛邦街899尚郡3-1单元2306";
    cell.mobileLb.text = @"13956666666";
    cell.editBtn.tag = indexPath.row;
    cell.delegate = self;
    
    if (indexPath.row!=0) {
        MyAddressCell *myCell = [[MyAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"normalCell"];
        myCell.nameLb.text = @"凶真";
        myCell.addressLb.text = @"四川省成都市高新区大源村盛邦街899尚郡3-1单元2306";
        myCell.mobileLb.text = @"13956666666";
        myCell.delegate = self;
         myCell.editBtn.tag = indexPath.row;
        return myCell;
    }
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, 60)];
    view.backgroundColor = [UIColor orangeColor];
    return view;
}
//点击cell 编辑按钮
-(void)MyAddressCell:(MyAddressCell *)cell didSelectedEditItemIndexRow:(NSInteger)indexRow{
    NSLog(@"%ld", indexRow);
    
    EditAddressViewController *editVc = [[EditAddressViewController alloc] initWithHeaderType:HeaderTypeBackAndThreePoint title:@"修改地址" hideTabbar:YES];
    [self.navigationController pushViewController:editVc animated:YES];
    
}
#pragma mark *** btnEvent ***
-(void)respondsToAddBtn{
    CreateAddressViewController *creVc = [[CreateAddressViewController alloc] initWithHeaderType:HeaderTypeBackAndThreePoint title:@"新建收货地址" hideTabbar:YES];
    [self.navigationController pushViewController:creVc animated:YES];
}
#pragma mark *** getters ***
-(UITableView *)tableView{
    if (!_tableView) {
        
        CGFloat height = _dataSource.count*82;
        if (height>Screen_height-64-70) {
            height = Screen_height-64-70;
        }
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, Screen_width, height)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 82;
    }
    return _tableView;
}
-(UIButton *)createAddBtn{
    if (!_createAddBtn) {
        _createAddBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,CGRectYH(self.tableView)+ 25, Screen_width, 55)];
        [_createAddBtn setTitle:@"添加新地址" forState:0];
        [_createAddBtn setTitleColor:mainYellowColor forState:0];
        _createAddBtn.titleLabel.font = WFont(30);
        _createAddBtn.backgroundColor = [UIColor whiteColor];
        _createAddBtn.layer.borderWidth = 1;
        _createAddBtn.layer.borderColor = LH_RGBCOLOR(230, 230, 230).CGColor;
        [_createAddBtn addTarget:self action:@selector(respondsToAddBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _createAddBtn;
}
@end
