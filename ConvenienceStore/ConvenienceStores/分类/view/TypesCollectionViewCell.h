//
//  TypesCollectionViewCell.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/5.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TypesCollectionViewCell : UICollectionViewCell
/**图片*/
@property (nonatomic,strong) UIImageView *cellImage;
/**文字*/
@property (nonatomic,strong) UILabel *cellLabel;
/**价格*/
@property (nonatomic,strong) RedPriceLabel *cellPrice;

@end
