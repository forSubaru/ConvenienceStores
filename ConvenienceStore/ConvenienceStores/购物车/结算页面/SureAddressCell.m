//
//  SureAddressCell.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/24.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "SureAddressCell.h"
@interface SureAddressCell()
/**默认*/
@property (nonatomic,strong) UILabel *defalultLabel;

@end
@implementation SureAddressCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
        for (int idx = 0; idx<2; idx++) {
            UIImageView *imag = [[UIImageView alloc] initWithFrame:CGRectMake(0, idx*215*AdaptationWidth(), Screen_width, 1)];
            imag.image = MImage(@"caitiao");
            [self.contentView addSubview:imag];
        }
    }
    return self;
}

#pragma mark *** 初始化界面 ***
-(void)initUI{
    [self.contentView addSubview:self.cellName];
    [self.contentView addSubview:self.cellMobile];
    [self.contentView addSubview:self.cellAddress];
    [self.contentView addSubview:self.defalultLabel];
}
-(UILabel *)cellName{
    if (!_cellName) {
        _cellName = [[UILabel alloc] initWithFrame:AdaptationFrame(55, 25, 120, 46)];
        _cellName.font = WFont(30);
        _cellName.textAlignment = 0;
        _cellName.text = @"牧濑红";
    }
    return _cellName;
}
-(UILabel *)cellMobile{
    if (!_cellMobile) {
        _cellMobile= [[UILabel alloc] initWithFrame:CGRectMake(CGRectXW(self.cellName), CGRectY(self.cellName), 205*AdaptationWidth(), 46*AdaptationWidth())];
        _cellMobile.font = WFont(30);
        _cellMobile.text = @"15422111335";
    }
    return _cellMobile;
}
-(UILabel *)cellAddress{
    if (!_cellAddress) {
        
        UIImageView *siteimage = [[UIImageView alloc] initWithFrame:CGRectMake(5, CGRectYH(self.cellMobile)+10, 20, 20)];
        siteimage.image = MImage(@"site");
        siteimage.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:siteimage];
        
        _cellAddress = [[UILabel alloc] initWithFrame:CGRectMake(CGRectX(self.cellName), CGRectYH(self.cellMobile), 545*AdaptationWidth(), 90*AdaptationWidth())];
        _cellAddress.font = WFont(27);
        _cellAddress.numberOfLines = 2;
        _cellAddress.text = @"四川身泸州市高新区龙马潭托斯卡纳2030四川身泸州市高新区龙马潭托斯卡纳2030";
    }
    return _cellAddress;
}
-(UILabel *)defalultLabel{
    if (!_defalultLabel) {
        _defalultLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectXW(self.cellMobile), CGRectY(self.cellMobile)+5*AdaptationWidth(), 75*AdaptationWidth(), 36*AdaptationWidth())];
        _defalultLabel.backgroundColor = [UIColor redColor];
        _defalultLabel.text = @"默认";
        _defalultLabel.font = WFont(27);
        _defalultLabel.textColor = [UIColor whiteColor];
        _defalultLabel.textAlignment = 1;
    }
    return _defalultLabel;
}
@end
