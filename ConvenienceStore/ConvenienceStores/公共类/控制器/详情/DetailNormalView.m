//
//  DetailNormalView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/5.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "DetailNormalView.h"
@interface DetailNormalView()


@end
@implementation DetailNormalView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.detailName];
        
        self.detailsells = [self createLabelWithFrame:CGRectMake(CGRectX(self.detailName), CGRectYH(self.detailPrice)+2, 75*AdaptationWidth(), 35*AdaptationWidth()) Title:@"月销量" mutableLabelNumber:@"1654" finalWord:@
                            "件"];
        [self addSubview:self.detailsells];
        [self addSubview:self.detailPrice];
        self.detailRemain = [self createLabelWithFrame:CGRectMake(CGRectXW(self.detailsells)+150*AdaptationWidth(), CGRectY(self.detailsells), 55*AdaptationWidth(), 35*AdaptationWidth()) Title:@"库存" mutableLabelNumber:@"75" finalWord:@"件"];
        [self addSubview:self.detailRemain];
        [self addSubview:self.detailPosition];
        [self  addSubview:self.detailPromotion];
        [self addSubview:self.detailProText];
        [self addSubview:self.detailPoint];
        [self addSubview:self.detailPoText];
        
        [self initWithThreeArray:@[@"100%正品",@"极速发货",@"7天无理由退货"]];

    }
    return self;
}

//画底部线
- (void)drawRect:(CGRect)rect {
    
    //1.获取画板（上下文）
    CGContextRef context = UIGraphicsGetCurrentContext();
    //2.设置画笔颜色
    CGContextSetStrokeColorWithColor(context, LH_RGBCOLOR(239, 239, 239).CGColor);
    //3.设置画笔宽度
    CGContextSetLineWidth(context, 1);
    NSArray *arr = @[[NSNumber numberWithFloat:CGRectGetMaxY(self.detailsells.frame)+5],[NSNumber numberWithFloat:CGRectGetMaxY(self.detailsells.frame)+5+100*AdaptationWidth()],[NSNumber numberWithFloat:CGRectGetMaxY(self.detailsells.frame)+5+180*AdaptationWidth()]];
    
    for (int idx = 0; idx<3; idx++) {
        //4.设置起点
        CGContextMoveToPoint(context, CGRectX(self.detailName), [arr[idx] floatValue]);
        //5.设置终点
        CGContextAddLineToPoint(context, Screen_width-10, [arr[idx] floatValue]);
        //6.连线
        CGContextStrokePath(context);
    }

}
-(void)initWithThreeArray:(NSArray *)arr{
    NSArray *imageNames = @[@"zheng",@"shan",@"qi"];
    for (int idx = 0; idx<arr.count; idx++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:AdaptationFrame(45+idx*215, CGRectYH(self.detailPoint)/AdaptationWidth()+41, 195, 55)];
        if (idx==2) {
            btn.frame = AdaptationFrame(45+idx*215, CGRectYH(self.detailPoint)/AdaptationWidth()+41, 230, 55);
        }
        [btn setTitle:arr[idx] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = WFont(25);
        [btn setImage:MImage(imageNames[idx]) forState:UIControlStateNormal];
        btn.userInteractionEnabled = false;
        [self addSubview:btn];
    }
}
#pragma mark *** delegate ***

