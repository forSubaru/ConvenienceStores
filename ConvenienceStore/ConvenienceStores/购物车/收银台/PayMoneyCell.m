//
//  PayMoneyCell.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/26.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "PayMoneyCell.h"

@implementation PayMoneyCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle =UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.cellImage];
        [self.contentView addSubview:self.cellTitle];
        [self.contentView addSubview:self.cellDetail];
    }
    return self;
}

-(UIButton *)cellImage{
    if (!_cellImage) {
        _cellImage = [[UIButton alloc] initWithFrame:AdaptationFrame(0, 0, 95, 95)];
        [_cellImage setImage:MImage(@"alipay") forState:0];
        
    }
    return _cellImage;
}
-(UILabel *)cellTitle{
    if (!_cellTitle) {
        _cellTitle = [[UILabel alloc] initWithFrame:AdaptationFrame(CGRectXW(self.cellImage)/AdaptationWidth(), 15, 193, 35)];
        _cellTitle.font = WFont(30);
        _cellTitle.text = @"快捷支付";
    }
    return _cellTitle;
}
-(UILabel *)cellDetail{
    if (!_cellDetail) {
        _cellDetail = [[UILabel alloc] initWithFrame:AdaptationFrame(CGRectX(self.cellTitle)/AdaptationWidth(), CGRectYH(self.cellTitle)/AdaptationWidth(), 240, 30)];
        _cellDetail.text = @"社区支付快捷服务";
        _cellDetail.textColor = LH_RGBCOLOR(150, 150, 150);
        _cellDetail.font = WFont(25);
    }
    return _cellDetail;
}
@end
