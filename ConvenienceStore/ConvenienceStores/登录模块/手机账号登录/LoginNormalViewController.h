//
//  LoginNormalViewController.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/20.
//  Copyright © 2016年 王子豪. All rights reserved.
//
enum{
    AccountImage = 20,
    PassImage,
    AccpuntPlaceholder,
    PassPlaceholder,
};

#import "BaseViewController.h"

@interface LoginNormalViewController : BaseViewController

/**账号*/
@property (nonatomic,strong) UITextField *accountTexf;
/**密码*/
@property (nonatomic,strong) UITextField *passwordTecf;
/**忘记密码*/
@property (nonatomic,strong) UIButton *forgetPSDBtn;
/**注册按钮*/
@property (nonatomic,strong) UIButton *regisBtn;
/**手机验证登录*/
@property (nonatomic,strong) UIButton *mobileVerBtn;
/**立即登录btn*/
@property (nonatomic,strong) UIButton *loginNowBtn;

/**
 *  所有按钮事件
 *
 *  @param sender 
 */
-(void)respondsToAllBtn:(UIButton *)sender;
@end
