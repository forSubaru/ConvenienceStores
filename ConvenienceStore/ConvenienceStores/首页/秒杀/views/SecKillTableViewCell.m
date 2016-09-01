//
//  SecKillTableViewCell.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/1.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "SecKillTableViewCell.h"
@interface SecKillTableViewCell()

/**马上抢*/
@property (nonatomic,strong) UIButton *buyNowBtn;

@end

@implementation SecKillTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = LH_RGBCOLOR(233, 233, 233);
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        UIView *backView = [[UIView alloc] initWithFrame:AdaptationFrame(10, 20, 730, 294)];
        backView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:backView];
        [backView addSubview:self.cellImage];
        [backView addSubview:self.cellInfoLabel];
        [backView addSubview:self.cellCurrPrice];
        [backView addSubview:self.cellMotoPrice];
        [backView addSubview:self.cellBuyLabel];
        [backView addSubview:self.buyNowBtn];
        [backView addSubview:self.cellProgressView];

    }
    return self;
}
-(void)addBarWithPercent:(CGFloat)percent{
    [self.cellProgressView removeAllSubviews];
    UIView *barView = [self.cellProgressView deepCopy];
    barView.frame = CGRectMake(0, 0, percent*128*AdaptationWidth(), 20*AdaptationWidth());
    barView.backgroundColor = LH_RGBCOLOR(253, 229, 107);
    barView.layer.cornerRadius = barView.bounds.size.height/2;
    [self.cellProgressView addSubview:barView];
}
#pragma mark *** events ***
-(void)respondsToBuyNowBtn{
    NSLog(@"马上买");
}
#pragma mark *** getters ***
-(UIImageView *)cellImage{
    if (!_cellImage) {
        _cellImage = [[UIImageView alloc] initWithFrame:AdaptationFrame(0, 0, 345 , 295)];
        _cellImage.image = MImage(@"miaoshatu");
        _cellImage.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _cellImage;
}
-(UILabel *)cellInfoLabel{
    if (!_cellInfoLabel) {
        _cellInfoLabel = [[UILabel alloc] initWithFrame:AdaptationFrame(CGRectXW(self.cellImage)/AdaptationWidth(), 22, 300, 75)];
        _cellInfoLabel.numberOfLines = 2;
        _cellInfoLabel.font = WFont(25);
        _cellInfoLabel.text = @"日式防生侦测 台湾精工品质畅销日本爆款..";
    }
    return _cellInfoLabel;
}
-(RedPriceLabel *)cellCurrPrice{
    if (!_cellCurrPrice) {
        _cellCurrPrice = [[RedPriceLabel alloc] initWithFrame:CGRectMake(CGRectX(self.cellInfoLabel), CGRectYH(self.cellInfoLabel)+10*AdaptationWidth(), 126*AdaptationWidth(), 50*AdaptationWidth()) string:@"389.0" priceLabeltype:PriceLabelTypeRedSameLetterAndNumber];
        
        _cellCurrPrice.letter.font = WFont(32);
        _cellCurrPrice.price.font = WFont(32);
        
    }
    return _cellCurrPrice;
}
-(RedPriceLabel *)cellMotoPrice{
    if (!_cellMotoPrice) {
        _cellMotoPrice = [[RedPriceLabel alloc] initWithFrame:CGRectMake(CGRectXW(self.cellCurrPrice), CGRectYH(self.cellInfoLabel)+16*AdaptationWidth(), 80*AdaptationWidth(), 40*AdaptationWidth()) string:@"89.9" priceLabeltype:PriceLabelTypePriceWithLine];
        _cellMotoPrice.letter.font = WFont(23);
        _cellMotoPrice.price.font = WFont(23);
    }
    return _cellMotoPrice;
}
-(UILabel *)cellBuyLabel{
    if (!_cellBuyLabel) {
        _cellBuyLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectX(self.cellInfoLabel), CGRectYH(self.cellCurrPrice)+10*AdaptationWidth(), 100*AdaptationWidth(), 30*AdaptationWidth())];
        _cellBuyLabel.text = @"已抢840件";
        _cellBuyLabel.font = WFont(20);
        _cellBuyLabel.textColor = LH_RGBCOLOR(151, 151, 151);
    }
    return _cellBuyLabel;
}
-(UIButton *)buyNowBtn{
    if (!_buyNowBtn) {
        _buyNowBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectX(self.cellInfoLabel), CGRectYH(self.cellBuyLabel)+25*AdaptationWidth(), 151*AdaptationWidth(), 46*AdaptationWidth())];
        [_buyNowBtn setTitle:@"马上抢" forState:UIControlStateNormal];
        [_buyNowBtn setTitleColor:LH_RGBCOLOR(101, 59, 10) forState:UIControlStateNormal];
        _buyNowBtn.titleLabel.font = WFont(26);
        _buyNowBtn.layer.cornerRadius = 3;
        _buyNowBtn.backgroundColor = LH_RGBCOLOR(251, 201, 11);
        [_buyNowBtn addTarget:self action:@selector(respondsToBuyNowBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buyNowBtn;
}
-(UIView *)cellProgressView{
    if (!_cellProgressView) {
        _cellProgressView = [[UIView alloc] initWithFrame:CGRectMake(CGRectXW(self.cellBuyLabel)+0*AdaptationWidth(), CGRectY(self.cellBuyLabel)+5*AdaptationWidth(), 128*AdaptationWidth(), 20*AdaptationWidth())];
        _cellProgressView.layer.borderWidth = 2;
        _cellProgressView.layer.borderColor = LH_RGBCOLOR(253, 229, 107).CGColor;
        _cellProgressView.layer.cornerRadius = _cellProgressView.bounds.size.height/2;
    }
    return _cellProgressView;
}
@end
