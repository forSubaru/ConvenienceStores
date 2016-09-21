//
//  MyAddressCell.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/20.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyAddressCell;
@protocol MyAddressCellDelegate <NSObject>

-(void)MyAddressCell:(MyAddressCell *)cell didSelectedEditItemIndexRow:(NSInteger)indexRow;

@end
@interface MyAddressCell : UITableViewCell

/**
 *  收货人姓名
 */
@property (strong,nonatomic) UILabel *nameLb;
/**
 *  地址
 */
@property (strong,nonatomic) UILabel *addressLb;
/**
 *  收货人手机
 */
@property (strong,nonatomic) UILabel *mobileLb;

/**
 *  编辑按钮
 */
@property (strong,nonatomic) UIButton *editBtn;

@property (nonatomic,weak) id<MyAddressCellDelegate> delegate; /*代理人*/

@end
