//
//  MyOrderTableCell.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/18.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyOrderTableCell;
@protocol MyOrderTableCellDelegate <NSObject>

-(void)MyOrderTableCell:(MyOrderTableCell *)orderCell didTapButtonWithTitle:(NSString *)title;

@end

@interface MyOrderTableCell : UITableViewCell
/**订单号*/
@property (nonatomic,strong) UILabel *cellOrderNum;
/**状态*/
@property (nonatomic,strong) UILabel *cellState;
/**时间*/
@property (nonatomic,strong) UILabel *cellTime;
/**共多少 应付多少*/
@property (nonatomic,strong) UILabel *cellAllNumber;
/**加个*/
@property (nonatomic,strong) RedPriceLabel *cellPriceLabel;


@property (nonatomic,weak) id<MyOrderTableCellDelegate> delegate; /*代理人*/

-(void)initWithDataModel:(NSArray *)modelArr;

@end
