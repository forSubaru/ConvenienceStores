//
//  ChargeViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/13.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "ChargeViewController.h"
#import "SureChargeView.h"
@interface ChargeViewController ()
{
    NSArray *_motoArr;
    NSArray *_disArr;
}
/**充值号码*/
@property (nonatomic,strong) UITextField *chargeNumTF;


@end

@implementation ChargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = mainGrayColor;
    
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 15+64, Screen_width, 90*AdaptationWidth())];
    whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:whiteView];
    [whiteView addSubview:self.chargeNumTF];
    
    [self initChargePrice];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = true;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = false;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)initChargePrice{
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 15+64+20+90*AdaptationWidth(), Screen_width, 560*AdaptationWidth())];
    whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:whiteView];
    
    UILabel *titelLabel = [[UILabel alloc] initWithFrame:AdaptationFrame(0, 0, 130, 73)];
    titelLabel.text = @"充话费";
    titelLabel.font = WFont(36);
    titelLabel.textAlignment = 1;
    titelLabel.textColor = [UIColor blackColor];
    [whiteView addSubview:titelLabel];
    
    _motoArr = @[@"10",@"20",@"30",@"50",@"100",@"200",@"300",@"500",@"1000"];
    _disArr = @[@"9.89",@"19.89",@"29.67",@"49.45",@"99.90",@"197.80",@"296.71",@"494.70",@"990.20",];
    
    for (int idx = 0; idx<_motoArr.count; idx++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:AdaptationFrame( 22 +(idx%3)*240 , CGRectYH(titelLabel)/AdaptationWidth() +155*(idx/3), 218, 129)];
        btn.layer.borderColor = mainYellowColor.CGColor;
        btn.layer.borderWidth = 1.0f;
        [whiteView addSubview:btn];
        
        UILabel *motoLabel = [[UILabel alloc] initWithFrame:AdaptationFrame(0, 26, btn.bounds.size.width/AdaptationWidth(), 40)];
        motoLabel.textColor = mainYellowColor;
        motoLabel.font = WFont(36);
        motoLabel.textAlignment = 1;
        motoLabel.text = [NSString stringWithFormat:@"%@元",_motoArr[idx]];
        [btn addSubview:motoLabel];
        
        UILabel *priceLabel = [motoLabel deepCopy];
        priceLabel.frame = AdaptationFrame(0, CGRectYH(motoLabel)/AdaptationWidth(), btn.bounds.size.width/AdaptationWidth(), 30);
        priceLabel.text = [NSString stringWithFormat:@"售价:%@元",_disArr[idx]];
        priceLabel.font = WFont(30);
        [btn addSubview:priceLabel];
        
        btn.tag = idx;
        [btn addTarget:self action:@selector(respondsToChargeBtn:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
}
-(void)respondsToChargeBtn:(UIButton *)sender{
    
    if (![NSString validateMobile:self.chargeNumTF.text]) {
        [SXLoadingView showAlertHUD:@"手机号码不正确" duration:0.5];
        return;
    }
    
    NSLog(@"%ld--充%@--给%@", sender.tag,_motoArr[sender.tag],_disArr[sender.tag]);
    SureChargeView *sureView = [[SureChargeView alloc] initWithFrame:self.view.bounds chargePhoneNum:self.chargeNumTF.text withMoney:_motoArr[sender.tag] disMoney:_disArr[sender.tag]];
    [self.view addSubview:sureView];
}
#pragma mark *** getters ***
-(UITextField *)chargeNumTF{
    if (!_chargeNumTF) {
        
        _chargeNumTF = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, Screen_width-10, 90*AdaptationWidth())];
        _chargeNumTF.placeholder = @"请输入充值号码";
        _chargeNumTF.font = WFont(40);
        _chargeNumTF.backgroundColor = [UIColor whiteColor];
        
        UIButton *imageV = [[UIButton alloc] initWithFrame:CGRectMake(Screen_width-_chargeNumTF.bounds.size.height, 0, _chargeNumTF.bounds.size.height, _chargeNumTF.bounds.size.height)];
        [imageV setImage:MImage(@"renjia") forState:0];
        [_chargeNumTF addSubview:imageV];
    }
    return _chargeNumTF;
}

@end
