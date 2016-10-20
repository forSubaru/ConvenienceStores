//
//  OrderRefundViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/10/8.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "OrderRefundViewController.h"
#define BTNTAG 20
@interface OrderRefundViewController ()

@end

@implementation OrderRefundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initUI];
}
#pragma mark *** 初始化数据 ***
-(void)initData{
    
}
#pragma mark *** 初始化界面 ***
-(void)initUI{
    NSArray *titleArr = @[@"退款类型",@"退款原因*",@"退款金额*",@"退款说明",@"上传凭证"];
    CGFloat allPlus = 0;
    for (int idx = 0; idx<titleArr.count; idx++) {
        CGFloat plusHeight = 135;
        
        if (idx==0) {
            plusHeight = 215;
        }
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:AdaptationFrame(30,64/AdaptationWidth()+20+allPlus, 130, 50)];
        titleLabel.text = titleArr[idx];
        titleLabel.font = WFont(28);
        allPlus+=plusHeight;
        [self.view addSubview:titleLabel];
        //设置红点
        if (idx==1||idx==2) {
            [UILabel setLabeltextAttributes:titleLabel withColor:[UIColor redColor] range:NSMakeRange(4, 1)];
        }
        if (idx==0) {
            //背景
            UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(CGRectX(titleLabel)-10*AdaptationWidth(), CGRectYH(titleLabel), 710*AdaptationWidth(), 150*AdaptationWidth())];
            backView.backgroundColor = [UIColor whiteColor];
            backView.layer.borderColor  = LH_RGBCOLOR(200, 200, 200).CGColor;
            backView.layer.borderWidth = 1;
            backView.layer.cornerRadius = 5;
            [self.view addSubview:backView];
            
            NSArray *btnTitle = @[@"我要退款（无需退款）",@"我要退货"];
            
            for (int i = 0; i<btnTitle.count; i++) {
                UIButton *btn = [[UIButton alloc] initWithFrame:AdaptationFrame(0, CGRectYH(titleLabel)/AdaptationWidth()+75*i, Screen_width/AdaptationWidth()-20*AdaptationWidth(), 75)];
                [btn setTitle:btnTitle[i] forState:UIControlStateNormal];
                btn.titleLabel.font = WFont(30);
                [btn setTitleColor:[UIColor blackColor] forState:0];
                [btn setImage:MImage(@"choose") forState:UIControlStateNormal];
                [btn setImage:MImage(@"Bsuccess") forState:UIControlStateSelected];
                btn.titleEdgeInsets = UIEdgeInsetsMake(0, btn.imageView.frame.size.width-btn.frame.size.width+btn.titleLabel.intrinsicContentSize.width-28*AdaptationWidth(), 0, 0);
                btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -btn.titleLabel.frame.size.width-btn.frame.size.width+btn.imageView.frame.size.width+20);
                btn.tag = BTNTAG+i;
                
                [btn addTarget:self action:@selector(respondsToTuikuan:) forControlEvents:UIControlEventTouchUpInside];
                
                [self.view addSubview:btn];
                
            }
        }else if(idx>0&&idx<4){
            NSArray *arr = @[@"请输入退款原因",@"请输入退款金额",@"请输入退款说明",@""];
            NSInteger index = idx-1;
            UITextField *tef = [[UITextField alloc] initWithFrame:CGRectMake(CGRectX(titleLabel)-10*AdaptationWidth(), CGRectYH(titleLabel), 710*AdaptationWidth(), 75*AdaptationWidth())];
            tef.placeholder = arr[index];
            tef.font = WFont(27);
            tef.backgroundColor = [UIColor whiteColor];
            tef.layer.borderWidth = 1;
            tef.layer.borderColor = LH_RGBCOLOR(200, 200, 200).CGColor;
            tef.layer.cornerRadius = 5;
            
            [self.view addSubview:tef];
            
        }else{
            //上传凭证
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectX(titleLabel)-10*AdaptationWidth(), CGRectYH(titleLabel), 715*AdaptationWidth(), 100*AdaptationWidth())];
            [btn setImage:MImage(@"xiangjishangchuan") forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(respondsToShangchuanBTn:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:btn];
        }
        
    }
}
-(void)respondsToShangchuanBTn:(UIButton *)sender{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}
-(void)respondsToTuikuan:(UIButton *)sender{
    for (UIButton *btn in self.view.subviews) {
        if (btn.tag>=BTNTAG) {
            btn.selected = false;
        }
    }
    sender.selected = !sender.selected;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
