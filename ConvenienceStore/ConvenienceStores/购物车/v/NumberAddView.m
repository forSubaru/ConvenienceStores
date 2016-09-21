//
//  NumberAddView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/19.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "NumberAddView.h"

@implementation NumberAddView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *btnNameArr = @[@"less",@"plus"];
        
        for (int idx = 0; idx<btnNameArr.count; idx++) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(138*AdaptationWidth()*idx, 0, 60*AdaptationWidth(), self.bounds.size.height)];
            [btn setImage:MImage(btnNameArr[idx]) forState:0];
            btn.backgroundColor = LH_RGBCOLOR(242, 242, 242);
            [btn addTarget:self action:@selector(respondsToLessPlusbtn:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = idx;
            [self addSubview:btn];
        }
        
        [self addSubview:self.numberLabel];
    
    }
    return self;
}
-(void)respondsToLessPlusbtn:(UIButton *)sender{
    if (sender.tag == 0) {
        NSInteger num = [self.numberLabel.text integerValue];
        if (num>1) {
            num-=1;
        }
        self.numberLabel.text = [NSString stringWithFormat:@"%ld",num];
    }else{
        NSInteger num = [self.numberLabel.text integerValue];
        num+=1;
        self.numberLabel.text = [NSString stringWithFormat:@"%ld",num];
    }
    if (_delegate && [_delegate respondsToSelector:@selector(NumberAddView:NumberChanged:)]) {
        [_delegate NumberAddView:self NumberChanged:self.numberLabel.text];
    };
    
    
}
-(UILabel *)numberLabel{
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(60*AdaptationWidth(), 0, self.bounds.size.width-120*AdaptationWidth(), self.bounds.size.height)];
        _numberLabel.text = @"1";
        _numberLabel.font = WFont(35);
        _numberLabel.textAlignment = 1;
    }
    return _numberLabel;
}
@end
