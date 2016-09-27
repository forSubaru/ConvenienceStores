//
//  SureOrderCell.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/24.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "SureOrderCell.h"

@implementation SureOrderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.cellGoodsNum];
        self.cellPrice.letter.font = WFont(25);
        self.cellPrice.price.font = WFont(30);
        self.cellPrice.center = CGPointMake(self.cellPrice.center.x, self.cellPrice.center.y+10);
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(UILabel *)cellGoodsNum{
    if (!_cellGoodsNum) {
        _cellGoodsNum = [[UILabel alloc] initWithFrame:CGRectMake(CGRectX(self.cellName), CGRectYH(self.cellName), 300*AdaptationWidth(), 50*AdaptationWidth())];
        _cellGoodsNum.textAlignment = 0;
        _cellGoodsNum.text = @"数量：x1  颜色：3kg";
        _cellGoodsNum.textColor = LH_RGBCOLOR(50, 50, 50);
        _cellGoodsNum.font = WFont(29);
    }
    return _cellGoodsNum;
}
@end
