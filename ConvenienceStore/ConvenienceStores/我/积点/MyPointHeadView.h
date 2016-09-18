//
//  MyPointHeadView.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/14.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyPointHeadView;
@protocol MyPointHeadViewDelegate <NSObject>

-(void)MyPointHeadView:(MyPointHeadView *)headView didSeletedButton:(NSString *)btnTitle;

@end
@interface MyPointHeadView : UIView
/**积点数*/
@property (nonatomic,strong) UILabel *pointNum;
/**某一天*/
@property (nonatomic,strong) UIButton *timeBtn;
@property (nonatomic,weak) id<MyPointHeadViewDelegate> delegate; /*代理人*/


@end
