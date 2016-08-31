//
//  CommonCollectionViewCell.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/8/31.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "CommonCollectionViewCell.h"

@implementation CommonCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        if (style == cellStyleHot) {
//            self.backgroundColor = LH_RandomColor;
            [self.contentView addSubview:self.cellImage];

//        }else if (style == cellStyleGroup) {
//            self.backgroundColor = [UIColor redColor];
//        }
    }
    return self;
}
#pragma mark *** getters ***
-(UIImageView *)cellImage{
    if (!_cellImage) {
        _cellImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 140*AdaptationWidth())];
        _cellImage.image = MImage(@"gundong");
    }
    return _cellImage;
}
@end
