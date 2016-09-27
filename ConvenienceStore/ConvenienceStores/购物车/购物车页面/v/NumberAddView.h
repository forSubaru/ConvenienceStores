//
//  NumberAddView.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/19.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NumberAddView;
@protocol NumberAddViewDelegate <NSObject>

-(void)NumberAddView:(NumberAddView *)addView NumberChanged:(NSString *)number;

@end
@interface NumberAddView : UIView
/**数字*/
@property (nonatomic,strong) UILabel *numberLabel;
@property (nonatomic,weak) id<NumberAddViewDelegate> delegate; /*代理人*/

@end
