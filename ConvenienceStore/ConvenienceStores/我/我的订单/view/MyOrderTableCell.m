//
//  MyOrderTableCell.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/18.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "MyOrderTableCell.h"
@interface MyOrderTableCell()
/**背景*/
@property (nonatomic,strong) UIView *backView;

/**取消订单*/
@property (nonatomic,strong) UIButton *cancelBtn;
/**立即付款*/
@property (nonatomic,strong) UIButton *payNowBtn;
/**删除订单*/
@property (nonatomic,strong) UIButton *deleteBtn;
/**评价*/
@property (nonatomic,strong) UIButton *evaBtn;
/**催单*/
@property (nonatomic,strong) UIButton *urgeBtn;
/**申请退款*/
@property (nonatomic,strong) UIButton *refundBtn;
/**确认收货*/
@property (nonatomic,strong) UIButton *sureBtn;







@end
@implementation MyOrderTableCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       [self.contentView addSubview:self.backView];
    }
    return self;
}
-(void)initWithDataModel:(NSArray *)modelArr{
    //先remove不然重用出问题
    [self.backView removeAllSubviews];
    [self.backView addSubview:self.cellOrderNum];
    [self.backView addSubview:self.cellState];
    [self.backView addSubview:self.cellTime];
    [self.backView addSubview:self.cellAllNumber];
    [self.backView addSubview:self.cellPriceLabel];
    
    for (int idx = 0; idx<modelArr.count; idx++) {
        CGFloat YValue = idx*190;
        //图片
        UIImageView *image = [[UIImageView alloc] initWithFrame:AdaptationFrame(25, 90+YValue, 136, 136)];
        image.image = MImage(@"fangbianmian");
        [self.backView addSubview:image];
        //详情
        UILabel *label = [[UILabel alloc] initWithFrame:AdaptationFrame(CGRectXW(image)/AdaptationWidth()+15, CGRectY(image)/AdaptationWidth(), 403, 66)];
        label.font  = WFont(25);
        label.numberOfLines = 2;
        label.text = @"三件装华王庙耳熟L44？骗装拉拉裤学不哭散包装";
        [self.backView addSubview:label];
        //现价
        UILabel *curlabel = [[UILabel alloc] initWithFrame:AdaptationFrame(650, 90+YValue, 86, 30)];
        curlabel.text = @"¥798";
        curlabel.font = WFont(28);
        [self.backView addSubview:curlabel];
        //原价
        UILabel *motolabel = [[UILabel alloc] initWithFrame:AdaptationFrame(665, CGRectYH(curlabel)/AdaptationWidth(), 86, 30)];
        motolabel.text = @"898";
        motolabel.font = WFont(28);
        [UILabel setLabeltextWithLine:motolabel];
        [self.backView addSubview:motolabel];
        //个数
    }
    //更新frame
    self.backView.frame = AdaptationFrame(0, 0, Screen_width/AdaptationWidth(), 220+190*modelArr.count);
    self.cellTime.frame = CGRectMake(5, (250+190*(modelArr.count-1)) *AdaptationWidth(), 260*AdaptationWidth(), 65*AdaptationWidth());
    self.cellAllNumber.frame = AdaptationFrame(400, CGRectY(self.cellTime)/AdaptationWidth(), 212, 65);
    self.cellPriceLabel.frame = AdaptationFrame(CGRectXW(self.cellAllNumber)/AdaptationWidth(), CGRectY(self.cellAllNumber)/AdaptationWidth(), 125, 65);
#warning 这里没重用，重用的话因为self.backView的frame改变，一下btn的frame因为只初始化一次所以在重用的时候不会更新frame。先不重用
    //加载各状态不同按钮
    NSString *state = modelArr[0];
    if ([state isEqualToString:@"1"]) {
        [self.backView addSubview:self.cancelBtn];
        [self.backView addSubview:self.payNowBtn];
    }else if ([state isEqualToString:@"2"]){
        [self.backView addSubview:self.deleteBtn];
    }else if ([state isEqualToString:@"3"]){
        [self.backView addSubview:self.evaBtn];
    }else  if ([state isEqualToString:@"4"]){
        [self.backView addSubview:self.refundBtn];
        [self.backView addSubview:self.sureBtn];
        [self.backView addSubview:self.urgeBtn];
    }
}
#pragma mark *** BTNEvents***
-(void)respondsToCellAllButton:(UIButton *)sender{
    if (_delegate && [_delegate respondsToSelector:@selector(MyOrderTableCell:didTapButtonWithTitle:)]) {
        [_delegate MyOrderTableCell:self didTapButtonWithTitle:sender.titleLabel.text];
    };
}
#pragma mark *** getters ***
-(UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:AdaptationFrame(0, 0, Screen_width/AdaptationWidth(), 416)];
        _backView.backgroundColor = [UIColor whiteColor] ;
    }
    return _backView;
}
-(UILabel *)cellOrderNum{
    if (!_cellOrderNum) {
        _cellOrderNum = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 265*AdaptationWidth(), 50*AdaptationWidth())];
        _cellOrderNum.font = WFont(25);
        _cellOrderNum.text = @"订单号:sh23124";
    }
    return _cellOrderNum;
}
-(UILabel *)cellState{
    if (!_cellState) {
        _cellState = [[UILabel alloc] initWithFrame:CGRectMake(Screen_width-144*AdaptationWidth(), 0, 144*AdaptationWidth(), 50*AdaptationWidth())];
        _cellState.font = self.cellOrderNum.font;
        _cellState.text = @"卖家已发货";
    }
    return _cellState;
}
-(UILabel *)cellTime{
    if (!_cellTime) {
        _cellTime = [[UILabel alloc] initWithFrame:CGRectMake(0, 250*AdaptationWidth(), 260*AdaptationWidth(), 65*AdaptationWidth())];
        _cellTime.font = self.cellOrderNum.font;
        _cellTime.text = @"2016-05-06    09:54";
    }
    return _cellTime;
}
-(UILabel *)cellAllNumber{
    if (!_cellAllNumber) {
        _cellAllNumber = [[UILabel alloc] initWithFrame:AdaptationFrame(400, CGRectY(self.cellTime)/AdaptationWidth(), 212, 65)];
        _cellAllNumber.font = self.cellOrderNum.font;
        _cellAllNumber.text = @"共1件  应付总额：";
    }
    return _cellAllNumber;
}
-(RedPriceLabel *)cellPriceLabel{
    if (!_cellPriceLabel) {
        _cellPriceLabel = [[RedPriceLabel alloc] initWithFrame:AdaptationFrame(CGRectXW(self.cellAllNumber)/AdaptationWidth(), CGRectY(self.cellAllNumber)/AdaptationWidth(), 125, 65) string:@"898.00" priceLabeltype:PriceLabelTypeRedSameLetterAndNumber];
        _cellPriceLabel.letter.font = WFont(24);
        _cellPriceLabel.price.font = WFont(29);
        _cellPriceLabel.price.frame =CGRectMake(_cellPriceLabel.price.frame.origin.x, _cellPriceLabel.price.frame.origin.y, _cellPriceLabel.price.bounds.size.width+10, _cellPriceLabel.price.bounds.size.height);
        _cellPriceLabel.letter.textColor =  LH_RGBCOLOR(252, 110, 74);
        _cellPriceLabel.price.textColor = LH_RGBCOLOR(252, 110, 74);

    }
    return _cellPriceLabel;
}
-(UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = [[UIButton alloc] initWithFrame:AdaptationFrame(391, self.backView.bounds.size.height/AdaptationWidth()-70, 162, 56)];
        [_cancelBtn setTitle:@"取消订单" forState:0];
        _cancelBtn.titleLabel.font = WFont(25);
        [_cancelBtn setTitleColor:LH_RGBCOLOR(150, 150, 150) forState:0];
        _cancelBtn.layer.cornerRadius=3;
        _cancelBtn.layer.borderColor = LH_RGBCOLOR(160, 160, 160).CGColor;
        _cancelBtn.layer.borderWidth = 1;
        [_cancelBtn addTarget:self action:@selector(respondsToCellAllButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}
-(UIButton *)payNowBtn{
    if (!_payNowBtn) {
        _payNowBtn = [self.cancelBtn deepCopy];
        _payNowBtn.frame = CGRectMake(CGRectXW(self.cancelBtn)+7, _payNowBtn.frame.origin.y, _payNowBtn.bounds.size.width, _payNowBtn.bounds.size.height);
        [_payNowBtn setTitle:@"立即付款" forState:0];
        [_payNowBtn setTitleColor:[UIColor blackColor] forState:0];
        _payNowBtn.layer.cornerRadius=3;
        _payNowBtn.layer.borderWidth = 0;
        _payNowBtn.backgroundColor = mainYellowColor;
        [_payNowBtn addTarget:self action:@selector(respondsToCellAllButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _payNowBtn;
}
-(UIButton *)deleteBtn{
    if (!_deleteBtn) {
        _deleteBtn = [self.cancelBtn deepCopy];
        _deleteBtn.frame = self.payNowBtn.frame;
        [_deleteBtn setTitle:@"删除订单" forState:0];
        _deleteBtn.layer.cornerRadius=3;
        _deleteBtn.layer.borderColor = LH_RGBCOLOR(160, 160, 160).CGColor;
        _deleteBtn.layer.borderWidth = 1;
        [_deleteBtn addTarget:self action:@selector(respondsToCellAllButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteBtn;
}
-(UIButton *)evaBtn{
    if (!_evaBtn) {
        _evaBtn = [[UIButton alloc ] initWithFrame:AdaptationFrame(624, self.backView.bounds.size.height/AdaptationWidth()-70, 108, 56)];
        
        [_evaBtn setTitle:@"评价" forState:0];
        _evaBtn.titleLabel.font = WFont(25);
        [_evaBtn setTitleColor:[UIColor blackColor] forState:0];
        _evaBtn.layer.borderWidth = 0;
        _evaBtn.backgroundColor = mainYellowColor;
        [_evaBtn addTarget:self action:@selector(respondsToCellAllButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _evaBtn;
}
-(UIButton *)refundBtn{
    if (!_refundBtn) {
        _refundBtn = [self.cancelBtn deepCopy];
        [_refundBtn setTitle:@"申请退款" forState:0];
        _refundBtn.layer.cornerRadius = 3;
        _refundBtn.layer.borderColor = LH_RGBCOLOR(160, 160, 160).CGColor;
        _refundBtn.layer.borderWidth = 1;
        [_refundBtn addTarget:self action:@selector(respondsToCellAllButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _refundBtn;
}
-(UIButton *)sureBtn{
    if (!_sureBtn) {
        _sureBtn = [self.payNowBtn deepCopy];
        [_sureBtn setTitle:@"确认收货" forState:0];
        _sureBtn.layer.cornerRadius =3;
        _sureBtn.titleLabel.font  = WFont(25);
        [_sureBtn addTarget:self action:@selector(respondsToCellAllButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
}
-(UIButton *)urgeBtn{
    if (!_urgeBtn) {
        _urgeBtn = [self.refundBtn deepCopy];
        [_urgeBtn setTitle:@"催单" forState:0];
        _urgeBtn.frame = CGRectMake(243*AdaptationWidth(), _urgeBtn.frame.origin.y, 131*AdaptationWidth(), 56*AdaptationWidth());
        _urgeBtn.titleLabel.font = WFont(25);
        _urgeBtn.layer.cornerRadius =3;
        _urgeBtn.layer.borderWidth = 1;
        _urgeBtn.layer.borderColor = LH_RGBCOLOR(160, 160, 160).CGColor;
        [_urgeBtn addTarget:self action:@selector(respondsToCellAllButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _urgeBtn ;
}
@end
