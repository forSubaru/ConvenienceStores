//
//  GroupVariousCell.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/7.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GroupCollectionViewCell.h"
@interface GroupVariousCell : GroupCollectionViewCell
/**原价*/
@property (nonatomic,strong) RedPriceLabel *cellPriceLabel;
/**已售多少件*/
@property (nonatomic,strong) UILabel *cellSellsNumber;

@end
