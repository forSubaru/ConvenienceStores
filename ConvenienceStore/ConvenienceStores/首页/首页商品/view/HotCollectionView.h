//
//  HotCollectionView.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/8/31.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotCollectionView : UIView<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>
/**collection*/
@property (nonatomic,strong) UICollectionView *collectionView;
/**秒杀图*/
@property (nonatomic,strong) UIButton *hotBtn;
/**更多按钮*/
@property (nonatomic,strong) UIButton *moreBtn;

@end
