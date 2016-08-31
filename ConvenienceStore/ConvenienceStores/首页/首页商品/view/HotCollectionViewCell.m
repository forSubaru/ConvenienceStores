//
//  HotCollectionViewCell.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/8/31.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "HotCollectionViewCell.h"

@implementation HotCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.cellImage];
        [self.contentView addSubview:self.cellName];
        [self.contentView addSubview:self.cellPrice];
    }
    return self;
}
#pragma mark *** getters ***
-(UIImageView *)cellImage{
    if (!_cellImage) {
        _cellImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 150*AdaptationWidth())];
        _cellImage.image = MImage(@"miaoshatu");
    }
    return _cellImage;
}
-(UILabel *)cellName{
    if (!_cellName) {
        _cellName = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectYH(self.cellImage), self.bounds.size.width, 60*AdaptationWidth())];
        _cellName.numberOfLines = 0;
        _cellName.font =WFont(25);
        _cellName.textAlignment = 1;
        _cellName.text = @"蒙牛纯牛奶常温唱啊大师级的";
        
    }
    return _cellName;
}
-(UILabel *)cellPrice{
    if (!_cellPrice) {
        _cellPrice = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectYH(self.cellName), self.bounds.size.width, 44*AdaptationWidth())];
        _cellPrice.font = WFont(25);
        _cellPrice.textColor = [UIColor redColor];
        _cellPrice.textAlignment = 1;
        _cellPrice.text = @"$88.8";
    }
    return _cellPrice;
}
@end
