//
//  InviteFriendViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/19.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "InviteFriendViewController.h"

@interface InviteFriendViewController ()
/**累计积点*/
@property (nonatomic,strong) UILabel *pointLabel;
/**我的邀请码*/
@property (nonatomic,strong) UILabel *myCodeLabel;
/**奖励规则*/
@property (nonatomic,strong) UITextView *ruleTextView;

@end

@implementation InviteFriendViewController

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
    [self.view addSubview:self.pointLabel];
    [self.view addSubview:self.myCodeLabel];
    [self.view addSubview:self.ruleTextView];
    
    UIButton *inviteBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, CGRectYH(self.ruleTextView)+10, Screen_width-20, 70*AdaptationWidth())];
    inviteBtn.backgroundColor = [UIColor redColor];
    [inviteBtn setTitle:@"邀请好友" forState:0];
    inviteBtn.titleLabel.font = WFont(30);
    [inviteBtn addTarget:self action:@selector(respondsToinvieBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:inviteBtn];
}
-(void)respondsToinvieBtn{
    NSLog(@"邀请好友");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
#pragma mark *** getters ***
-(UILabel *)pointLabel{
    if (!_pointLabel) {
        
        UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, Screen_width, 100*AdaptationWidth())];
        whiteView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:whiteView];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(5, 0, 350*AdaptationWidth(), 100*AdaptationWidth())];
        [btn setTitle:@"累计邀请回馈的积点:" forState:0];
        [btn setImage:MImage(@"jinbi") forState:0];
        [btn setTitleColor:LH_RGBCOLOR(135, 135, 135) forState:0];
        btn.titleLabel.font = WFont(30);
        [whiteView addSubview:btn];
        _pointLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectXW(btn), 64, 50, 100*AdaptationWidth())];
        _pointLabel.textColor = [UIColor redColor];
        _pointLabel.text = @"0";
        _pointLabel.font = WFont(35);
    }
    return _pointLabel;
}
-(UILabel *)myCodeLabel{
    if (!_myCodeLabel) {
        UIView *colView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectYH(self.pointLabel)+10, Screen_width, 70*AdaptationWidth())];
        colView.backgroundColor = LH_RGBCOLOR(238, 179, 188);
        [self.view addSubview:colView];
        
        UILabel *thelabel = [[UILabel alloc] initWithFrame:CGRectMake(8, CGRectY(colView), 100, colView.bounds.size.height)];
        thelabel.text = @"我的邀请码";
        thelabel.textColor = LH_RGBCOLOR(135, 135, 135);
        thelabel.font = WFont(30);
        [self.view addSubview:thelabel];
        
        _myCodeLabel = [[UILabel alloc] initWithFrame:CGRectMake(Screen_width-108, CGRectY(colView),100 ,70*AdaptationWidth())];
        _myCodeLabel.text = @"SYDHSLS";
        _myCodeLabel.textColor = thelabel.textColor;
        _myCodeLabel.textAlignment = 2;
        _myCodeLabel.font = thelabel.font;
        
    }
    return _myCodeLabel;
}
-(UITextView *)ruleTextView{
    if (!_ruleTextView) {
        _ruleTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, CGRectYH(self.myCodeLabel)+10, Screen_width, Screen_height-CGRectGetMaxY(self.myCodeLabel.frame)-10-126*AdaptationWidth())];
        _ruleTextView.text = @"\t\t\t\t\t奖励规则\n成功推荐好友使用邀请码注册，推荐人将获得被推荐人的下单积分回馈：\n积分回馈公式\n";
        _ruleTextView.font = WFont(30);
    }
    return _ruleTextView;
}
@end
