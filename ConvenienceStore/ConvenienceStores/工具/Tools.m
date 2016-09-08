//
//  Tools.m
//  FamilyTree
//
//  Created by 王子豪 on 16/5/24.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "Tools.h"

@implementation Tools


#pragma mark *** VC Titles ***

NSString * _Nonnull const kStringWithHomeVcTitle = @"首页";
NSString * _Nonnull const kStringWithGoodsTypeVcTitle = @"分类";
NSString * _Nonnull const kStringWithGroupBuyVcTitle = @"团购";
NSString * _Nonnull const kStringWithShopCartVcTitle = @"购物车";
NSString * _Nonnull const kStringWithPersonalCenterVcTitle = @"我";

#pragma mark *** VC Images ***
NSString * _Nonnull const kImageWithHomeVc = @"home";
NSString * _Nonnull const kImageWithGoodsTypeVc = @"fenlei";
NSString * _Nonnull const kImageWithGroupBuyVc = @"group";
NSString * _Nonnull const kImageWithShopCartVcVc = @"car";
NSString * _Nonnull const kImageWithPersonalCenterVc = @"user";

#pragma mark *** VC SelectedImages ***

NSString * _Nonnull const kSelectedImageWithHomeVc = @"home_color";
NSString * _Nonnull const kSelectedImageWithGoodsTypeVc = @"fenlei_color";
NSString * _Nonnull const kSelectedImageWithGroupBuyVc = @"group_color";
NSString * _Nonnull const kSelectedImageWithShopCartVc = @"car_color";
NSString * _Nonnull const kSelectedImageWithPersonalCenterVc = @"user_color";

#pragma mark *** 网络请求requestcode ***
//登录
NSString * _Nonnull const kRequestCodeLogin = @"login";
NSString * _Nonnull const kNotificationRootTabbar = @"kNotificationRootTabbar";

+(void)showAlertViewControllerAutoDissmissWithTarGet:(id)target
                                             Message:(NSString *)message
                                               delay:(NSInteger)time
                                            complete:(void (^)(BOOL))complete{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    [target presentViewController:alert animated:YES completion:^{
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [target dismissViewControllerAnimated:YES completion:nil];
            complete(YES);
        });
    }];
}

+(void)showAlertViewcontrollerWithTarGet:(id)target Message:(NSString *)message complete:(void (^)(BOOL))complete{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        complete(true);
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        complete(false);
    }]];
    [target presentViewController:alert animated:YES completion:nil];

}
@end
