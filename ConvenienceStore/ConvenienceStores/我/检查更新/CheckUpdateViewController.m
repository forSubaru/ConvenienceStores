//
//  CheckUpdateViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/19.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "CheckUpdateViewController.h"

@interface CheckUpdateViewController ()
/**图*/
@property (nonatomic,strong) UIView *updateView;

@end

@implementation CheckUpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 74, Screen_width, 40)];
    backView.userInteractionEnabled = YES;
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 100, 40)];
    label.textAlignment = 0;
    label.text = @"检查更新";
    label.font = WFont(30);
    [backView addSubview:label];
    
    UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(Screen_width-115, 0, 100, 40)];
    detailLabel.text = @"当前版本4.2.1";
    detailLabel.textAlignment = 2;
    detailLabel.font = WFont(27);
    detailLabel.textColor = LH_RGBCOLOR(120, 120, 120);
    [backView addSubview:detailLabel];
    
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chechVersion)];
    [backView addGestureRecognizer:tapGes];
    
}
-(void)chechVersion{
    _updateView  = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_updateView];
    UIView *backView = [[UIView alloc] initWithFrame:self.view.bounds];
    backView.backgroundColor = [UIColor blackColor];
    backView.alpha = 0.4;
    [_updateView addSubview:backView];
    
    UIView *alterView = [[UIView alloc] initWithFrame:CGRectMake(25, 180, Screen_width-50, 160)];
    alterView.backgroundColor = [UIColor whiteColor];
    alterView.layer.cornerRadius = 5;
    [_updateView addSubview:alterView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, alterView.bounds.size.width, 50)];
    titleLabel.textAlignment = 1;
    titleLabel.text = @"发现新版本V1.0.3";
    titleLabel.font = WFont(35);
    [alterView addSubview:titleLabel];
    
    NSArray *arr = @[@"1.修复了已知的Bug",@"2.修复了部分机型闪退的问题"];
    for (int idx = 0; idx<arr.count; idx++) {
        UILabel *naiyoLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectYH(titleLabel)+30*idx, 250, 30)];
        naiyoLabel.text = arr[idx];
        naiyoLabel.font = WFont(32);
        naiyoLabel.textAlignment = 0;
        [alterView addSubview:naiyoLabel];
    }
    
    NSArray *btnArr = @[@"取消",@"更新"];
    for (int idx = 0; idx<btnArr.count; idx++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(alterView.bounds.size.width/2*idx, 120, alterView.bounds.size.width/2, 40)];
        [btn setTitle:btnArr[idx] forState:0];
        btn.titleLabel.font = WFont(33);
        [btn setTitleColor:LH_RGBCOLOR(120, 120, 120) forState:0];
        if (idx==1) {
            [btn setTitleColor:[UIColor redColor] forState:0];
        }
        [alterView addSubview:btn];
        
        [btn addTarget:self action:@selector(respondsToBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}
-(void)respondsToBtn:(UIButton *)sender{
    if ([sender.titleLabel.text isEqualToString:@"取消"]) {
        [_updateView removeFromSuperview];
    }else{
        NSLog(@"更新");
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
