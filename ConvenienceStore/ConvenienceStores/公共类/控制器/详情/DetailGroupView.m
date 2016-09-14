


//
//  DetailGroupView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/5.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "DetailGroupView.h"
@interface DetailGroupView()
/**背景*/
@property (nonatomic,strong) UIImageView *backImageView;
/**现价*/
@property (nonatomic,strong) RedPriceLabel *curPrice;
/**原价*/
@property (nonatomic,strong) RedPriceLabel *motoPrice;
/**想买*/
@property (nonatomic,strong) UILabel *wantBuyLabel;
/**开抢时间*/
@property (nonatomic,strong) UILabel *starTimeLabel;

@end
@implementation DetailGroupView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
//        @property (nonatomic,strong) UILabel *detailName;
//        /**月销量*/
//        @property (nonatomic,strong) UILabel *detailsells;
//        /**库存*/
//        @property (nonatomic,strong) UILabel *detailRemain;
//        /**价格*/
//        @property (nonatomic,strong) RedPriceLabel *detailPrice;
//        /**地区*/
//        @property (nonatomic,strong) UILabel *detailPosition;
//        /**促销*/
//        @property (nonatomic,strong) UIButton *detailPromotion;
//        /**促销内容*/
//        @property (nonatomic,strong) UILabel *detailProText;
//        /**积点*/
//        @property (nonatomic,strong) UIButton *detailPoint;
//        /**积点内容*/
//        @property (nonatomic,strong) UILabel *detailPoText;
        
        
        
        
        
        [self removeAllSubviews];
        [self addSubview:self.backImageView];
        [self.backImageView addSubview:self.curPrice];
        [self.backImageView addSubview:self.motoPrice];
        [self.backImageView addSubview:self.wantBuyLabel];
        [self.backImageView addSubview:self.starTimeLabel];
        
        [self initNokoTime];
        [self initIntro];
        
        self.detailsells = [self createLabelWithFrame:CGRectMake(CGRectX(self.detailName), CGRectYH(self.backImageView)+ 150*AdaptationWidth(), 75*AdaptationWidth(), 35*AdaptationWidth()) Title:@"月销量" mutableLabelNumber:@"1654" finalWord:@
                            "件"];
        self.detailRemain = [self createLabelWithFrame:CGRectMake(CGRectXW(self.detailsells)+150*AdaptationWidth(), CGRectY(self.detailsells), 55*AdaptationWidth(), 35*AdaptationWidth()) Title:@"库存" mutableLabelNumber:@"75" finalWord:@"件"];
        [self addSubview:self.detailsells];
        [self addSubview:self.detailRemain];
        self.detailPosition.frame = CGRectMake(Screen_width-40, CGRectY(self.detailsells), 40, 35*AdaptationWidth());
        [self addSubview:self.detailPosition];
        
         [self initWithThreeArray:@[@"100%正品",@"极速发货",@"7天无理由退货"]];
    }
    return self;
}

