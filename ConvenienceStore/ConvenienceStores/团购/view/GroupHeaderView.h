//
//  GroupHeaderView.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/7.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GroupHeaderView;
@protocol GroupHeaderViewDelegate <NSObject>

-(void)GroupHeaderView:(GroupHeaderView *)groupView didSelectedButtonTitle:(NSString *)title;

@end
@interface GroupHeaderView : UIView
@property (nonatomic,weak) id<GroupHeaderViewDelegate> delegate; /*代理人*/

@end
