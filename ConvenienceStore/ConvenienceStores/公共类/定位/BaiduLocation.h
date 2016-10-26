//
//  BaiduLocation.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/10/26.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BaiduMapKit/BaiduMapAPI_Location/BMKLocationService.h>
@class BaiduLocation;

@protocol BaiduLocationDelegate <NSObject>
-(void)updateBaiduLocation:(BaiduLocation *)baiduLocation;
@end

@interface BaiduLocation : NSObject<BMKLocationServiceDelegate>
/**定位*/
@property (nonatomic,strong) BMKLocationService *locSevice;

@property (nonatomic,weak) id<BaiduLocationDelegate> delegate; /*代理人*/

//开始定位
-(void)startLocation;
//结束定位
-(void)stopLocation;

@end
