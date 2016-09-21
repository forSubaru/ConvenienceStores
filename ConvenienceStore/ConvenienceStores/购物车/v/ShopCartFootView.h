//
//  ShopCartFootView.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/19.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShopCartFootView;
@protocol ShopCartFootViewDelegate <NSObject>

-(void)ShopCartFootView:(ShopCartFootView *)footView didSelectedButton:(UIButton *)sender;

@end
@interface ShopCartFootView : UIView
/**总价*/
@property (nonatomic,strong) RedPriceLabel *priceLabel;
/**再购多少元*/
@property (nonatomic,strong) UILabel *buyNumberDis;
@property (nonatomic,weak) id<ShopCartFootViewDelegate> delegate; /*代理人*/

@end
