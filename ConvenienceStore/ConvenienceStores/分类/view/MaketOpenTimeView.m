//
//  MaketOpenTimeView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/5.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "MaketOpenTimeView.h"
@interface MaketOpenTimeView()
/**tu*/
@property (nonatomic,strong) UIImageView *clockTime;
/**营业时间*/
@property (nonatomic,strong) UIButton *openTimeText;


@end
@implementation MaketOpenTimeView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = LH_RGBCOLOR(241, 242, 247);
        [self addSubview:self.clockTime];
        [self addSubview:self.openTimeText];
        [self addSubview:self.timeLabel];
    }
    return self;
}
#pragma mark *** getters ***
-(UIImageView *)clockTime{
    if (!_clockTime) {
        _clockTime = [[UIImageView alloc] initWithFrame:AdaptationFrame(15, 10, 30, 30)];
        _clockTime.image = MImage(@"time");
    }
    return _clockTime;
}
-(UIButton *)openTimeText{
    if (!_openTimeText) {
        _openTimeText = [[UIButton alloc] initWithFrame:AdaptationFrame(CGRectXW(self.clockTime)/AdaptationWidth(), 0, 165, 50)];
        [_openTimeText setTitle:@"超市营业时间:" forState:UIControlStateNormal];
        [_openTimeText setTitleColor:LH_RGBCOLOR(135, 135, 135) forState:UIControlStateNormal];
        _openTimeText.titleLabel.font = WFont(25);
    }
    return _openTimeText;
}
-(UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectXW(self.openTimeText), 0, Screen_width/2, 50*AdaptationWidth())];
        _timeLabel.text = @"08:00-22:00";
        _timeLabel.font = WFont(25);
        _timeLabel.textColor = LH_RGBCOLOR(135, 135, 135);
    }
    return _timeLabel;
}
@end
