//
//  GoodsTypeViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/8/29.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "GoodsTypeViewController.h"
#import "MaketOpenTimeView.h"
#import "GoodsSelecView.h"
@interface GoodsTypeViewController ()<GoodsSelecViewDelegate>
/**营业时间*/
@property (nonatomic,strong) MaketOpenTimeView *headTimeView;
/**具体选择商品的视图*/
@property (nonatomic,strong) GoodsSelecView *selecView;

@end

@implementation GoodsTypeViewController

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
    [self.view addSubview:self.headTimeView];
    [self.view addSubview:self.selecView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark *** SelecViewDelegate ***
-(void)GoodsSelecView:(GoodsSelecView *)selecView didSelectedLeftViewTitle:(NSString *)leftTitle{
    NSLog(@"%@", leftTitle);
}
#pragma mark *** getters ***
-(MaketOpenTimeView *)headTimeView{
    if (!_headTimeView) {
        _headTimeView = [[MaketOpenTimeView alloc] initWithFrame:CGRectMake(0, 64, Screen_width, 50*AdaptationWidth())];
        
        
    }
    return _headTimeView;
}
-(GoodsSelecView *)selecView{
    if (!_selecView) {
        _selecView = [[GoodsSelecView alloc] initWithFrame:CGRectMake(0, CGRectYH(self.headTimeView), Screen_width, HeightExceptNaviAndTabbar-50*AdaptationWidth())];
        _selecView.delegate = self;
    }
    return _selecView;
}

@end
