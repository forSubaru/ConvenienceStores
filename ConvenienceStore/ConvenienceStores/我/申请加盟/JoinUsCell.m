//
//  JoinUsCell.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/19.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "JoinUsCell.h"

@implementation JoinUsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.cellName];
        [self.contentView addSubview:self.cellTextField];
        if (style == UITableViewCellStyleDefault) {
            [self.contentView addSubview:self.cellSitaBtn];
        }
    }
    return self;
}
-(UILabel *)cellName{
    if (!_cellName) {
        _cellName = [[UILabel alloc] initWithFrame:AdaptationFrame(20, 0, 64, 77)];
        _cellName.text = @"姓名";
        _cellName.font = WFont(30);
        _cellName.textColor = [UIColor blackColor];
    }
    return _cellName;
}
-(UITextField *)cellTextField{
    if (!_cellTextField) {
        _cellTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectXW(self.cellName)+25*AdaptationWidth(), 0, 200, 77*AdaptationWidth())];
        _cellTextField.placeholder = @"请输入";
        _cellTextField.font = WFont(30);
        _cellTextField.textAlignment = 0;
    }
    return _cellTextField;
}
-(UIButton *)cellSitaBtn{
    if (!_cellSitaBtn) {
        _cellSitaBtn = [[UIButton alloc] initWithFrame:CGRectMake(Screen_width-44, 0, 44, 77*AdaptationWidth())];
        [_cellSitaBtn setImage:MImage(@"jmjian") forState:0];
    }
    return _cellSitaBtn;
}
@end
