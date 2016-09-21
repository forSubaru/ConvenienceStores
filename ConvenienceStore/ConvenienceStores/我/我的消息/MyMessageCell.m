//
//  MyMessageCell.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/19.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "MyMessageCell.h"

@implementation MyMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *whiteView = [[UIView alloc]initWithFrame:CGRectMake(0, 8*AdaptationWidth(), Screen_width, 128*AdaptationWidth())];
        whiteView.backgroundColor  = [UIColor whiteColor];
        self.cellImage.frame = AdaptationFrame(15, 30, 90, 90);
        self.cellName.frame = AdaptationFrame(CGRectXW(self.cellImage)/AdaptationWidth()+15, 31,194, 43);
        [self.contentView addSubview:whiteView];
        [self.contentView bringSubviewToFront:self.cellImage];
        [self.contentView bringSubviewToFront:self.cellName];
        [self.cellPrice removeFromSuperview];
        [self.contentView addSubview:self.cellDetail];
        self.cellName.text = @"系统消息";
    }
    return self;
}
-(UILabel *)cellDetail{
    if (!_cellDetail) {
        _cellDetail = [[UILabel alloc] initWithFrame:CGRectMake(CGRectX(self.cellName), CGRectYH(self.cellName), 590*AdaptationWidth(), 45*AdaptationWidth())];
        _cellDetail.font = WFont(27);
        _cellDetail.textColor = LH_RGBCOLOR(160, 160, 160);
        _cellDetail.text = @"恭喜注册成功社区送您一张优惠券";
    }
    return _cellDetail;
}
@end
