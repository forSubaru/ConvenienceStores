//
//  TicketTableViewCell.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/14.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TicketTableViewCell : UITableViewCell
/**满多少优惠*/
@property (nonatomic,strong) UILabel *cellMiDis;
/**有效期*/
@property (nonatomic,strong) UILabel *cellValidTime;
/**优惠多少钱*/
@property (nonatomic,strong) UILabel *cellDicPrice;

@end
