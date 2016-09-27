//
//  SelectSendTimeView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/24.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "SelectSendTimeView.h"
@interface SelectSendTimeView()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSArray *_dataSource;
    NSString *_selectString;
}
/**pick*/
@property (nonatomic,strong) UIPickerView *pickView;

@end
@implementation SelectSendTimeView



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
        [self initUI];
        
    }
    return self;
}
#pragma mark *** 初始化数据 ***
-(void)initData{
    NSMutableArray *dateArr = [@[] mutableCopy];
    //开多少小时的店
    NSInteger times = 24;
    
    for (int idx = 0; idx<times*4; idx++) {
        NSDate *startDate = [NSDate dateWithTimeIntervalSince1970:-3600*8+(15*60*idx)];
        
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"HH:mm:ss"];
        NSLog(@"%@", [format stringFromDate:startDate]);
        
        [dateArr addObject:[format stringFromDate:startDate]];
    }
    _dataSource = dateArr;
    _selectString = _dataSource[0];
    
}

#pragma mark *** 初始化界面 ***
-(void)initUI{
    UIView *backView = [[UIView alloc] initWithFrame:self.bounds];
    backView.backgroundColor = [UIColor blackColor];
    backView.alpha = 0.4;
    [self addSubview:backView];
    
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(30, self.center.y-100, Screen_width-60, 210)];
    whiteView.backgroundColor = [UIColor whiteColor];
    whiteView.layer.cornerRadius = 5;
    [self addSubview:whiteView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, whiteView.bounds.size.width, 30)];
    titleLabel.font = WFont(35);
    titleLabel.text = @"选择送货时间";
    titleLabel.textAlignment = 1;
    [whiteView addSubview:titleLabel];
    
    UIPickerView *pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0,CGRectYH(titleLabel), Screen_width-60, 140)];
    pickView.delegate = self;
    self.pickView = pickView;
    [whiteView addSubview:pickView];
    NSArray *titles = @[@"确定",@"取消"];
    for (int idx = 0; idx<2; idx++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(whiteView.bounds.size.width-150+idx*75, CGRectYH(pickView), 75, 30)];
        [btn setTitle:titles[idx] forState:0];
        [btn setTitleColor:mainYellowColor forState:0];
        btn.titleLabel.font = WFont(30);
        [btn addTarget:self action:@selector(responseToSureBtn:) forControlEvents:UIControlEventTouchUpInside];
        [whiteView addSubview:btn];
    }
}

-(void)responseToSureBtn:(UIButton *)sender{
    
    if ([sender.titleLabel.text isEqualToString:@"确定"]) {
        
        if (_delegate && [_delegate respondsToSelector:@selector(senderTimeString:)]) {
            [_delegate senderTimeString:_selectString];
        };
    }
    
    [self removeFromSuperview];
}
#pragma mark *** pickDelegate ***
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _dataSource.count;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return _dataSource[row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _selectString = _dataSource[row];
}
-(void)respondsToSelcBTn:(UIButton *)sender{
   
    
}
@end
