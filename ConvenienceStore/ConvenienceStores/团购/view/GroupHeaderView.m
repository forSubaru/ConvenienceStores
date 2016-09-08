//
//  GroupHeaderView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/7.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "GroupHeaderView.h"
#define selftag 15
@interface GroupHeaderView()
/**黄色下划线*/
@property (nonatomic,strong) UIView *lineView;

@end
@implementation GroupHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray <NSString *>*titleArr = @[@"全部",@"纸品湿巾",@"洗护清洁",@"饮料零食",@"粮油调味",@"日用百货"];
        CGFloat gap = 0;
        for (int idx = 0; idx<titleArr.count; idx++) {
            
            CGFloat theWidth = titleArr[idx].length *34;
            UIButton *btn = [[UIButton alloc] initWithFrame:AdaptationFrame(gap, 0, theWidth, 85)];
            [btn setTitle:titleArr[idx] forState:UIControlStateNormal];
            btn.titleLabel.font = WFont(25);
            [btn setTitleColor:LH_RGBCOLOR(40, 40, 40) forState:UIControlStateNormal];
            [btn setTitleColor:LH_RGBCOLOR(243, 191, 8) forState:UIControlStateSelected];
            btn.tag = idx+selftag;
            [btn addTarget:self action:@selector(respondsToTopBtn:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:btn];
            if (idx==0) {
                btn.selected = true;
            }
            gap +=theWidth;
        }
        [self addSubview:self.lineView];
    }
    return self;
}

-(void)respondsToTopBtn:(UIButton *)sender{
    [UIView animateWithDuration:0.3 animations:^{
        self.lineView.frame = CGRectMake(sender.frame.origin.x, 83*AdaptationWidth(), sender.frame.size.width, 2*AdaptationWidth());
    }];
    if (_delegate && [_delegate respondsToSelector:@selector(GroupHeaderView:didSelectedButtonTitle:)]) {
        [_delegate GroupHeaderView:self didSelectedButtonTitle:sender.titleLabel.text];
    };
    
    for (UIButton *btn in self.subviews) {
        if (btn.tag<selftag) {
            return;
        }
        if (sender.tag == btn.tag) {
            btn.selected = true;
        }else{
            btn.selected = false;
        }
    }
    
    
    
}
-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc] initWithFrame:AdaptationFrame(0, 83, 68, 2)];
        _lineView.backgroundColor = mainYellowColor;
        _lineView.userInteractionEnabled = false;
    }
    return _lineView;
}
@end
