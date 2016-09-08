//
//  PhotoDetailView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/7.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "PhotoDetailView.h"
@interface PhotoDetailView()
{
    NSArray *_imageArr;
}
/**back*/
@property (nonatomic,strong) UIScrollView *scrollView;

@end
@implementation PhotoDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageArr = @[@"gundong",@"gundong2",@"gundong3"];
        [self addSubview:self.scrollView];
        [self initAllImage];
    }
    return self;
}
-(void)initAllImage{
    for (int idx = 0; idx<_imageArr.count; idx++) {
        UIImageView *imaV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 481*idx*AdaptationWidth(), Screen_width, 481*AdaptationWidth())];
        imaV.image = MImage(_imageArr[idx]);
        [self.scrollView addSubview:imaV];
    }
}
-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.contentSize = CGSizeMake(Screen_width, _imageArr.count*481*AdaptationWidth());
    }
    return _scrollView;
}
@end
