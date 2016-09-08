//
//  EvaDetailView.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/7.
//  Copyright © 2016年 王子豪. All rights reserved.
//
static NSString *const kReusableCellIdentifier = @"cellIdentifier";

#import "EvaDetailView.h"
#import "EvaDetailCell.h"
#import "StarView.h"
@implementation EvaDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tableView];
    }
    return self;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EvaDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:kReusableCellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[EvaDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kReusableCellIdentifier];
    }
    cell.headIV.backgroundColor = [UIColor redColor];
    cell.nameLb.text = @"subaru";
    cell.timeLb.text = @"20101204";
    cell.descLb.text = @"还行还行还行还行还行还行还行还行还行还行还行还行还行还行还行还行还行还行还行还行还行还行还行还行还行还行还行还行还行还行";
    cell.infoLb.text = @"款式：S 规格：L";
    
    [cell.StarV setStar:2];
    [cell updateFrame];
    return cell;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 250*AdaptationWidth();
        [_tableView registerClass:[EvaDetailCell class] forCellReuseIdentifier:kReusableCellIdentifier];
    }
    return _tableView;
}
@end
