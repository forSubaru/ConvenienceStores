//
//  SecondPageTopBar.m
//  GongDoo_iphone
//
//  Created by 员延孬 on 16/6/1.
//  Copyright © 2016年 路之遥网络科技有限公司. All rights reserved.
//

#import "SecondPageTopBar.h"
#define indictorH 2.0 //指示条高度
@interface SecondPageTopBar()
@property(nonatomic,weak) UIButton *lastBtn;//记录上一个按钮
@property(nonatomic,weak) UIView* bottomView;//记录底部指示的标示条
@property(nonatomic,assign)CGFloat btnW;//记录按钮的宽度
@property(nonatomic,assign)CGFloat btnH;//记录按钮的高度

@end
@implementation SecondPageTopBar

+(instancetype)tabbar{
    return [[self alloc] init];
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView* bottomView = [[UIView alloc] init];
        bottomView.backgroundColor = LH_RGBCOLOR(250, 221, 123);
        self.bottomView = bottomView;
        [self addSubview:bottomView];
    }
    return self;
}

/**
 使用字符数组初始化
 */

-(instancetype)initWithArray:(NSArray *)array{
    self = [super init];
    if (self) {
        for(NSString* name in array){
            [self AddTarBarBtn:name];
        }
    }
    return self;
}
-(void)removeFromSuperview{
    [super removeFromSuperview];
    
    self.bottomView.frame = CGRectMake(0, self.btnH - indictorH, self.btnW, indictorH);
}

/**
 添加顶部标题项的名字
 */
-(void)AddTarBarBtn:(NSString *)name{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:name forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    btn.titleLabel.font=[UIFont systemFontOfSize:16];
    [btn addTarget:self action:@selector(TabBtnClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:btn];
    [btn setTag:self.subviews.count-2];
    if(2 == self.subviews.count){
        [self TabBtnClick:btn];
    }
    
}
/**
 计算字view的frame
 */
-(void)layoutSubviews{
    NSInteger btnCount = self.subviews.count;
    CGFloat btnW = self.frame.size.width/(btnCount - 1);
    CGFloat btnH = self.frame.size.height;
    self.btnW = btnW;
    self.btnH = btnH;
    for(int i=0;i<btnCount;i++){
        if ([self.subviews[i] isKindOfClass:[UIButton class]]) {
            UIButton *btn = self.subviews[i];
            btn.frame = CGRectMake((i-1)*btnW, 0, btnW, btnH);
        }else{
            UIView* view = self.subviews[i];
            view.frame = CGRectMake(0, btnH - indictorH, btnW,indictorH);
        }
    }
}

/**
 监听tabbar的点击
 */
-(void)TabBtnClick:(UIButton *)sender{
    if(_lastBtn != nil){
        _lastBtn.selected = NO;
    }
    sender.selected = YES;
    _lastBtn = sender;
    //底部指示view的动画
    [UIView animateWithDuration:0.5 animations:^{
        self.bottomView.frame = CGRectMake(sender.tag*self.btnW, self.btnH - indictorH, self.btnW, indictorH);
    }];
    if([_delegate respondsToSelector:@selector(tabBar:didSelectIndex:)]){        [_delegate tabBar:self didSelectIndex:sender.tag];
    }
}

@end
