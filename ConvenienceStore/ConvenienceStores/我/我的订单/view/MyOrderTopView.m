//
//  MyOrderTopView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/18.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "MyOrderTopView.h"
#define topTag 44
@implementation MyOrderTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initTopView];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
-(void)initTopView{
    NSArray <NSString *>*_topArray = @[@"全部",@"待付款",@"待收货",@"待评价",@"退款/售后"];
    CGFloat gap = 0;
    for (int idx = 0; idx<_topArray.count; idx++) {
        CGFloat theWidth = _topArray[idx].length * 48;
        UIButton *btn = [[UIButton alloc] initWithFrame:AdaptationFrame(gap, 0, theWidth, 85)];
        [btn setTitle:_topArray[idx] forState:UIControlStateNormal];
        btn.titleLabel.font = WFont(28);
        [btn setTitleColor:LH_RGBCOLOR(40, 40, 40) forState:UIControlStateNormal];
        [btn setTitleColor:LH_RGBCOLOR(243, 191, 8) forState:UIControlStateSelected];
        btn.tag = idx + topTag;
        [btn addTarget:self action:@selector(respondsToTopBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        if (idx==0) {
            btn.selected = true;
        }
        gap +=theWidth;
    }
}
-(void)respondsToTopBtn:(UIButton *)sender{
    if (_delegate && [_delegate respondsToSelector:@selector(MyOrderTopView:didSelectedButtonTitle:)]) {
        [_delegate MyOrderTopView:self didSelectedButtonTitle:sender.titleLabel.text];
    };
    for (UIButton *btn in self.subviews) {
        if (btn.tag<topTag) {
            return;
        }
        if (sender.tag == btn.tag) {
            btn.selected = true;
        }else{
            btn.selected = false;
        }
    }
}
@end
