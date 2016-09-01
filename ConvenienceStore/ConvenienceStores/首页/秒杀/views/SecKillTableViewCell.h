//
//  SecKillTableViewCell.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/1.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface SecKillTableViewCell : UITableViewCell
/**图片*/
@property (nonatomic,strong) UIImageView *cellImage;
/**简介*/
@property (nonatomic,strong) UILabel *cellInfoLabel;
/**原价*/
@property (nonatomic,strong) RedPriceLabel *cellMotoPrice;
/**现价*/
@property (nonatomic,strong) RedPriceLabel *cellCurrPrice;
/**已抢购*/
@property (nonatomic,strong) UILabel *cellBuyLabel;
/**抢购条*/
@property (nonatomic,strong) UIView *cellProgressView;
/**
 *  设置还剩多少的百分比bar
 *
 *  @param percent 0~1
 */
-(void)addBarWithPercent:(CGFloat)percent;

@end
