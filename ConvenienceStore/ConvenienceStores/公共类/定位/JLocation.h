//
//  JLocation.h
//  ConvenienceStores
//
//  Created by 王子豪 on 16/10/25.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@interface JLocation : NSObject<CLLocationManagerDelegate>
/** 定位管理器 **/
@property (nonatomic, strong)CLLocationManager *clLocationManager;
//定位
-(void)startLocation;
@end
