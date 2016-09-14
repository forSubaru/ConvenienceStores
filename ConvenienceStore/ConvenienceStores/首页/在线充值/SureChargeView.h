//
//  SureChargeView.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/13.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SureChargeView : UIView
- (instancetype)initWithFrame:(CGRect)frame
               chargePhoneNum:(NSString *)phoneNum
                    withMoney:(NSString *)money
                     disMoney:(NSString *)disMoney;
@end
