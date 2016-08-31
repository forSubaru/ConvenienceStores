//
//  SearchView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/8/30.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "SearchView.h"
@interface SearchView()

/**搜索按钮*/
@property (nonatomic,strong) UIButton *searchBtn;
/**语音按钮*/
@property (nonatomic,strong) UIButton *voiceBtn;
/**输入框*/
@property (nonatomic,strong) UITextField *searchTextField;




@end
@implementation SearchView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}
-(void)initUI{
    UIView *backView = [[UIView alloc] initWithFrame:self.bounds];
    backView.backgroundColor = [UIColor whiteColor];
    backView.layer.cornerRadius = self.bounds.size.height/2;
    [self addSubview:backView];
    
    [backView addSubview:self.searchBtn];
    [backView addSubview:self.searchTextField];
    [backView addSubview:self.voiceBtn];
    
    
}

#pragma mark *** getters ***
-(UIButton *)searchBtn{
    if (!_searchBtn) {
        _searchBtn = [[UIButton alloc] initWithFrame:AdaptationFrame(12, 10, 33, 33)];
        [_searchBtn setImage:MImage(@"rej") forState:UIControlStateNormal];
        
    }
    return _searchBtn;
}

-(UITextField *)searchTextField{
    if (!_searchTextField) {
        _searchTextField = [[UITextField alloc] initWithFrame:AdaptationFrame(CGRectXW(self.searchBtn)/AdaptationWidth(), 0, 325, self.bounds.size.height/AdaptationWidth())];
        
    }
    return _searchTextField;
}

-(UIButton *)voiceBtn{
    if (!_voiceBtn) {
        _voiceBtn = [[UIButton alloc] initWithFrame:AdaptationFrame(CGRectXW(self.searchTextField)/AdaptationWidth(), 6, 40, 40)];
        [_voiceBtn setImage:MImage(@"mike") forState:UIControlStateNormal];
    }
    return _voiceBtn;
}
@end
