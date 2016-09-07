//
//  GoodsSelecView.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/5.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GoodsSelecView;
@protocol GoodsSelecViewDelegate <NSObject>

-(void)GoodsSelecView:(GoodsSelecView *)selecView didSelectedLeftViewTitle:(NSString *)leftTitle;

@end
@interface GoodsSelecView : UIView
/**集合视图*/
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,weak) id<GoodsSelecViewDelegate> delegate; /*代理人*/

@end
