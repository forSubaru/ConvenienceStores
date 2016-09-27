//
//  SelectPayTypeView.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/24.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SelectPayTypeView;

@protocol SelectPayTypeViewDelegate <NSObject>

-(void)selectedPayType:(NSString *)title;

@end

@interface SelectPayTypeView : UIView
@property (nonatomic,weak) id<SelectPayTypeViewDelegate> delegate; /*代理人*/

@end
