//
//  MinePersonalInfoViewController.m
//  ConvenienceStores
//
//  Created by 王子豪 on 16/9/14.
//  Copyright © 2016年 王子豪. All rights reserved.
//

#import "MinePersonalInfoViewController.h"
#import "MineCell.h"
#import "ChageNickNameViewController.h"
#import "ChangeSexViewController.h"
#import "ChangePasswordViewController.h"
@interface PerInfoCell : MineCell
/**具体*/
@property (nonatomic,strong) UILabel *cellDetail;

@end
@implementation PerInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.cellContent.titleLabel.font = WFont(28);
        self.cellContent.frame = CGRectMake(self.cellContent.frame.origin.x+10, self.cellContent.frame.origin.y, self.cellContent.bounds.size.width, self.cellContent.bounds.size.height);
        [self.contentView addSubview:self.cellDetail];
    }
    return self;
}
-(UILabel *)cellDetail{
    if (!_cellDetail) {
        _cellDetail = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.arrBtn.frame)-200, 0, 200, self.cellContent.bounds.size.height)];
        _cellDetail.font = WFont(28);
        _cellDetail.textAlignment = 2;
    }
    return _cellDetail;
}
@end

@interface MinePersonalInfoViewController ()<UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    NSArray *_leftArr;
    
    NSArray *_rightArr;//右边数据
    
    UIImagePickerController *_imagePickerController;
    
    UIView *_chooseDateView;//时间选择

}
/**tablview*/
@property (nonatomic,strong) UITableView *tableView;
/**头像*/
@property (nonatomic,strong) UIButton *headImage;
/**时间选择*/
@property (nonatomic,strong) UIDatePicker *datePicker;

@end

@implementation MinePersonalInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initUI];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = true;
}

#pragma mark *** 初始化数据 ***
-(void)initData{
    _leftArr = @[@[@"头像",@"昵称",@"性别",@"生日"],@[@"登录密码"]];
    _rightArr = @[@[@"icon",@"牧濑红莉栖",@"女",@"2015-5-21"],@[@""]];
    
    _imagePickerController = [[UIImagePickerController alloc] init];
    
    _imagePickerController.delegate = self;
}
#pragma mark *** 初始化界面 ***
-(void)initUI{
    [self.view addSubview:self.tableView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark *** imagePickerControllerdelegate ***

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    [self.headImage setImage:info[UIImagePickerControllerEditedImage] forState:0];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)selectPhotoAlbumPhotos{
    NSArray *mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        _imagePickerController.mediaTypes = @[mediaTypes[0]];
        _imagePickerController.allowsEditing = YES;
        
        [self presentViewController:_imagePickerController animated:YES completion:nil];
    }
}
#pragma mark *** TableViewDelegate ***
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 4;
    }
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0;
    }
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0&&indexPath.row==0) {
        return 236*AdaptationWidth();
    }
    return 99*AdaptationWidth();
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PerInfoCell *cell = [[PerInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"perInfoCell"];
    [cell.cellContent setTitle:_leftArr[indexPath.section][indexPath.row] forState:0];
    cell.cellDetail.text = _rightArr[indexPath.section][indexPath.row];
    
    if (indexPath.section==0&&indexPath.row==0) {
        cell.cellContent.frame = CGRectMake(cell.cellContent.frame.origin.x, cell.cellContent.frame.origin.y+85*AdaptationWidth(), cell.cellContent.bounds.size.width, cell.cellContent.bounds.size.height);
        cell.arrBtn.frame = CGRectMake(cell.arrBtn.frame.origin.x, cell.arrBtn.frame.origin.y+85*AdaptationWidth(), cell.arrBtn.bounds.size.width, cell.arrBtn.bounds.size.height);
        cell.cellDetail.text = @"";

        [self.headImage setBackgroundImageWithURL:nil forState:0 placeholder:MImage(_rightArr[indexPath.section][indexPath.row])];
        [cell.contentView addSubview:self.headImage];
        
    }else if (indexPath.section==1){
        cell.cellContent.frame = CGRectMake(cell.cellContent.frame.origin.x+10*AdaptationWidth(), cell.cellContent.frame.origin.y, cell.cellContent.bounds.size.width+30*AdaptationWidth(), cell.cellContent.bounds.size.height);
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0&&indexPath.row==0) {
        [self selectPhotoAlbumPhotos];
    }else if (indexPath.section==0&&indexPath.row==1){
        ChageNickNameViewController *changeNameVc = [[ChageNickNameViewController alloc] initWithHeaderType:HeaderTypeBackAndThreePoint title:@"修改昵称"];
        changeNameVc.nameTF.text = _rightArr[indexPath.section][indexPath.row];
        [self.navigationController pushViewController:changeNameVc animated:YES];
    }else if (indexPath.section==0&&indexPath.row==2){
        ChangeSexViewController *changeSexVc = [[ChangeSexViewController alloc] initWithHeaderType:HeaderTypeBackAndThreePoint title:@"修改性别"];
        changeSexVc.sex = YES;
        [self.navigationController pushViewController:changeSexVc animated:YES];
    }else if (indexPath.section==0&&indexPath.row==3){
        [self selecTime];
    }else{
        ChangePasswordViewController *psdVc = [[ChangePasswordViewController alloc] initWithHeaderType:HeaderTypeBackAndThreePoint title:@"修改密码"];
        [self.navigationController pushViewController:psdVc animated:YES];
    }
}
//选择日期
-(void)selecTime{
    
    //日期选择 弹出框
    _chooseDateView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height)];
    [self.view addSubview:_chooseDateView];
    _chooseDateView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.5f];
    
    // 日期视图
    UIView *dateView = [[UIView alloc]initWithFrame:CGRectMake(0, Screen_height-200, Screen_width, 200)];
    [_chooseDateView addSubview:dateView];
    
