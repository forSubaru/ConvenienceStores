//
//  BaiduLocation.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/10/26.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "BaiduLocation.h"

@implementation BaiduLocation

-(void)startLocation{
        _locSevice = [[BMKLocationService alloc] init];
        _locSevice.delegate = self;
        [_locSevice startUserLocationService];
}
-(void)stopLocation{
    [_locSevice stopUserLocationService];
}
//实现相关delegate 处理位置信息更新
//处理方向变更信息
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    NSLog(@"heading is %@",userLocation.heading);
}
//处理位置坐标更新
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
}

@end
