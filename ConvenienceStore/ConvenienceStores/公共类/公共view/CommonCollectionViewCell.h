//
//  CommonCollectionViewCell.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/8/31.
//  Copyright © 2016年 王子豪. All rights reserved.
//
typedef enum : NSUInteger {
    cellStyleHot,
    cellStyleGroup,
    
} cellStyle;
#import <UIKit/UIKit.h>

@interface CommonCollectionViewCell : UICollectionViewCell
/**图片*/
@property (nonatomic,strong) UIImageView *cellImage;
/**名字*/
@property (nonatomic,strong) UILabel *cellName;
/**价格*/
@property (nonatomic,strong) UILabel *cellPrice;

- (instancetype)initWithFrame:(CGRect)frame style:(cellStyle)style;

@end
