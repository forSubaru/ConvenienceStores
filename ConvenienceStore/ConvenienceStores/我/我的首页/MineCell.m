
//
//  MineCell.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/14.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "MineCell.h"

@implementation MineCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.cellContent];
        [self.contentView addSubview:self.cellTiele];
        UIButton *arrowBtn = [[UIButton alloc] initWithFrame:CGRectMake(Screen_width-30, 0, 30, 86*AdaptationWidth())];
        [arrowBtn setImage:MImage(@"arrow") forState:UIControlStateNormal];
        [self.contentView addSubview:arrowBtn];
        self.arrBtn = arrowBtn;
        
    }
    return self;
}
-(UIButton *)cellContent{
    if (!_cellContent) {
        _cellContent = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 90*AdaptationWidth(), 86*AdaptationWidth())];
        [_cellContent setTitleColor:[UIColor blackColor] forState:0];
    }
    return _cellContent;
}
-(UILabel *)cellTiele{
    if (!_cellTiele) {
        _cellTiele = [[UILabel alloc] initWithFrame:CGRectMake(CGRectXW(self.cellContent), 0, 200, 86*AdaptationWidth())];
        _cellTiele.font = WFont(26);
        _cellTiele.textAlignment = 0;
    }
    return _cellTiele;
}
@end
