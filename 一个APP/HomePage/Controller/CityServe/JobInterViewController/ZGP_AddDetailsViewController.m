//
//  ZGP_AddDetailsViewController.m
//  MerchantPort
//
//  Created by Tiny on 16/8/27.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "ZGP_AddDetailsViewController.h"
@interface ZGP_AddDetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *xizi;
@property (weak, nonatomic) IBOutlet UILabel *dizhi;
@property (weak, nonatomic) IBOutlet UILabel *xueli;
@property (weak, nonatomic) IBOutlet UILabel *gongzuoshijian;
@property (weak, nonatomic) IBOutlet UILabel *quanzhi;
@property (weak, nonatomic) IBOutlet UILabel *zhiweimiaoshu;
@property (weak, nonatomic) IBOutlet UILabel *gongsimiaoshu;
@property (weak, nonatomic) IBOutlet UILabel *fuli;




@end

@implementation ZGP_AddDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"职位详情";
    self.navigationController.navigationBar.barTintColor = BGcolor(34, 198, 220);
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithTarget:self action:@selector(fanhui) image:@"wode_fanhui" highImage:@"wode_fanhui"];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem = leftItem;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self ZGP_zhaopinModel:self.model];
}
- (void)ZGP_zhaopinModel:(PleaseJobModel *)model{
    self.name.text = model.zhaopinZhiwei;
    self.xizi.text = [NSString stringWithFormat:@"【%@k】",model.zhaopinXinzi];
    self.dizhi.text = model.shangjiaWeizhi;
    self.xueli.text = model.zhaopinXueli;
    self.gongzuoshijian.text= model.zhaopinGongzuojingyan;
    self.quanzhi.text = model.zhaopinShijian;
    self.fuli.text = model.zhaopinFuli;
    self.zhiweimiaoshu.text = model.zhaopinZhiweimiaoshu;
    self.gongsimiaoshu.text = model.zhaopinGongsijianjie;
}
- (void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setHeaderModel:(MerchantInformationModel *)model
{
    self.telephoneNum = model.shangjiaDianhua;
}

- (IBAction)tele:(UIButton *)sender {
    UIWebView*callWebview =[[UIWebView alloc] init];
    NSString *phoneText = [NSString stringWithFormat:@"tel://%@",@"18845603020"];
    NSURL *telURL =[NSURL URLWithString:phoneText];// 貌似tel:// 或者 tel: 都行
    [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];

    if (self.telephoneNum) {
        NSMutableString *str = [NSMutableString stringWithFormat:@"telprompt://%@" , self.telephoneNum];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    }
    
    //记得添加到view上
    [self.view addSubview:callWebview];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
