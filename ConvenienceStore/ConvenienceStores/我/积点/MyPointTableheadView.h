//
//  MyPointTableheadView.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/18.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyPointTableheadView;
@protocol MyPointTableheadViewDelegate <NSObject>

-(void)MyPointTableheadView:(MyPointTableheadView *)myheadView didSelectedButtonTitle:(NSString *)title;

@end
@interface MyPointTableheadView : UITableViewCell
@property (nonatomic,weak) id<MyPointTableheadViewDelegate> delegate; /*代理人*/


@end
