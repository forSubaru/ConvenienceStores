//
//  Tools.h
//  FamilyTree
//
//  Created by 王子豪 on 16/5/24.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Tools : NSObject

#pragma mark *** VC Titles ***

UIKIT_EXTERN NSString * _Nonnull const kStringWithHomeVcTitle;
UIKIT_EXTERN NSString * _Nonnull const kStringWithGoodsTypeVcTitle;
UIKIT_EXTERN NSString * _Nonnull const kStringWithGroupBuyVcTitle;
UIKIT_EXTERN NSString * _Nonnull const kStringWithShopCartVcTitle;
UIKIT_EXTERN NSString * _Nonnull const kStringWithPersonalCenterVcTitle;

#pragma mark *** VC Images ***
UIKIT_EXTERN NSString * _Nonnull const kImageWithHomeVc;
UIKIT_EXTERN NSString * _Nonnull const kImageWithGoodsTypeVc;
UIKIT_EXTERN NSString * _Nonnull const kImageWithGroupBuyVc;
UIKIT_EXTERN NSString * _Nonnull const kImageWithShopCartVcVc;
UIKIT_EXTERN NSString * _Nonnull const kImageWithPersonalCenterVc;

#pragma mark *** VC SelectedImages ***

UIKIT_EXTERN NSString * _Nonnull const kSelectedImageWithHomeVc;
UIKIT_EXTERN NSString * _Nonnull const kSelectedImageWithGoodsTypeVc;
UIKIT_EXTERN NSString * _Nonnull const kSelectedImageWithGroupBuyVc;
UIKIT_EXTERN NSString * _Nonnull const kSelectedImageWithShopCartVc;
UIKIT_EXTERN NSString * _Nonnull const kSelectedImageWithPersonalCenterVc;

#pragma mark *** 网络请求requestCode ***
UIKIT_EXTERN NSString * _Nonnull const kRequestCodeLogin;

/**
 *  弹出框自动消失
 *
 *  @param title 弹出框内容
 */

/**
 *  弹出框
 *
 *  @param target  调用UIAlertController的对象
 *  @param message 提示语句
 *  @param time    延时多少秒消失
 */
+ (void)showAlertViewControllerAutoDissmissWithTarGet:(id _Nonnull)target Message:(NSString * _Nonnull)message delay:(NSInteger)time complete:(void (^ _Nullable)(BOOL))complete;

/**
 *  弹出框带确定消失按钮
 *
 *  @param target   调用UIAlertController的对象一般为selfVC
 *  @param message  提示语句
 *  @param complete 完成点击取消确定
 */

+ (void)showAlertViewcontrollerWithTarGet:(id _Nonnull)target Message:(NSString * _Nonnull)message complete:(void (^ _Nullable)(BOOL sure))complete;


@end
