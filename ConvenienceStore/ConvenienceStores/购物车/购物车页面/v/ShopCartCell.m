//
//  ShopCartCell.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/19.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "ShopCartCell.h"
@interface ShopCartCell()<NumberAddViewDelegate>
/**数字按钮*/
@property (nonatomic,strong) NumberAddView *addBtn;

@end
@implementation ShopCartCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.cellSelecBtn];
        [self.contentView addSubview:self.cellImage];
        [self.contentView addSubview:self.cellName];
        [self.contentView addSubview:self.cellType];
        [self.contentView addSubview:self.cellPrice];
        [self.contentView addSubview:self.addBtn];
        
    }
    return self;
}
#pragma mark *** NumberAddViewDelegate ***
-(void)NumberAddView:(NumberAddView *)addView NumberChanged:(NSString *)number{
    NSLog(@"%@", number);
    if (_delegate && [_delegate respondsToSelector:@selector(ShopCartCell:goodsNumberChange:)]) {
        [_delegate ShopCartCell:self goodsNumberChange:number];
    };
}
#pragma mark *** BTNevent ***
-(void)respondsToselecBtn{
//    self.cellSelecBtn.selected = !self.cellSelecBtn.selected;
    if (_delegate && [_delegate respondsToSelector:@selector(ShopCartCellSelected:)]) {
        [_delegate ShopCartCellSelected:self];
    };
}
#pragma mark *** getters ***
-(UIButton *)cellSelecBtn{
    if (!_cellSelecBtn) {
        _cellSelecBtn = [[UIButton alloc] initWithFrame:AdaptationFrame(5, 55, 55, 55)];
        [_cellSelecBtn setImage:MImage(@"opt") forState:UIControlStateNormal];
        [_cellSelecBtn setImage:MImage(@"success") forState:UIControlStateSelected];
        [_cellSelecBtn addTarget:self action:@selector(respondsToselecBtn) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _cellSelecBtn;
}
-(UIImageView *)cellImage{
    if (!_cellImage) {
        _cellImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectXW(self.cellSelecBtn), 23*AdaptationWidth(), 160*AdaptationWidth(), 140*AdaptationWidth())];
        _cellImage.image = MImage(@"fangbianmian");
    }
    return _cellImage;
}
-(UILabel *)cellName{
    if (!_cellName) {
        _cellName = [[UILabel alloc] initWithFrame:CGRectMake(CGRectXW(self.cellImage), CGRectY(self.cellImage)-2, 200, 44*AdaptationWidth())];
        _cellName.text = @"康帅傅红烧牛肉面";
        _cellName.textColor = LH_RGBCOLOR(68, 68, 68);
        _cellName.textAlignment = 0;
        _cellName.font = WFont(30);
    }
    return _cellName;
}
-(UILabel *)cellType{
    if (!_cellType) {
        _cellType = [[UILabel alloc] initWithFrame:CGRectMake(CGRectX(self.cellName), CGRectYH(self.cellName), 100, 28*AdaptationWidth())];
        _cellType.text = @"105g";
        _cellType.textColor = LH_RGBCOLOR(160, 160, 160);
        _cellType.font = WFont(23);
        _cellType.textAlignment = 0;
    }
    return _cellType;
}
-(RedPriceLabel *)cellPrice{
    if (!_cellPrice) {
        _cellPrice = [[RedPriceLabel alloc] initWithFrame:CGRectMake(CGRectX(self.cellName), CGRectYH(self.cellType)+20*AdaptationWidth(), 100*AdaptationWidth(), 37*AdaptationWidth()) string:@"59.40" priceLabeltype:PriceLabelTypeRedSameLetterAndNumber];
        _cellPrice.letter.font = WFont(25);
        _cellPrice.price.font  = WFont(25);
    }
    return _cellPrice;
}
-(NumberAddView *)addBtn{
    if (!_addBtn) {
        _addBtn = [[NumberAddView alloc] initWithFrame:AdaptationFrame(535, 93, 196, 64)];
        _addBtn.layer.borderWidth = 1;
        _addBtn.layer.borderColor = mainBackGrayColor.CGColor;
        _addBtn.layer.cornerRadius = _addBtn.bounds.size.height/2;
        _addBtn.layer.masksToBounds = YES;
        _addBtn.delegate = self;
    }
    return _addBtn;
}
@end
