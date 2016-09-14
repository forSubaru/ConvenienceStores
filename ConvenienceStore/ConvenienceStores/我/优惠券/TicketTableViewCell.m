//
//  TicketTableViewCell.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/14.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "TicketTableViewCell.h"
@interface TicketTableViewCell()
/**背景*/
@property (nonatomic,strong) UIView *backView;
/**会员享受*/
@property (nonatomic,strong) UILabel *memberGet;

@end
@implementation TicketTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.backView];
        [self.backView addSubview:self.cellMiDis];
        [self.backView addSubview:self.cellValidTime];
        [self.backView addSubview:self.cellDicPrice];
        [self.backView addSubview:self.memberGet];
    }
    return self;
}
-(UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, Screen_width-20, 242*AdaptationWidth())];
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}
-(UILabel *)cellMiDis{
    if (!_cellMiDis) {
        _cellMiDis = [[UILabel alloc] initWithFrame:AdaptationFrame(25, 25, 242, 41)];
        
        _cellMiDis.text = @"优惠券满100可用";
        _cellMiDis.textColor = LH_RGBCOLOR(246, 98, 6);
        _cellMiDis.font = WFont(25);
        [UILabel setLabeltextAttributes:_cellMiDis withFont:WFont(40) range:NSMakeRange(0, 3)];
    }
    return _cellMiDis;
}
-(UILabel *)cellValidTime{
    if (!_cellValidTime) {
        _cellValidTime = [[UILabel alloc] initWithFrame:CGRectMake(CGRectX(self.cellMiDis), CGRectYH(self.cellMiDis), 260*AdaptationWidth(), 39*AdaptationWidth())];
        _cellValidTime.font = WFont(27);
        _cellValidTime.textColor = self.cellMiDis.textColor;
        _cellValidTime.text = @"有效期至2016-9-29";
    }
    return _cellValidTime;
}
-(UILabel *)cellDicPrice{
    if (!_cellDicPrice) {
        _cellDicPrice = [[UILabel alloc] initWithFrame:CGRectMake(Screen_width-20-108*AdaptationWidth(), 5, 108*AdaptationWidth(), 108*AdaptationWidth())];
        _cellDicPrice.textColor = self.cellValidTime.textColor;
        _cellDicPrice.font = WFont(30);
        _cellDicPrice.text = @"6元";
        [UILabel setLabeltextAttributes:_cellDicPrice withFont:WFont(60) range:NSMakeRange(0, 1)];
    }
    return _cellDicPrice;
}
-(UILabel *)memberGet{
    if (!_memberGet) {
        _memberGet = [[UILabel alloc] initWithFrame:CGRectMake(CGRectX(self.cellValidTime), 178*AdaptationWidth(), 200, 45*AdaptationWidth())];
        _memberGet.font = WFont(25);
        _memberGet.textColor = LH_RGBCOLOR(111,111,111);
        _memberGet.text = @"会员尊享购物满20元免运费";
    }
    return _memberGet;
}
@end
