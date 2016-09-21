//
//  SuggestViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/19.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "SuggestViewController.h"
#define btnTag 50
@interface SuggestViewController ()
{
    NSArray *_suArr;
}
@end

@implementation SuggestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initUI];
}
#pragma mark *** 初始化数据 ***
-(void)initData{
    _suArr = @[@"商品品质",@"软件功能",@"配送服务",@"促销活动",@"退款相关",@"其他问题"];
}
#pragma mark *** 初始化界面 ***
-(void)initUI{
    UIColor  *gColor = LH_RGBCOLOR(103, 103, 103);
    for (int idx = 0; idx<_suArr.count; idx++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:AdaptationFrame(30+240*(idx%3), 175+91*(idx/3), 200, 70)];
        btn.layer.borderColor = gColor.CGColor;
        btn.layer.borderWidth = 1;
        btn.layer.cornerRadius = btn.bounds.size.height/2;
        [btn setTitle:_suArr[idx] forState:0];
        [btn setTitleColor:gColor forState:0];
        btn.titleLabel.font = WFont(30);
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(respondsToSuBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = btnTag+idx;
        [self.view addSubview:btn];
    }
    
    //输入的意见
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 380*AdaptationWidth(), Screen_width-40, 304*AdaptationWidth())];
    textView.font = WFont(27);
    textView.text = @"请输出您的建议或意见";
    [self.view addSubview:textView];
    
    UIButton *commitBtn  = [[UIButton alloc] initWithFrame:CGRectMake(20, CGRectYH(textView)+50, Screen_width-40, 44)];
    [commitBtn setTitle:@"提交" forState:0];
    commitBtn.titleLabel.font = WFont(30);
    commitBtn.backgroundColor = [UIColor redColor];
    commitBtn.layer.cornerRadius = 4;
    [commitBtn addTarget:self action:@selector(respondsToCMTBTn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:commitBtn];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectYH(commitBtn)+5, Screen_width, 60)];
    label.text = @"（意见类型和内容都要写哦！）";
    label.font = WFont(25);
    label.textAlignment = 1;
    label.textColor = LH_RGBCOLOR(103, 103, 103);
    [self.view addSubview:label];
    
}
-(void)respondsToSuBtn:(UIButton *)sender{
    
    sender.selected = !sender.selected;
    if (sender.selected) {
        sender.backgroundColor = mainYellowColor;
        sender.layer.borderColor = mainYellowColor.CGColor;
    }else{
        sender.backgroundColor = [UIColor clearColor];
        sender.layer.borderColor = LH_RGBCOLOR(103, 103, 103).CGColor;
    }
}
-(void)respondsToCMTBTn{
    NSMutableArray *cmitArr = [@[] mutableCopy];
    for (UIButton *btn in self.view.subviews) {
        if (btn.tag>=btnTag) {
            if (btn.selected) {
                [cmitArr addObject:btn.titleLabel.text];
            }
        }
    }
    NSLog(@"%@", cmitArr);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
