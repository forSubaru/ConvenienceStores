//
//  MyPointCell.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/14.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "MyPointCell.h"

@implementation MyPointCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.cellDetail];
        [self.contentView addSubview:self.cellPoint];
        [self.contentView addSubview:self.cellTime];
    }
    return self;
}
#pragma mark *** getters ***
-(UILabel *)cellDetail{
    if (!_cellDetail) {
        _cellDetail = [[UILabel alloc] initWithFrame:AdaptationFrame(0, 0, (Screen_width-20)/3/AdaptationWidth(), 47)];
        _cellDetail.font = WFont(30);
        _cellDetail.text = @"消费";
        _cellDetail.textAlignment = 1;
    }
    return _cellDetail;
}
-(UILabel *)cellPoint{
    if (!_cellPoint) {
        _cellPoint = [self.cellDetail deepCopy];
        _cellPoint.frame = AdaptationFrame((Screen_width-20)/3/AdaptationWidth(), 0, (Screen_width-20)/3/AdaptationWidth(), 47);
        _cellPoint.textColor = [UIColor redColor];
        _cellPoint.text = @"+1";
        
    }
    return _cellPoint;
}
-(UILabel *)cellTime{
    if (!_cellTime) {
        _cellTime = [self.cellDetail deepCopy];
        _cellTime.frame = AdaptationFrame((Screen_width-20)/3/AdaptationWidth()*2, 0, (Screen_width-20)/3/AdaptationWidth(), 47);
        _cellTime.textColor  = LH_RGBCOLOR(142, 142, 142);
        _cellTime.text = @"2016-08-11";
    }
    return _cellTime;
}
@end
