


//
//  TicketTableCell.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/13.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "TicketTableCell.h"
#import "DrawNokoTicket.h"
@interface TicketTableCell()
/**右边图view*/
@property (nonatomic,strong) UIImageView *rightView;

@end
@implementation TicketTableCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.cellDisPrice];
        [self.contentView addSubview:self.cellMiPrice];
        [self.contentView addSubview:self.cellDetail];
        [self.contentView addSubview:self.cellUserTime];
        [self.contentView addSubview:self.cellGetTick];
        [self.contentView addSubview:self.cellNoko];
//        [self initGetButtonWithPercent:0.25];
    }
    return self;
}

-(void)initGetButtonWithPercent:(CGFloat)percent{
    
    [self.contentView addSubview:self.rightView];
    
    UIButton *getNowBtn = [[UIButton alloc] initWithFrame:AdaptationFrame(17, 126, 126, 46)];
    [getNowBtn setTitle:@"立即领取" forState:UIControlStateNormal];
    [getNowBtn setTitleColor:LH_RGBCOLOR(75, 168, 255) forState:UIControlStateNormal];
    getNowBtn.titleLabel.font = WFont(20);
    getNowBtn.layer.borderWidth = 3;
    getNowBtn.layer.borderColor = LH_RGBCOLOR(25, 140, 247).CGColor;
    getNowBtn.backgroundColor = [UIColor whiteColor];
    getNowBtn.layer.cornerRadius = 23*AdaptationWidth();
    [self.rightView addSubview:getNowBtn];
    
    DrawNokoTicket *drawView = [[DrawNokoTicket alloc] initWithFrame:AdaptationFrame(31, 20, 100, 100) buyPercent:percent];
    drawView.backgroundColor = [UIColor clearColor];
    [self.rightView addSubview:drawView];
}
-(void)initSellout{
    self.rightView.image = MImage(@"qiangwan");
    [self.contentView addSubview:self.rightView];
    
}
#pragma mark *** getters ***
-(UIImageView *)rightView{
    if (!_rightView) {
        _rightView = [[UIImageView alloc] initWithFrame:CGRectMake(570*AdaptationWidth(), 0, 165*AdaptationWidth(), 190*AdaptationWidth())];
        _rightView.image = MImage(@"you");
    }
    return _rightView;
}
-(RedPriceLabel *)cellDisPrice{
    if (!_cellDisPrice) {
        _cellDisPrice = [[RedPriceLabel alloc] initWithFrame:AdaptationFrame(45, 45, 73, 66) string:@"5" priceLabeltype:PriceLabelTypeRedSameLetterAndNumber];
        _cellDisPrice.letter.font = WFont(40);
        _cellDisPrice.price.font = WFont(60);
        _cellDisPrice.letter.textColor = LH_RGBCOLOR(250, 101, 20);
        _cellDisPrice.price.textColor = _cellDisPrice.letter.textColor;
        _cellDisPrice.letter.frame = CGRectMake(0, 0, 13, SelfView_height);
        _cellDisPrice.price.frame = CGRectMake(CGRectXW(_cellDisPrice.letter), 0, 45, SelfView_height);
    }
    return _cellDisPrice;
}
-(UILabel *)cellMiPrice{
    if (!_cellMiPrice) {
        _cellMiPrice = [[UILabel alloc] initWithFrame:AdaptationFrame(0, CGRectYH(self.cellDisPrice)/AdaptationWidth(), 164, 50)];
        _cellMiPrice.font = WFont(30);
        _cellMiPrice.textColor = LH_RGBCOLOR(250, 101, 20);
        _cellMiPrice.text = @"满100立减";
        _cellMiPrice.textAlignment = 1;
        
    }
    return _cellMiPrice;
}
-(UILabel *)cellDetail{
    if (!_cellDetail) {
        _cellDetail = [[UILabel alloc] initWithFrame:CGRectMake(CGRectXW(self.cellMiPrice)+24*AdaptationWidth(), 30*AdaptationWidth(), 350*AdaptationWidth(), 43*AdaptationWidth())];
        _cellDetail.font = WFont(30);
        _cellDetail.textAlignment = 0;
        _cellDetail.text = @"打白条购日白全屏类满99送25元";
        
    }
    return _cellDetail;
}
-(UILabel *)cellUserTime{
    if (!_cellUserTime) {
        _cellUserTime = [[UILabel alloc] initWithFrame:CGRectMake(CGRectX(self.cellDetail), CGRectYH(self.cellDetail), 350*AdaptationWidth(), 40*AdaptationWidth())];
        _cellUserTime.text = @"使用时间：1999.6.5-2018.6.5";
        _cellUserTime.textColor = LH_RGBCOLOR(163, 163, 163);
        _cellUserTime.font = WFont(25);
    }
    return _cellUserTime;
}
-(UILabel *)cellGetTick{
    if (!_cellGetTick) {
        _cellGetTick = [[UILabel alloc] initWithFrame:CGRectMake(CGRectX(self.cellDetail), CGRectYH(self.cellUserTime), 350*AdaptationWidth(), 40*AdaptationWidth())];
        _cellGetTick.text = @"已领人数：258人";
        _cellGetTick.textColor = self.cellUserTime.textColor;
        _cellGetTick.font = self.cellUserTime.font;
        
    }
    return _cellGetTick;
}
@end
