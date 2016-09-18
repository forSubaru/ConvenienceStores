//
//  MyPointTableheadView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/18.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "MyPointTableheadView.h"
#define BtnTag 22
@interface MyPointTableheadView()
/**浮游棒*/
@property (nonatomic,strong) UIView *lineView;

@end
@implementation MyPointTableheadView

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        NSArray *titleArr = @[@"全部",@"支出",@"收入"];
        for (int idx = 0; idx<titleArr.count; idx++) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(idx*(Screen_width/titleArr.count), 0, (Screen_width-20)/3, 60*AdaptationWidth())];
            [btn setTitle:titleArr[idx] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn setTitleColor:mainYellowColor forState:UIControlStateSelected];
            btn.tag = BtnTag+idx;
            [btn addTarget:self action:@selector(respondsToAllBtn:) forControlEvents:UIControlEventTouchUpInside];
            [self.contentView addSubview:btn];
        }
        [self.contentView addSubview:self.lineView];
        
    }
    return self;
}
-(void)respondsToAllBtn:(UIButton *)sender{
    CGFloat Xf = sender.tag-BtnTag;
    self.lineView.frame = CGRectMake(Xf*Screen_width/3, 60*AdaptationWidth()-2, (Screen_width-20)/3, 2);
    if (_delegate && [_delegate respondsToSelector:@selector(MyPointTableheadView:didSelectedButtonTitle:)]) {
        [_delegate MyPointTableheadView:self didSelectedButtonTitle:sender.titleLabel.text];
    };
    for (UIButton *btn in self.contentView.subviews) {
        if (btn.tag<BtnTag) {
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
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 60*AdaptationWidth()-2, (Screen_width-20)/3, 2)];
        _lineView.backgroundColor = mainYellowColor;
    }
    return _lineView;
}
@end
