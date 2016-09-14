//
//  MineHeaderView.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/13.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MineHeaderView;
@protocol MineHeaderViewDelegate <NSObject>
@optional
-(void)MineHeaderView:(MineHeaderView *)headView didSelectedItem:(NSString *)itemTitle;

@end

@interface MineHeaderView : UIView

/**头像*/
@property (nonatomic,strong) UIButton *headImage;
/**名字*/
@property (nonatomic,strong) UILabel *headName;
/**手机*/
@property (nonatomic,strong) UIButton *phoneNum;
/**修改个人信息*/
@property (nonatomic,strong) UIButton *changePerInfo;

@property (nonatomic,weak) id<MineHeaderViewDelegate> delegate; /*代理人*/


@end
