//
//  JLocation.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/10/25.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "JLocation.h"

@implementation JLocation
//定位
-(void)startLocation{
    // 1.设备是否开启了定位服务
    if (![CLLocationManager locationServicesEnabled])
    {
        //NSLog(@"定位服务不可用，请打开定位功能");
        [SXLoadingView showAlertHUD:@"定位服务不可用，请打开定位功能" duration:0.5];
        return;
    }
    
    // 2.检测本应用的定位服务是否已经开启
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
        //NSLog(@"你已经拒绝了开启定位，还是去设置中打开吧");
        [SXLoadingView showAlertHUD:@"你已经拒绝了开启定位，还是去设置中打开吧" duration:0.5];
        return;
    }
    
    // 3.开始更新位置信息(定位)
    //[self.mgr startUpdatingLocation];
    
    // requestLocation是iOS9之后才有的
    // 特点：只会发一次请求定位的消息
    // 注意：要想使用此方法，必须在代理中添加locationManager:didFailWithError:方法
    // 否则系统崩溃
    
    [self.clLocationManager requestLocation];
    
}
#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    MYLog(@"定位中");
    MYLog(@"%lf,%lf",locations.lastObject.coordinate.latitude,locations.lastObject.coordinate.longitude);
    
//    MKCoordinateRegion region ;//表示范围的结构体
//    region.center = locations.lastObject.coordinate;//中心点
//    region.span.latitudeDelta = 0.5;//经度范围（设置为0.1表示显示范围为0.2的纬度范围）
//    region.span.longitudeDelta = 0.5;//纬度范围
    
    //[self.mapView setCenterCoordinate:locations.lastObject.coordinate];
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    MYLog(@"定位失败");
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
            NSLog(@"用户还没做出决定");
            break;
        case kCLAuthorizationStatusRestricted:
            NSLog(@"访问受限");
            break;
        case kCLAuthorizationStatusDenied:
            NSLog(@"用户选择了不允许");
            break;
        case kCLAuthorizationStatusAuthorizedAlways:
            NSLog(@"开启了Alway模式");
            break;
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            NSLog(@"开启了whenInUse状态");
            break;
        default:
            NSLog(@"default");
            break;
    }
}

- (CLLocationManager *)clLocationManager{
    if (!_clLocationManager) {
        // 1.创建定位管理器
        _clLocationManager = [[CLLocationManager alloc]init];
        
        // 2.设置代理
        _clLocationManager.delegate = self;
        
        // 3.询问用户是否允许开启定位(前台定位)
        //WhenInUse:默认只支持前台定位
        //但：可以通过两步设置，是的whenInUser也能后台定位
        //step1:到target中勾选后台定位选项
        //step2:设置manager的allowsBackground为yes
        //与always进入后台后的区别，在于whenInUse模式会在
        //顶部出现蓝色提示条
        [_clLocationManager requestWhenInUseAuthorization];
        //_clLocationManager.allowsBackgroundLocationUpdates = YES;
        
        //Always:默认支持前后台定位
        //[_clLocationManager requestAlwaysAuthorization];
    }
    return _clLocationManager;
}
@end