#pragma mark *** getters ***
-(UILabel *)detailName{
    if (!_detailName) {
        _detailName = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, Screen_width, 75*AdaptationWidth())];
        _detailName.font = WFont(30);
        _detailName.textAlignment = 0;
        _detailName.text = @"韩国希杰第一制糖株式会社辣椒酱";
        
    }
    return _detailName;
}
-(RedPriceLabel *)detailPrice{
    if (!_detailPrice) {
        _detailPrice = [[RedPriceLabel alloc] initWithFrame:CGRectMake(CGRectX(self.detailName), CGRectYH(self.detailName), 255*AdaptationWidth(), 40*AdaptationWidth()) string:@"189.00" priceLabeltype:PriceLabelTypeRedSameLetterAndNumber];
        _detailPrice.price.font = WFont(40);
        _detailPrice.price.frame = CGRectMake(_detailPrice.price.frame.origin.x, _detailPrice.price.frame.origin.y, _detailPrice.price.bounds.size.width*1.5, _detailPrice.price.bounds.size.height);
        _detailPrice.letter.font = WFont(30);
        
    }
    return _detailPrice;
}
-(UILabel *)createLabelWithFrame:(CGRect)frame Title:(NSString *)title mutableLabelNumber:(NSString *)number finalWord:(NSString *)word{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:frame];
    titleLabel.text = title;
    titleLabel.font = WFont(25);
    titleLabel.textColor = LH_RGBCOLOR(159, 159, 159);
    [self addSubview:titleLabel];
    
    CGFloat numberWidth = number.length*15*AdaptationWidth()+30*AdaptationWidth();
    UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectXW(titleLabel), CGRectY(titleLabel), numberWidth, frame.size.height)];
    numberLabel.font = titleLabel.font;
    numberLabel.textColor = titleLabel.textColor;
    numberLabel.text = [NSString stringWithFormat:@"%@%@",number,word];
    
    return numberLabel;
}
-(UILabel *)detailPosition{
    if (!_detailPosition) {
        _detailPosition = [[UILabel alloc] initWithFrame:CGRectMake(Screen_width-40, CGRectY(self.detailsells), 40, 35*AdaptationWidth())];
        _detailPosition.text = @"上海";
        _detailPosition.font = WFont(25);
        _detailPosition.textColor = LH_RGBCOLOR(159, 159, 159);
    }
    return _detailPosition;
}
-(UIButton *)detailPromotion{
    if (!_detailPromotion) {
        _detailPromotion = [[UIButton alloc] initWithFrame:CGRectMake(CGRectX(self.detailName), CGRectYH(self.self.detailsells)+20*AdaptationWidth(), 58*AdaptationWidth(), 33*AdaptationWidth())];
        [_detailPromotion setTitle:@"促销" forState:UIControlStateNormal];
        _detailPromotion.titleLabel.font = WFont(25);
        _detailPromotion.backgroundColor = LH_RGBCOLOR(251, 33, 6);
        _detailPromotion.layer.cornerRadius = 3;
        _detailPromotion.userInteractionEnabled = false;
        
    }
    return _detailPromotion;
}
-(UILabel *)detailProText{
    if (!_detailProText) {
        _detailProText = [[UILabel alloc] initWithFrame:CGRectMake(CGRectXW(self.detailPromotion)+5, CGRectY(self.detailPromotion), 490*AdaptationWidth(), 60*AdaptationWidth())];
        _detailProText.font = WFont(25);
        _detailProText.numberOfLines = 0;
        _detailProText.text = @"前100名5折 抢卷立减 有型有色有味 韩国料理常备 仇无怨红包 买2份立减3元";
        
    }
    return _detailProText;
}
-(UIButton *)detailPoint{
    if (!_detailPoint) {
        _detailPoint = [self.detailPromotion deepCopy];
        _detailPoint.frame = CGRectMake(CGRectX(self.detailName), CGRectYH(self.detailPromotion)+80*AdaptationWidth(), 58*AdaptationWidth(), 33*AdaptationWidth());
        [_detailPoint setTitle:@"积点" forState:UIControlStateNormal];
        _detailPoint.layer.cornerRadius = 3;
    }
    return _detailPoint;
}
-(UILabel *)detailPoText{
    if (!_detailPoText) {
        _detailPoText = [self.detailProText deepCopy];
        _detailPoText.frame = CGRectMake(_detailPoText.frame.origin.x, CGRectY(self.detailPoint), 200, 33*AdaptationWidth());
        _detailPoText.text = @"送94社区O2O积点";
    }
    return _detailPoText;
}

@end
