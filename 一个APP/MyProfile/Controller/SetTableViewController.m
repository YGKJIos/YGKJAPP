//
//  SetTableViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/7/16.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "SetTableViewController.h"
#import "SetTableViewCell.h"
#import "SetNameTableViewCell.h"
#import "SetFooterView.h"
#import "SetNameViewController.h"
#import "EditingAddressViewController.h"
#import "LoginViewController.h"
#import "fotgetViewController.h"
#import "LoginViewController.h"
@interface SetTableViewController ()<SecondViewControllerDelete,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

//@property (weak, nonatomic) IBOutlet UIScrollView *imageScroll;
//@property (weak, nonatomic) IBOutlet UIImageView *photoImage;

@end

@implementation SetTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.frame = CGRectMake(0, 0, WIDTH, HEIGHT - 64);

    self.title = @"设置";
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    SetFooterView *cell = [[[NSBundle mainBundle]loadNibNamed:@"SetFooterView" owner:nil options:nil]lastObject];
    [cell.outBtn addTarget:self action:@selector(clickOutBtn) forControlEvents:UIControlEventTouchUpInside];
    self.tableView.tableFooterView = cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        SetTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"SetTableViewCell" owner:nil options:nil]lastObject];
        cell.headImage.layer.cornerRadius = cell.headImage.frame.size.width/2;
        cell.headImage.layer.masksToBounds = YES;
        cell.headImage.layer.borderWidth = 1.5f;
        cell.headImage.layer.borderColor = [UIColor whiteColor].CGColor;
        cell.headImage.userInteractionEnabled = YES;
        cell.headImage.tag = 1001;
        //初始化一个手势
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                                   action:@selector(alterHeadPortrait:)];
        //给imageView添加手势
        [cell.headImage addGestureRecognizer:singleTap];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.row == 1) {
        
        
        SetNameTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"SetNameTableViewCell" owner:nil options:nil]lastObject];
        cell.RightLabel.tag = 1000;
        cell.RightLabel.textColor = BGcolor(175, 175, 175);
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.row == 2) {
        SetNameTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"SetNameTableViewCell" owner:nil options:nil]lastObject];
        cell.RightLabel.text = @"添加/修改";
        cell.leftLable.text = @"收货地址";
        cell.LeftImage.image = [UIImage imageNamed:@"shezhi_shouhuodizhi"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
//    if (indexPath.row == 3) {
//        SetNameTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"SetNameTableViewCell" owner:nil options:nil]lastObject];
//        cell.RightLabel.text = @"更改";
//        cell.leftLable.text = @"绑定手机";
//        cell.LeftImage.image = [UIImage imageNamed:@"shezhi_bangdingshouji"];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return cell;
//    } 
    
    if (indexPath.row == 3) {
        SetNameTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"SetNameTableViewCell" owner:nil options:nil]lastObject];
        NSString *path = [self getCachesPath];
        CGFloat num = [self getCacheSizeAtPath:path];
        cell.RightLabel.text = [NSString stringWithFormat:@"%0.2f" , num];
        cell.leftLable.text = @"清空缓存";
        cell.LeftImage.image = [UIImage imageNamed:@"shezhi_qingkonghuancun"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.row == 4) {
        SetNameTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"SetNameTableViewCell" owner:nil options:nil]lastObject];
        cell.RightLabel.text = @"修改";
        cell.leftLable.text = @"修改密码";
        cell.LeftImage.image = [UIImage imageNamed:@"shezhi_xiugaimima"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
//    if (indexPath.row == 6) {
//        SetNameTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"SetNameTableViewCell" owner:nil options:nil]lastObject];
//        cell.RightLabel.text = @"修改";
//        cell.leftLable.text = @"安全";
//        cell.LeftImage.image = [UIImage imageNamed:@"shezhi_anquan"];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return cell;
//    }
    static NSString *reuse = @"reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuse];
    }
    return cell;
}


