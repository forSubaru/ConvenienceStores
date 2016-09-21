//
//  MyfootCell.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/19.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "MyfootCell.h"

@implementation MyfootCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.cellImage];
        [self.contentView addSubview:self.cellName];
        [self.contentView addSubview:self.cellPrice];
        
        
        
    }
    return self;
}
-(UIImageView *)cellImage{
    if (!_cellImage) {
        _cellImage = [[UIImageView alloc] initWithFrame:AdaptationFrame(25, 22, 174, 164)];
        _cellImage.image = MImage(@"fangbianmian");
    }
    return _cellImage;
}
-(UILabel *)cellName{
    if (!_cellName) {
        _cellName = [[UILabel alloc] initWithFrame:CGRectMake(CGRectXW(self.cellImage)+10, 30*AdaptationWidth(), 450*AdaptationWidth(), 80*AdaptationWidth())];
        _cellName.text  =@"图额南进口方便面超级重和方便面";
        _cellName.font = WFont(30);
    }
    return _cellName;
}
-(RedPriceLabel *)cellPrice{
    if (!_cellPrice) {
        _cellPrice = [[RedPriceLabel alloc] initWithFrame:CGRectMake(CGRectX(self.cellName), CGRectYH(self.cellName)+25*AdaptationWidth(), 100, 50*AdaptationWidth()) string:@"59.40" priceLabeltype:PriceLabelTypeRedSameLetterAndNumber];
        _cellPrice.letter.font = WFont(33);
        _cellPrice.price.font  = WFont(35);
        _cellPrice.price.frame = CGRectMake(_cellPrice.price.frame.origin.x, _cellPrice.price.frame.origin.y, 100, _cellPrice.price.bounds.size.height);
    }
    return _cellPrice;
}
@end