-(void)initNokoTime{
    NSArray *timeArr = @[@"00",@"41",@"55",@"22"];
    //剩余时间
    for (int idx = 0; idx<timeArr.count; idx++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectX(self.starTimeLabel)+
                                                                   38*idx*AdaptationWidth(),
                                                                   CGRectYH(self.starTimeLabel),
                                                                   30*AdaptationWidth(),
                                                                   30*AdaptationWidth())];
        label.text = timeArr[idx];
        label.font = WFont(18);
        label.textAlignment = 1;
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor blackColor];
        
        UILabel *Mlabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectXW(label), CGRectY(label), 8*AdaptationWidth(), 30*AdaptationWidth())];
        Mlabel.text = @":";
        Mlabel.font = WFont(18);
        
        [self.backImageView addSubview:label];
        
        if (idx==3) {
            return;
        }
        [self.backImageView addSubview:Mlabel];
        
    }
    
}
-(void)initIntro{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(25*AdaptationWidth(), CGRectYH(self.backImageView)+ 25*AdaptationWidth(), 550*AdaptationWidth(), 100*AdaptationWidth())];
    label.text = @"前100名5折 抢卷立减 有型有色有味 韩国料理常备 抽五元红包 买两份立减三元";
    label.font = WFont(30);
    label.numberOfLines = 0;
    [self addSubview:label];
}
//画底部线
- (void)drawRect:(CGRect)rect {
    
    //1.获取画板（上下文）
    CGContextRef context = UIGraphicsGetCurrentContext();
    //2.设置画笔颜色
    CGContextSetStrokeColorWithColor(context, LH_RGBCOLOR(239, 239, 239).CGColor);
    //3.设置画笔宽度
    CGContextSetLineWidth(context, 1);
    
    
    //4.设置起点
    CGContextMoveToPoint(context, CGRectX(self.detailName), CGRectYH(self.backImageView)+ 210*AdaptationWidth());
    //5.设置终点
    CGContextAddLineToPoint(context, Screen_width-10, CGRectYH(self.backImageView)+ 210*AdaptationWidth());
    //6.连线
    CGContextStrokePath(context);
    
    
}
#pragma mark *** getters ***
-(UIImageView *)backImageView{
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, 130*AdaptationWidth())];
        _backImageView.image = MImage(@"bg");
    }
    return _backImageView;
}
-(RedPriceLabel *)curPrice{
    if (!_curPrice) {
        _curPrice = [[RedPriceLabel alloc] initWithFrame:CGRectMake(15, 0, 180*AdaptationWidth(), self.backImageView.bounds.size.height) string:@"19.86" priceLabeltype:PriceLabelTypeBlackSmallLetterAndNumber];
        _curPrice.frame = CGRectMake(15, 0,  _curPrice.price.text.length*40*AdaptationWidth()+20*AdaptationWidth(), self.backImageView.bounds.size.height);
        _curPrice.letter.frame = CGRectMake(0, 5, 12, self.backImageView.bounds.size.height);
        _curPrice.price.frame = CGRectMake(CGRectXW(_curPrice.letter), 0,  _curPrice.price.text.length*50*AdaptationWidth(), self.backImageView.bounds.size.height);
        _curPrice.letter.font = WFont(40);
        _curPrice.price.font = WFont(80);
        _curPrice.letter.textColor = [UIColor whiteColor];
        _curPrice.price.textColor = [UIColor whiteColor];
    }
    return _curPrice;
}
-(RedPriceLabel *)motoPrice{
    if (!_motoPrice) {
        _motoPrice = [[RedPriceLabel alloc] initWithFrame:CGRectMake(CGRectXW(self.curPrice)+5, 25*AdaptationWidth(), 100*AdaptationWidth(), 30*AdaptationWidth()) string:@"26.50" priceLabeltype:PriceLabelTypePriceWithLine];
        _motoPrice.frame = CGRectMake(_motoPrice.frame.origin.x, _motoPrice.frame.origin.y, (_motoPrice.price.text.length*14+15)*AdaptationWidth(), 30*AdaptationWidth());
        _motoPrice.lineView.frame = CGRectMake(0, _motoPrice.bounds.size.height/2+1, (_motoPrice.price.text.length*14+15)*AdaptationWidth(), 1);
        _motoPrice.letter.textColor = LH_RGBCOLOR(180, 230, 205);
        _motoPrice.price.textColor = _motoPrice.letter.textColor;
        _motoPrice.lineView.backgroundColor = _motoPrice.letter.textColor;
        
    }
    return _motoPrice;
}
-(UILabel *)wantBuyLabel{
    if (!_wantBuyLabel) {
        _wantBuyLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectX(self.motoPrice), CGRectYH(self.motoPrice), 154*AdaptationWidth(), 40*AdaptationWidth())];
        _wantBuyLabel.backgroundColor = LH_RGBCOLOR(30, 127, 40);
        _wantBuyLabel.textColor = [UIColor whiteColor];
        _wantBuyLabel.text = @"1182人想买";
        _wantBuyLabel.font = WFont(25);
        _wantBuyLabel.textAlignment = 1;
        _wantBuyLabel.layer.cornerRadius = 8;
    }
    return _wantBuyLabel;
}
-(UILabel *)starTimeLabel{
    if (!_starTimeLabel) {
        _starTimeLabel = [[UILabel alloc] initWithFrame:AdaptationFrame(565, 30, 200, 32)];
        _starTimeLabel.text = @"今天10:00开抢";
        _starTimeLabel.font = WFont(23);
        _starTimeLabel.textColor = [UIColor redColor];
        
    }
    return _starTimeLabel;
}
@end
