//
//  BaseViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/8/30.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
{
    BOOL _hideTabbar;  /*是否隐藏底部标签栏*/

}

/**左上角扫一扫*/
@property (nonatomic,strong) UIButton *scanBtn;
/**右上角客服*/
@property (nonatomic,strong) UIButton *customerServiceBtn;
/**搜索栏*/
@property (nonatomic,strong) SearchView *searchView;
/**标题*/
@property (nonatomic,strong) UILabel *titleLabel;
/**返回按钮*/
@property (nonatomic,strong) UIButton *backBtn;
/**右上角三个点*/
@property (nonatomic,strong) UIButton *pointBtn;
/**超市有位置标题*/
@property (nonatomic,strong) UIButton *positonNameBtn;
/**搜索*/
@property (nonatomic,strong) UIButton *searchBtn;

@end

@implementation BaseViewController
//无标题的VC
- (instancetype)initWithHeaderType:(HeaderType)headerType
{
    self = [super init];
    if (self) {
        if (headerType == HeaderTypeHomeVc) {
            [self.backView addSubview:self.scanBtn];
            [self.backView addSubview:self.customerServiceBtn];
            [self.backView addSubview:self.searchView];
        }else if (headerType == HeaderTypeSupermaket){
            [self.backView addSubview:self.searchBtn];
            [self.backView addSubview:self.positonNameBtn];
            [self.backView addSubview:self.customerServiceBtn];
        }
    }
    return self;
}
//带标题的VC
-(instancetype)initWithHeaderType:(HeaderType)headerType title:(NSString *)title{
    self = [super init];
    if (self) {
        UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, 20)];
        blackView.backgroundColor = [UIColor blackColor];
                [self.view addSubview:blackView];
        self.topBlackView = blackView;
        [self.backView addSubview:self.backBtn];
        [self.backView addSubview:self.titleLabel];
        
        if (headerType == HeaderTypeOnlyBack) {
            
        }else if (headerType == HeaderTypeBackAndThreePoint){
            self.titleLabel.text = title;
            [self.backView addSubview:self.pointBtn];
            self.view.backgroundColor = mainBackGrayColor;
        }
        
    }
    return self;
}
//带标题的VC 是否隐藏标签栏
-(instancetype)initWithHeaderType:(HeaderType)headerType title:(NSString *)title hideTabbar:(BOOL)isHide{
    self = [super init];
    if (self) {
        
        _hideTabbar = isHide;
        
        UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, 20)];
        blackView.backgroundColor = [UIColor blackColor];
        [self.view addSubview:blackView];
        self.topBlackView = blackView;
        [self.backView addSubview:self.backBtn];
        [self.backView addSubview:self.titleLabel];
        
        if (headerType == HeaderTypeOnlyBack) {
            
        }else if (headerType == HeaderTypeBackAndThreePoint){
            self.titleLabel.text = title;
            [self.backView addSubview:self.pointBtn];
            self.view.backgroundColor = mainBackGrayColor;
        }
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.backView];
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (_hideTabbar) {
        self.tabBarController.tabBar.hidden = true;
    }
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (_hideTabbar) {
        self.tabBarController.tabBar.hidden = false;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark *** events ***
-(void)respondsToReturnBtn:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:true];
}
#pragma mark *** getters ***

-(UIView *)backView{
    if (!_backView) {
        
        _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, Screen_width, 44)];
        _backView.backgroundColor = LH_RGBCOLOR(251, 201, 9);
    }
    return _backView;
}
-(UIButton *)scanBtn{
    if (!_scanBtn) {
        _scanBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        [_scanBtn setImage:MImage(@"code") forState:UIControlStateNormal];
    }
    return _scanBtn;
}
-(UIButton *)customerServiceBtn{
    if (!_customerServiceBtn) {
        _customerServiceBtn = [[UIButton alloc] initWithFrame:CGRectMake(Screen_width-44, 0, 44, 44)];
        [_customerServiceBtn setImage:MImage(@"news") forState:UIControlStateNormal];
    }
    return _customerServiceBtn;
}
-(SearchView *)searchView{
    if (!_searchView) {
        _searchView = [[SearchView alloc] initWithFrame:CGRectMake(0, 0, 420*AdaptationWidth(), 50*AdaptationWidth())];
        _searchView.center = CGPointMake(self.backView.center.x, self.backView.center.y-20);
        
    }
    return _searchView;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300*AdaptationWidth(), self.backView.bounds.size.height)];
        _titleLabel.center = CGPointMake(self.backView.center.x, _titleLabel.center.y);
        _titleLabel.textAlignment = 1;
        _titleLabel.font = WFont(35);
        _titleLabel.text = @"标题文字的的";
    }
    return _titleLabel;
}
-(UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        [_backBtn setImage:MImage(@"return") forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(respondsToReturnBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}
-(UIButton *)positonNameBtn{
    if (!_positonNameBtn) {
        _positonNameBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300*AdaptationWidth(), self.backView.bounds.size.height)];
        _positonNameBtn.center = CGPointMake(self.backView.center.x, _positonNameBtn.center.y);
        [_positonNameBtn setImage:MImage(@"place") forState:UIControlStateNormal];
        [_positonNameBtn setTitle:@"命运石之门" forState:UIControlStateNormal];
        [_positonNameBtn setTitleColor:LH_RGBCOLOR(61, 10, 7) forState:UIControlStateNormal];
        _positonNameBtn.titleLabel.font = WFont(35);
        _positonNameBtn.titleLabel.textAlignment = 1;
    }
    return _positonNameBtn;
}
-(UIButton *)pointBtn{
    if (!_pointBtn) {
        _pointBtn = [[UIButton alloc] initWithFrame:CGRectMake(Screen_width-44, 0, 44, 44)];
        [_pointBtn setImage:MImage(@"assort") forState:UIControlStateNormal];
    }
    return _pointBtn;
}
-(UIButton *)searchBtn{
    if (!_searchBtn) {
        _searchBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        [_searchBtn setImage:MImage(@"find") forState:UIControlStateNormal];
    }
    return _searchBtn;
}
@end
