//
//  MyPointHeadView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/14.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "MyPointHeadView.h"
@interface MyPointHeadView()
/**积点帮助*/
@property (nonatomic,strong) UIButton *helpBtn;

@end
@implementation MyPointHeadView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.pointNum];
        [self addSubview:self.helpBtn];
        [self addSubview:self.timeBtn];
    }
    return self;
}


-(void)respondsToTwoButton:(UIButton *)sender{
    if (sender.tag == 0) {
        NSLog(@"积点");
    }else{
       NSLog(@"箭头");
    }
}
#pragma mark *** getters ***
-(UILabel *)pointNum{
    if (!_pointNum) {
        
        UIButton *viewBtn = [[UIButton alloc]initWithFrame:AdaptationFrame(9, 36, 44, 48)];
        [viewBtn setImage:MImage(@"jinbi") forState:0];
        [self addSubview:viewBtn];
        
        _pointNum = [[UILabel alloc] initWithFrame:AdaptationFrame(53, CGRectY(viewBtn)/AdaptationWidth(), 115, 48)];
        _pointNum.text = @"0积点";
        _pointNum.font = WFont(35);
        
        [UILabel setLabeltextAttributes:_pointNum withColor:[UIColor redColor] range:NSMakeRange(0, 1)];
    }
    return _pointNum;
}
-(UIButton *)helpBtn{
    if (!_helpBtn) {
        _helpBtn = [[UIButton alloc] initWithFrame:AdaptationFrame(Screen_width/AdaptationWidth()-155, CGRectY(self.pointNum)/AdaptationWidth(), 155, 48)];
        [_helpBtn setImage:MImage(@"gantan") forState:0];
        [_helpBtn setTitle:@"积点帮助" forState:0];
        [_helpBtn setTitleColor:[UIColor blackColor] forState:0];
        _helpBtn.tag = 0;
        [_helpBtn addTarget:self action:@selector(respondsToTwoButton:) forControlEvents:UIControlEventTouchUpInside];
        _helpBtn.titleLabel.font = WFont(30);
    }
    return _helpBtn;
}
-(UIButton *)timeBtn{
    if (!_timeBtn) {
        _timeBtn = [[UIButton alloc] initWithFrame:CGRectMake(9*AdaptationWidth(), CGRectYH(self.pointNum)+50*AdaptationWidth(), 192*AdaptationWidth(), 40*AdaptationWidth())];
        [_timeBtn setTitleColor:LH_RGBCOLOR(73, 18, 1) forState:0];
        _timeBtn.titleLabel.font = WFont(30);
        [_timeBtn setImage:MImage(@"rqi") forState:0];
        [_timeBtn setTitle:@"2016年8月" forState:0];
        
        //下箭头按钮
        UIButton *sitaBtn = [[UIButton alloc] initWithFrame:CGRectMake(Screen_width-44, CGRectY(self.timeBtn)-13, 44, 44)];
        [sitaBtn setImage:MImage(@"xjiantou") forState:0];
        sitaBtn.tag = 1;
        [sitaBtn addTarget:self action:@selector(respondsToTwoButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:sitaBtn];
    }
    return _timeBtn;
}
@end
