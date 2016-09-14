//
//  ChangeSexViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/14.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "ChangeSexViewController.h"

@interface ChangeSexViewController ()<UITableViewDelegate,UITableViewDataSource>
/**tablview*/
@property (nonatomic,strong) UITableView *tableView;
/**钩*/
@property (nonatomic,strong) UIButton *selecView;

@end

@implementation ChangeSexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.selecView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sexCell"];
    cell.textLabel.text = @"男";
    if (indexPath.row==1) {
        cell.textLabel.text = @"女";
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        self.sex = true;
    }else{
        self.sex = false;
    }
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)setSex:(BOOL)sex{
    _sex = sex;
    
    self.selecView.frame = CGRectMake(Screen_width-40, 74+(_sex?0:40), 40, 40);
    
}
#pragma mark *** getters ***
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 74, Screen_width, 80)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"sexCell"];
        _tableView.rowHeight = 40;
        _tableView.bounces = false;
    }
    return _tableView;
}
-(UIButton *)selecView{
    if (!_selecView) {
        _selecView = [[UIButton alloc] initWithFrame:CGRectMake(Screen_width-40, 74, 40, 40)];
        [_selecView setImage:MImage(@"xingbie") forState:0];
    }
    return _selecView;
}
@end
