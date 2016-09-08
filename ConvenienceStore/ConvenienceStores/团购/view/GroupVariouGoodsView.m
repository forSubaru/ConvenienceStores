//
//  GroupVariouGoodsView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/7.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "GroupVariouGoodsView.h"
#define gWidth Screen_width/3
#define gHeight self.bounds.size.height/3
@implementation GroupVariouGoodsView

- (instancetype)initWithFrame:(CGRect)frame imageArr:(NSArray *)arr
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
        [self initUIWithArray:arr];
    }
    return self;
}
#pragma mark *** 初始化数据 ***
-(void)initData{
    
}
#pragma mark *** 初始化界面 ***
-(void)initUIWithArray:(NSArray *)arr{
    
    for (int idx = 0; idx<arr.count; idx++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        if (idx<2) {
            imageView.frame = CGRectMake(0, idx*gHeight, gWidth*2, gHeight);
        }
        else if (idx>4){
            imageView.frame = CGRectMake((idx-5)*gWidth, gHeight*2, gWidth, gHeight);
        }
        else{
            imageView.frame = CGRectMake(2*gWidth, (idx-2)*gHeight, gWidth, gHeight);
        }
        imageView.image = MImage(arr[idx]);
        imageView.layer.borderWidth = 1;
        imageView.layer.borderColor = LH_RGBCOLOR(233, 233, 233).CGColor;
        [self addSubview:imageView];
    }
}
@end
