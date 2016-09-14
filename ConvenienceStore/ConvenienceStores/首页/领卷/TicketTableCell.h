//
//  TicketTableCell.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/13.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TicketTableCell : UITableViewCell

/**减多少元*/
@property (nonatomic,strong) RedPriceLabel *cellDisPrice;
/**满多少元减*/
@property (nonatomic,strong) UILabel *cellMiPrice;
/**描述*/
@property (nonatomic,strong) UILabel *cellDetail;
/**使用时间*/
@property (nonatomic,strong) UILabel *cellUserTime;
/**已领人数*/
@property (nonatomic,strong) UILabel *cellGetTick;
/**已抢*/
@property (nonatomic,strong) UILabel *cellNoko;
-(void)initGetButtonWithPercent:(CGFloat)percent;
-(void)initSellout;
@end
