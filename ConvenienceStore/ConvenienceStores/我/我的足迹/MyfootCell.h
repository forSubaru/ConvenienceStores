//
//  MyfootCell.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/19.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyfootCell : UITableViewCell
/**图片*/
@property (nonatomic,strong) UIImageView *cellImage;
/**名字*/
@property (nonatomic,strong) UILabel *cellName;
/**价格*/
@property (nonatomic,strong) RedPriceLabel *cellPrice;

@end
