//
//  ScanViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/10/21.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "ScanViewController.h"
#import "QRView.h"
#import <AVFoundation/AVFoundation.h>

@interface ScanViewController ()<AVCaptureMetadataOutputObjectsDelegate>
{
    AVCaptureSession *session;
}
/**返回键*/
@property (nonatomic,strong) UIButton *backBtn;
/**扫一扫的界面*/
@property (nonatomic,strong) QRView *qrView;

@end

@implementation ScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
    [self initUI];
    [self setCaptureSession];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = true;

}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = false;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
//UI画面
-(void)initUI{
    //返回按钮
    
    [self.view addSubview:self.qrView];
    [self.view addSubview:self.backBtn];
    
    //文字描述label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.center.y+250*AdaptationWidth(), Screen_width, 20)];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = 1;
    label.text = @"将二维码/条形码放入方框内即可自动扫描";
    label.font  =WFont(30);
    [self.view addSubview:label];
}
//初始化captrueSession
-(void)setCaptureSession{
    // Do any additional setup after loading the view, typically from a nib.
    //获取摄像设备
    AVCaptureDevice * device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //创建输入流
    AVCaptureDeviceInput * input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    //创建输出流
    AVCaptureMetadataOutput * output = [[AVCaptureMetadataOutput alloc]init];
    //设置代理 在主线程里刷新
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    //初始化链接对象
    session = [[AVCaptureSession alloc]init];
    //高质量采集率
    [session setSessionPreset:AVCaptureSessionPresetHigh];
    [session addInput:input];
    [session addOutput:output];
    //设置扫码支持的编码格式(如下设置条形码和二维码兼容)
    output.metadataObjectTypes=@[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
    
    AVCaptureVideoPreviewLayer * layer = [AVCaptureVideoPreviewLayer layerWithSession:session];
    layer.videoGravity=AVLayerVideoGravityResizeAspectFill;
    layer.frame=self.view.layer.bounds;
    [self.view.layer insertSublayer:layer atIndex:0];
    
    //开始捕获
    [session startRunning];
}
-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if (metadataObjects.count>0) {
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex : 0 ];
        //输出扫描字符串
        NSLog(@"%@",metadataObject.stringValue);
        //        [session stopRunning];
    }
}
#pragma mark *** btnevents ***
-(void)respondsToBackBtn{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark *** getters ***
-(UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 44, 44)];
        [_backBtn setImage:MImage(@"scanBackBtn") forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(respondsToBackBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}
-(QRView *)qrView{
    if (!_qrView) {
        
        _qrView = [[QRView alloc] initWithFrame:self.view.bounds];
        _qrView.transparentArea = AdaptationSize(400, 400);
        _qrView.backgroundColor = [UIColor clearColor];
        _qrView.center = CGPointMake(self.view.center.x, self.view.center.y);
        
        
        
    }
    return _qrView;
}
@end
