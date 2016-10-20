//
//  SearchColleCell.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/28.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchColleCell : UICollectionViewCell
/**商品id*/
@property (nonatomic,copy) NSString *cellGoodsId;
/**商品图片*/
@property (nonatomic,strong) UIImageView *cellImage;
/**商品名*/
@property (nonatomic,strong) UILabel *cellTitle;
/**商品价格*/
@property (nonatomic,strong) RedPriceLabel *cellPrice;




@end
