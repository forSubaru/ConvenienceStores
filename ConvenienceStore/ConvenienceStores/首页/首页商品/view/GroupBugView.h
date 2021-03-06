//
//  GroupBugView.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/8/31.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GroupBugView;
@protocol GroupBugViewDelegate <NSObject>

-(void)GroupBuyView:(GroupBugView *)groupView didSeletedItem:(NSString *)itemId;
-(void)GroupBuyViewDidTapMoreButton;

@end
@interface GroupBugView : UIView<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>
/**jihe*/
@property (nonatomic,strong) UICollectionView *collectionView;
/**团购按钮*/
@property (nonatomic,strong) UIButton *hotBtn;
/**更多按钮*/
@property (nonatomic,strong) UIButton *moreBtn;
@property (nonatomic,weak) id<GroupBugViewDelegate> delegate; /*代理人*/

@end
