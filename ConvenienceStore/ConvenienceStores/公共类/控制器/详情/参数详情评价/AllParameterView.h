//
//  AllParameterView.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/7.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllParameterView : UIView<UITableViewDataSource,UITableViewDelegate>
/**tableview*/
@property (nonatomic,strong) UITableView *tableView;

@end
