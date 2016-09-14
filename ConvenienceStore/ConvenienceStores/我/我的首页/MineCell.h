//
//  MineCell.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/14.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineCell : UITableViewCell
/**图片和名字*/
@property (nonatomic,strong) UIButton *cellContent;

/**标题*/
@property (nonatomic,strong) UILabel *cellTiele;
/**箭头*/
@property (nonatomic,strong) UIButton *arrBtn;


@end
