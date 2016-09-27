//
//  SelectSendTimeView.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/24.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SelectSendTimeView;

@protocol SelectSenderTimeDelegate <NSObject>

-(void)senderTimeString:(NSString *)timeTitle;

@end

@interface SelectSendTimeView : UIView

@property (nonatomic,weak) id<SelectSenderTimeDelegate> delegate; /*代理人*/

@end
