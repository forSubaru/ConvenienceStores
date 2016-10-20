//
//  MyOrderTopView.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/18.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyOrderTopView;
@protocol MyOrderTopViewDelegate <NSObject>

-(void)MyOrderTopView:(MyOrderTopView *)topView didSelectedButtonTitle:(NSString *)title;

@end
@interface MyOrderTopView : UIView
@property (nonatomic,weak) id<MyOrderTopViewDelegate> delegate; /*代理人*/


@end
