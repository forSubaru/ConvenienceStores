
//
//  MyAddressCell.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/20.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "MyAddressCell.h"
@interface MyAddressCell()
/**
 *  默认勾选
 */
@property (strong,nonatomic) UIImageView *headIV;

@end
@implementation MyAddressCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       [self initView];
        
        if (style==UITableViewCellStyleValue1) {
            //默认地址样式
            self.backgroundColor = [UIColor redColor];
            _headIV= [[UIImageView alloc]initWithFrame:CGRectMake(15, 31, 20, 20)];
            [self addSubview:_headIV];
            _headIV.image = MImage(@"confirm");
            
            self.nameLb.frame = CGRectMake(CGRectXW(_headIV)+5, 10, 100, 20);
            self.nameLb.textColor = [UIColor whiteColor];
            
            self.addressLb.frame = CGRectMake(CGRectXW(_headIV)+5, 35, Screen_width-80, 82-45);
            self.addressLb.textColor = [UIColor whiteColor];
            
            self.mobileLb.frame = CGRectMake(Screen_width-40-170, 10, 170, 20);
            self.mobileLb.textColor = [UIColor whiteColor];
            
            [self.editBtn setImage:MImage(@"xiugai") forState:0];
        }
    }
    return self;
}
-(void)initView{
    UIView *backV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, 82)];
    [self addSubview:backV];
    backV.backgroundColor = [UIColor clearColor];
    self.nameLb = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, 100, 20)];
    [backV addSubview:self.nameLb];
    self.nameLb.font = MFont(13);
    
    
    self.addressLb = [[UILabel alloc]initWithFrame:CGRectMake(15, 35, Screen_width-55, CGRectH(backV)-45)];
    [backV addSubview:self.addressLb];
    self.addressLb.font=MFont(13);
    self.addressLb.numberOfLines = 0;
    
    self.mobileLb = [[UILabel alloc]initWithFrame:CGRectMake(Screen_width-40-170, 10, 170, 20)];
    [backV addSubview:self.mobileLb];
    self.mobileLb.font=MFont(12);
    self.mobileLb.textAlignment = NSTextAlignmentRight;
    self.editBtn = [[UIButton alloc]initWithFrame:CGRectMake(Screen_width-35, 31, 20, 20)];
    [backV addSubview:self.editBtn];
    [self.editBtn setImage:MImage(@"xiuhuo") forState:0];
    [self.editBtn addTarget:self action:@selector(editAction:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)editAction:(UIButton *)sender{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    if (_delegate && [_delegate respondsToSelector:@selector(MyAddressCell:didSelectedEditItemIndexRow:)]) {
        [_delegate MyAddressCell:self didSelectedEditItemIndexRow:sender.tag];
    };
}
@end
