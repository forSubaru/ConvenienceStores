//
//  FourButtonView.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/8/31.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FourButtonView;
@protocol FourButtonViewDelegate <NSObject>

-(void)FourButtonView:(FourButtonView *)fourView didTapItemForTitle:(NSString *)title;

@end
@interface FourButtonView : UIView
@property (nonatomic,weak) id<FourButtonViewDelegate> delegate; /*代理人*/

@end
