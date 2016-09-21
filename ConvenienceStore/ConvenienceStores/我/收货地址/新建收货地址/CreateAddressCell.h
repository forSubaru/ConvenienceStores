//
//  CreateAddressCell.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/20.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateAddressCell : UITableViewCell
/** 文本标签*/
@property (nonatomic, strong) UILabel *label;
/** 输入框*/
@property (nonatomic, strong) UITextField *textField;

@property (strong,nonatomic) UIImageView *chooseIV;

@property (strong,nonatomic) UITextView *addressTF;
@end
