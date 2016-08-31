//
//  HotCollectionReusableView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/8/31.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "HotCollectionReusableView.h"
@interface HotCollectionReusableView()
/**秒杀图*/
@property (nonatomic,strong) UIButton *hotBtn;

@end
@implementation HotCollectionReusableView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.hotBtn];
    }
    return self;
}

-(UIButton *)hotBtn{
    if (!_hotBtn) {
        _hotBtn = [[UIButton alloc] initWithFrame:CGRectMake(2, 0, 120*AdaptationWidth(), self.bounds.size.height)];
        [_hotBtn setImage:MImage(@"spike") forState:UIControlStateNormal];
        [_hotBtn setTitle:@"秒杀" forState:UIControlStateNormal];
    }
    return _hotBtn;
}
@end