-(void)alterHeadPortrait:(UITapGestureRecognizer *)gesture{
    /**
     *  弹出提示框
     */
    //初始化提示框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    //按钮：从相册选择，类型：UIAlertActionStyleDefault
    [alert addAction:[UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //初始化UIImagePickerController
        UIImagePickerController *PickerImage = [[UIImagePickerController alloc]init];
        //获取方式1：通过相册（呈现全部相册），UIImagePickerControllerSourceTypePhotoLibrary
        //获取方式2，通过相机，UIImagePickerControllerSourceTypeCamera
        //获取方法3，通过相册（呈现全部图片），UIImagePickerControllerSourceTypeSavedPhotosAlbum
        PickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //允许编辑，即放大裁剪
        PickerImage.allowsEditing = YES;
        //自代理
        PickerImage.delegate = self;
        //页面跳转
        [self presentViewController:PickerImage animated:YES completion:nil];
    }]];
    //按钮：拍照，类型：UIAlertActionStyleDefault
    [alert addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        /**
         其实和从相册选择一样，只是获取方式不同，前面是通过相册，而现在，我们要通过相机的方式
         */
        UIImagePickerController *PickerImage = [[UIImagePickerController alloc]init];
        //获取方式:通过相机
        PickerImage.sourceType = UIImagePickerControllerSourceTypeCamera;
        PickerImage.allowsEditing = YES;
        PickerImage.delegate = self;
        [self presentViewController:PickerImage animated:YES completion:nil];
    }]];
    //按钮：取消，类型：UIAlertActionStyleCancel
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

//PickerImage完成后的代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //定义一个newPhoto，用来存放我们选择的图片。
    UIImage *newPhoto = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    UIImageView *headImage = (UIImageView *)[self.view viewWithTag:1001];
    headImage.image = newPhoto;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        NSLog(@"更换头像");
    }
    if (indexPath.row == 1) {
//        SetNameViewController *setVC = [[SetNameViewController alloc] init];
//        UILabel *nameLabel = (UILabel *)[self.view viewWithTag:1000];
//        setVC.str = nameLabel.text;
//        setVC.delegate = self;
//        [self.navigationController pushViewController:setVC animated:YES];
        NSLog(@"修改昵称");
    }
    if (indexPath.row == 2) {
        EditingAddressViewController *editingVC = [[EditingAddressViewController alloc] init];
        [self.navigationController pushViewController:editingVC animated:YES];
    }
//    if (indexPath.row == 3) {
//        NSLog(@"修改绑定手机");
//    }
    if (indexPath.row == 3) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText = @"正在清除缓存...";
        NSString *path = [self getCachesPath];
        [self clearCacheAtPath:path];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hide:YES];
            [tableView reloadData];
        });
        
        
    }
    if (indexPath.row == 4) {
        fotgetViewController *passWordVC = [[fotgetViewController alloc] init];
        [self presentViewController:passWordVC animated:YES completion:nil];
    }
//    if (indexPath.row == 6) {
//        NSLog(@"修改安全");
//    }
    
}
// 退出登录按钮
- (void)clickOutBtn
{
    [[UserInfo shareAccount] logoOutAccount];
    
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:nil];

}
- (void)passwordDelegate:(NSString *)passworde
{
    NSString *sandBoxPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *path = [sandBoxPath stringByAppendingPathComponent:@"manager/userDic.plish"];
    //    NSLog(@"%@" , path);
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSString *dicPass = dic[@"password"];
    if (passworde != dicPass) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您的密码已经修改，请重新登录" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            LoginViewController *login = [[LoginViewController alloc]init];
            [self presentViewController:login animated:YES completion:nil];
        }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
}

// 修改名字代理方法
- (void)bringStr:(NSString *)str
{
    UILabel *nameLabel = (UILabel *)[self.view viewWithTag:1000];
    nameLabel.text = str;
}


- (NSString *)getCachesPath{
    // 获取Caches目录路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask,YES);
    NSString *cachesDir = [paths objectAtIndex:0];
    NSString *filePath = [cachesDir stringByAppendingPathComponent:@"com.apress.yuanguApp"];
    return filePath;
}

- (long long)fileSizeAtPath:(NSString*)filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}


- (float)getCacheSizeAtPath:(NSString*)folderPath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath])return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];//从前向后枚举器
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize/(1024.0*1024.0);
}

- (void)clearCacheAtPath:(NSString *)path{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        NSArray *childerFiles=[fileManager subpathsAtPath:path];
        for (NSString *fileName in childerFiles) {
            //如有需要，加入条件，过滤掉不想删除的文件
            NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
            [fileManager removeItemAtPath:absolutePath error:nil];
        }
    }
}

@end
