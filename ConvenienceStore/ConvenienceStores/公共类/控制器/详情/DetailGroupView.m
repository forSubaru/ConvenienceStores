


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

@end
@implementation DetailGroupView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self removeAllSubviews];
        [self addSubview:self.backImageView];
    }
    return self;
}
#pragma mark *** getters ***
-(UIImageView *)backImageView{
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, 107*AdaptationWidth())];
        _backImageView.image = MImage(@"bg");
    }
    return _backImageView;
}
@end