//    dateView.backgroundColor = HEXCOLOR(0xffffff);
    
    //1 按钮视图
    UIView *btnView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectW(dateView), 40)];
    [dateView addSubview:btnView];
    btnView.backgroundColor = mainGrayColor;
    
    // 按钮字体颜色  color(0 84 255)  (0x0051ff)
    //2 确定按钮
    UIButton * _datesureBtn = [[UIButton alloc]initWithFrame:CGRectMake(Screen_width-55, 10, 40, 20)];
    [btnView addSubview:_datesureBtn];
    _datesureBtn.titleLabel.font = MFont(15);
    [_datesureBtn setTitle:@"确定" forState:0];
    [_datesureBtn setTitleColor:LH_RGBCOLOR(35, 91, 252) forState:0];
    [_datesureBtn addTarget:self action:@selector(dateSureBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    //3 取消按钮
    UIButton * _datecancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 10, 40, 20)];
    [btnView addSubview:_datecancelBtn];
    _datecancelBtn.titleLabel.font = MFont(15);
    [_datecancelBtn setTitle:@"取消" forState:0];
    [_datecancelBtn setTitleColor:LH_RGBCOLOR(35, 91, 252) forState:0];
    [_datecancelBtn addTarget:self action:@selector(dateCancelBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    //日期选择 datePicker
    _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 40, Screen_width, 160)];
    _datePicker.datePickerMode = UIDatePickerModeDate;
    [_datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
    _datePicker.backgroundColor = [UIColor whiteColor];
    [dateView addSubview:_datePicker];
}
#pragma mark *** 时间选择器的事件 ***
-(void)dateSureBtnAction{
    NSDateFormatter *formatter =[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    _rightArr = @[@[@"icon",@"牧濑红莉栖",@"女",[NSString stringWithFormat:@"%@",[formatter stringFromDate:self.datePicker.date]]],@[@""]];
    
    [_tableView reloadData];
    [_chooseDateView removeFromSuperview];
}
-(void)dateCancelBtnAction{
    [_chooseDateView removeFromSuperview];
}
-(void)dateChanged:(UIDatePicker *)sender{
    NSDateFormatter *formatter =[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    _rightArr = @[@[@"icon",@"牧濑红莉栖",@"女",[NSString stringWithFormat:@"%@",[formatter stringFromDate:self.datePicker.date]]],@[@""]];
    [_tableView reloadData];
}
#pragma mark *** getters ***
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, Screen_width, 642*AdaptationWidth())];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[PerInfoCell class] forCellReuseIdentifier:@"perInfoCell"];
        _tableView.bounces = false;
    }
    return _tableView;
}
-(UIButton *)headImage{
    if (!_headImage) {
        _headImage = [[UIButton alloc] initWithFrame:AdaptationFrame(500, 30, 175, 175)];
        _headImage.layer.cornerRadius = _headImage.bounds.size.height/2;
        _headImage.layer.masksToBounds = true;
        [_headImage setBackgroundImage:MImage(@"icon") forState:0];
        _headImage.userInteractionEnabled = false;
        
    }
    return _headImage;
}
@end



