//
//  AllParameterView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/7.
//  Copyright © 2016年 王子豪. All rights reserved.
//
static NSString *const kReusableCellIdentifier = @"cellIdentifier";

#import "AllParameterView.h"
#import "AllParameterCell.h"
@interface AllParameterView()
{
    NSArray *_leftArr;
    NSArray *_rightArr;
    
}
@end
@implementation AllParameterView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tableView];
        
        _leftArr = @[@"厂名",@"厂址",@"品牌",@"系列",@"规格",@"净含量",@"配料表"];
        _rightArr = @[@"韩国希杰第一制糖株式会社",@"韩国首尔市",@"好餐的韩国",@"辣椒酱",@"500g",@"500g",@"大米来套麦芽糖辣椒时用眼大米来大米来套麦芽糖辣椒时用眼大米来大米来套麦芽糖辣椒时用眼大米来大米来套麦芽糖辣椒时用眼大米来大米来套麦芽糖辣椒时用眼大米来"];
        
    }
    return self;
}
#pragma mark *** delegate ***
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _leftArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReusableCellIdentifier forIndexPath:indexPath];
//    if (!cell) {
       AllParameterCell * cell = [[AllParameterCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kReusableCellIdentifier];
//    }
    NSString *headStr = _leftArr[indexPath.row];
    cell.cellTitleLabel.text = [NSString stringWithFormat:@"%@:",headStr];
    cell.cellDetailLabel.text = _rightArr[indexPath.row];
    [cell.cellDetailLabel sizeToFit];
    cell.cellDetailLabel.frame = CGRectMake(CGRectXW(cell.cellTitleLabel), 14, 570*AdaptationWidth(), cell.cellDetailLabel.frame.size.height);
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *string = _rightArr[indexPath.row];//1.先获取当前行所对应的字符串
    CGFloat height = [self textHeight:string];// 2.计算字符串的高度
    return height + 20; // 3.返回计算好的高度 加上空白区域的高度
}
-(CGFloat)textHeight:(NSString *)string{
    //传字符串返回高度
    CGRect rect =[string boundingRectWithSize:CGSizeMake(570*AdaptationWidth(), 9999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:WFont(25)} context:nil];//计算字符串所占的矩形区域的大小
    return rect.size.height;//返回高度
}
#pragma mark *** getters ***
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 77*AdaptationWidth();
        [_tableView registerClass:[AllParameterCell class] forCellReuseIdentifier:kReusableCellIdentifier];
        
    }
    return _tableView;
}
@end
