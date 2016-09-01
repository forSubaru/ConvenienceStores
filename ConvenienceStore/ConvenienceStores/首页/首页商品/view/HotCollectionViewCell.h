//
//  HotCollectionViewCell.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/8/31.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotCollectionViewCell : UICollectionViewCell
/**图片*/
@property (nonatomic,strong) UIImageView *cellImage;
/**名字*/
@property (nonatomic,strong) UILabel *cellName;
/**价格*/
@property (nonatomic,strong) RedPriceLabel *cellPrice;
@end
