//
//  ShopCartFootView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/19.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "ShopCartFootView.h"

@interface ShopCartFootView()
/**全选*/
@property (nonatomic,strong) UIButton *allSelecBtn;

@end
@implementation ShopCartFootView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.allSelecBtn];
        [self addSubview:self.priceLabel];
        [self addSubview:self.buyNumberDis];
        [self initButton];
        
        
    }
    return self;
}

-(void)initButton{
    NSArray *arr = @[@"再选购",@"去结算"];
    for (int idx = 0; idx<arr.count; idx++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(379*AdaptationWidth()+170*AdaptationWidth()*idx, 0, 170*AdaptationWidth(), self.bounds.size.height)];
        [btn setTitle:arr[idx] forState:UIControlStateNormal];
        [btn setTitleColor:mainYellowColor forState:UIControlStateNormal];
        btn.titleLabel.font = WFont(30);
        if (idx==1) {
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.backgroundColor = mainYellowColor;
            btn.frame = CGRectMake(btn.frame.origin.x, btn.frame.origin.y, 210*AdaptationWidth(), btn.bounds.size.height);
            
        }
        [btn addTarget:self action:@selector(respondsToSelecBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
}

-(void)respondsToSelecBtn:(UIButton *)sender{
    if (_delegate && [_delegate respondsToSelector:@selector(ShopCartFootView:didSelectedButton:)]) {
        [_delegate ShopCartFootView:self didSelectedButton:sender];
    };
}
-(UIButton *)allSelecBtn{
    if (!_allSelecBtn) {
        _allSelecBtn = [[UIButton alloc] initWithFrame:AdaptationFrame(15, 25, 105, 40)];
        [_allSelecBtn setImage:MImage(@"opt") forState:UIControlStateNormal];
        [_allSelecBtn setImage:MImage(@"success") forState:UIControlStateSelected];
        [_allSelecBtn setTitle:@"全选" forState:UIControlStateNormal];
        [_allSelecBtn setTitle:@"全选" forState:UIControlStateSelected];
        [_allSelecBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_allSelecBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        _allSelecBtn.titleLabel.font = WFont(30);
        [_allSelecBtn addTarget:self action:@selector(respondsToSelecBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _allSelecBtn;
}
-(RedPriceLabel *)priceLabel{
    if (!_priceLabel) {
        
        UILabel * thelabel = [[UILabel alloc] initWithFrame:AdaptationFrame(160, 17, 71, 38)];
        thelabel.text = @"合计";
        thelabel.font = WFont(30);
        [self addSubview:thelabel];
        
        _priceLabel = [[RedPriceLabel alloc] initWithFrame:CGRectMake(CGRectXW(thelabel), CGRectY(thelabel), 170*AdaptationWidth(), 38*AdaptationWidth()) string:@"999.00" priceLabeltype:PriceLabelTypeRedSameLetterAndNumber];
        _priceLabel.letter.font = WFont(27);
        _priceLabel.price.frame = CGRectMake(_priceLabel.price.frame.origin.x, _priceLabel.price.frame.origin.y, 150, _priceLabel.price.bounds.size.height);
        _priceLabel.price.font = WFont(33);
    }
    return _priceLabel;
}
-(UILabel *)buyNumberDis{
    if (!_buyNumberDis) {
        _buyNumberDis = [[UILabel alloc] initWithFrame:CGRectMake(160*AdaptationWidth(), CGRectYH(self.priceLabel), 200, 34*AdaptationWidth())];
        _buyNumberDis.textAlignment = 0;
        _buyNumberDis.font =  WFont(27);
        _buyNumberDis.textColor = LH_RGBCOLOR(150, 150, 150);
        _buyNumberDis.text = @"再购5元可免运费";
        [UILabel setLabeltextAttributes:_buyNumberDis withColor:[UIColor redColor] range:NSMakeRange(2, 1)];
    }
    return _buyNumberDis;
}
@end
