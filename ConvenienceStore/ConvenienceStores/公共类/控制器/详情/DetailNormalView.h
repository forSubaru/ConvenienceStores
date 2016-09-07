//
//  DetailNormalView.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/5.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RedPriceLabel.h"
@interface DetailNormalView : UIView
/**商品名称*/
@property (nonatomic,strong) UILabel *detailName;
/**月销量*/
@property (nonatomic,strong) UILabel *detailsells;
/**库存*/
@property (nonatomic,strong) UILabel *detailRemain;
/**价格*/
@property (nonatomic,strong) RedPriceLabel *detailPrice;
/**地区*/
@property (nonatomic,strong) UILabel *detailPosition;
/**促销*/
@property (nonatomic,strong) UIButton *detailPromotion;
/**促销内容*/
@property (nonatomic,strong) UILabel *detailProText;
/**积点*/
@property (nonatomic,strong) UIButton *detailPoint;
/**积点内容*/
@property (nonatomic,strong) UILabel *detailPoText;
















@end
