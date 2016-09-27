//
//  SearchView.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/8/30.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SearchView;
@protocol SearchViewDelegate <NSObject>

-(void)SearchView:(SearchView *)searView didSelectedSearchButton:(UIButton *)sender;

@end
@interface SearchView : UIView
@property (nonatomic,weak) id<SearchViewDelegate> delegate; /*代理人*/

@end
