//
//  SeckillHeaderView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/1.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "SeckillHeaderView.h"
@interface SeckillHeaderView()
/**抢购中*/
@property (nonatomic,strong) UILabel *buyingTextLabel;
/**即将开始*/
@property (nonatomic,strong) UILabel *willTextLabel;
/**红线*/
@property (nonatomic,strong) UIView *redLine;

@end
@implementation SeckillHeaderView

- (instancetype)initWithFrame:(CGRect)frame timeArray:(NSArray *)arr
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUIWithArray:arr];
    }
    return self;
}

#pragma mark *** 初始化界面 ***
-(void)initUIWithArray:(NSArray *)timeArr{
    NSArray *arr = @[@"抢购中",@"即将开始"];
    for (int idx = 0; idx<arr.count; idx++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(Screen_width/2*idx, 0, Screen_width/2, 95*AdaptationWidth())];
        if (idx==0) {
            [view addSubview:self.buyingLabel];
            [view addSubview:self.theNewGoods];
            [view addSubview:self.buyingTextLabel];
            

        }else{
            [view addSubview:self.willStartLabel];
            [view addSubview:self.willTextLabel];
        }
        UITapGestureRecognizer *tapViewGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToTapViewGesture:)];
        [view addGestureRecognizer:tapViewGes];
        view.tag = idx;
        [self addSubview:view];
        [self addSubview:self.redLine];
    }
    UILabel *endLabel = [self.willTextLabel deepCopy];
    endLabel.font = WFont(20);
    endLabel.frame = AdaptationFrame(10, 114, 105, 30);
    endLabel.text = @"距本场结束";
    [self addSubview:endLabel];
    //剩余时间
    for (int idx = 0; idx<timeArr.count; idx++) {
        UILabel *timeLabel = [[UILabel alloc] initWithFrame:AdaptationFrame(CGRectXW(endLabel)/AdaptationWidth() + idx*53, 114, 38, 33)];
        timeLabel.backgroundColor = [UIColor blackColor];
        timeLabel.font = WFont(22);
        timeLabel.textAlignment = 1;
        timeLabel.textColor = [UIColor whiteColor];
        timeLabel.layer.cornerRadius = 5;
        timeLabel.text = timeArr[idx];
        [self addSubview:timeLabel];
    }
    
    
}
#pragma mark *** enevts ***
-(void)respondsToTapViewGesture:(UIGestureRecognizer *)gesture{
    NSLog(@"%ld", gesture.view.tag);
    if (gesture.view.tag == 1) {
        [UIView animateWithDuration:0.1f animations:^{
            self.redLine.frame = CGRectMake(Screen_width/2, 93*AdaptationWidth(), Screen_width/2, 2);
        }];
    }else{
        [UIView animateWithDuration:0.1f animations:^{
            self.redLine.frame = CGRectMake(0, 93*AdaptationWidth(), Screen_width/2, 2);
        }];
    }
    
}
#pragma mark *** getters ***
-(UIButton *)theNewGoods{
    if (!_theNewGoods) {
        _theNewGoods = [[UIButton alloc] initWithFrame:AdaptationFrame(196, 2, 104, 41)];
        [_theNewGoods setBackgroundImage:MImage(@"dialog") forState:UIControlStateNormal];
        [_theNewGoods setTitle:@"上新233个" forState:UIControlStateNormal];
        _theNewGoods.userInteractionEnabled = false;
        _theNewGoods.titleLabel.font = WFont(20);
        
    }
    return _theNewGoods;
}
-(UILabel *)buyingLabel{
    if (!_buyingLabel) {
        _buyingLabel = [[UILabel alloc] initWithFrame:AdaptationFrame(111, 36, 84, 33)];
        _buyingLabel.font = WFont(30);
        _buyingLabel.textColor = [UIColor redColor];
        _buyingLabel.text = @"10:00";
    }
    return _buyingLabel;
}
-(UILabel *)buyingTextLabel{
    if (!_buyingTextLabel) {
        _buyingTextLabel = [[UILabel alloc] initWithFrame:AdaptationFrame(CGRectXW(self.buyingLabel)/AdaptationWidth(), CGRectYH(self.theNewGoods)/AdaptationWidth(), 91, 24)];
        _buyingTextLabel.text = @"抢购中";
        _buyingTextLabel.font = WFont(22);
        _buyingTextLabel.textColor = [UIColor redColor];
    }
    return _buyingTextLabel;
}
-(UILabel *)willStartLabel{
    if (!_willStartLabel) {
        _willStartLabel = [self.buyingLabel deepCopy];
        _willStartLabel.textColor = LH_RGBCOLOR(67, 67, 67);
        _willStartLabel.text = @"20:00";
    }
    return _willStartLabel;
}
-(UILabel *)willTextLabel{
    if (!_willTextLabel) {
        _willTextLabel = [self.buyingTextLabel deepCopy];
        _willTextLabel.textColor = LH_RGBCOLOR(171, 171, 171);
        _willTextLabel.text = @"即将开始";
    }
    return _willTextLabel;
}
-(UIView *)redLine{
    if (!_redLine) {
        _redLine = [[UIView alloc] initWithFrame:CGRectMake(0, 93*AdaptationWidth(), Screen_width/2, 2)];
        _redLine.backgroundColor = [UIColor redColor];
    }
    return _redLine;
}
@end
