//
//  AllParameterCell.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/7.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "AllParameterCell.h"

@implementation AllParameterCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.cellTitleLabel];
        [self.contentView addSubview:self.cellDetailLabel];
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
#pragma mark *** getters ***
-(UILabel *)cellTitleLabel{
    if (!_cellTitleLabel) {
        _cellTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100*AdaptationWidth(), self.bounds.size.height)];
        _cellTitleLabel.font = WFont(25);
        _cellTitleLabel.textAlignment = 0;
        _cellTitleLabel.textColor = LH_RGBCOLOR(171, 171, 171);
    }
    return _cellTitleLabel;
}
-(UILabel *)cellDetailLabel{
    if (!_cellDetailLabel) {
        _cellDetailLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectXW(self.cellTitleLabel), 0, 570*AdaptationWidth(), self.bounds.size.height)];
        _cellDetailLabel.font = self.cellTitleLabel.font;
        _cellDetailLabel.textAlignment = 0;
        _cellDetailLabel.numberOfLines = 0;
    }
    return _cellDetailLabel;
}
@end
