//
//  GroupCollectionViewCell.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/8/31.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "GroupCollectionViewCell.h"

@implementation GroupCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.cellImage.image = MImage(@"jiujiu");
        self.cellImage.frame = CGRectMake(5, 0, SelfView_width, 206*AdaptationWidth());
        self.cellName.text = @"洋河蓝色经典海";
        self.cellName.numberOfLines = 0;
        self.cellName.textAlignment = 0;
        self.cellName.frame = CGRectMake(5, CGRectYH(self.cellImage), self.bounds.size.width, 30*AdaptationWidth());
        [self.contentView addSubview:self.cellScaleLabel];
        self.cellPrice.frame = CGRectMake(5, CGRectYH(self.cellScaleLabel), self.bounds.size.width, 44*AdaptationWidth());
        self.cellPrice.textAlignment = 0;

        
    }
    return self;
}
#pragma mark *** getters ***
-(UILabel *)cellScaleLabel{
    if (!_cellScaleLabel) {
        _cellScaleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectX(self.cellName), CGRectYH(self.cellName), self.bounds.size.width/2, 30*AdaptationWidth())];
        _cellScaleLabel.font = WFont(20);
        _cellScaleLabel.textAlignment = 0;
        _cellScaleLabel.text = @"480ml";
    }
    return _cellScaleLabel;
}

@end
