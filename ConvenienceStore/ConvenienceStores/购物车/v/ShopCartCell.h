//
//  ShopCartCell.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/19.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NumberAddView.h"
@class ShopCartCell;
@protocol ShopCartCellDelegate <NSObject>

-(void)ShopCartCell:(ShopCartCell *)cartCell goodsNumberChange:(NSString *)number;
-(void)ShopCartCellSelected:(ShopCartCell *)cartCell;

@end
@interface ShopCartCell : UITableViewCell
/**选择按钮*/
@property (nonatomic,strong) UIButton *cellSelecBtn;
/**图片*/
@property (nonatomic,strong) UIImageView *cellImage;
/**名字*/
@property (nonatomic,strong) UILabel *cellName;
/**规格*/
@property (nonatomic,strong) UILabel *cellType;
/**加个*/
@property (nonatomic,strong) RedPriceLabel *cellPrice;
/**个数*/
@property (nonatomic,strong) NSString *cellNumber;

@property (nonatomic,weak) id<ShopCartCellDelegate> delegate; /*代理人*/


@end
