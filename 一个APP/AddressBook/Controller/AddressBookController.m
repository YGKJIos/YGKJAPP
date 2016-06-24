//
//  AddressBookController.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/6.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "AddressBookController.h"
#import "AddressHeaderView.h"
#import "FriendCell.h"
#import "FriendGroupView.h"
#import "SearchView.h"


@interface AddressBookController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *groupArr;
@property (nonatomic, strong)NSMutableArray *friendArr;
@property (nonatomic, strong)NSMutableArray *showArr; // 控制列表是否展开
@property (nonatomic, strong)UIImageView *downImageView;// 有方向和下方向 切换的图片
@end

@implementation AddressBookController

-(NSMutableArray *)showArr
{
    if (!_showArr) {
        self.showArr = [[NSMutableArray alloc]init];
    }
    return _showArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *item = [UIBarButtonItem itemWithTarget:self action:@selector(addressBookAddLinkman) image:@"xinpeng_tianjia" highImage:@""];
    self.navigationItem.rightBarButtonItem = item;
    
    [self addTableView];
    [self loadData];
}
- (void)loadData
{
    _groupArr = [NSMutableArray arrayWithObjects:@"好友",@"家人",@"朋友",@"同学",@"陌生人",@"黑名单", nil];
    
    _friendArr = [NSMutableArray arrayWithObjects:@"张三",@"李四",@"王五",@"未命名",@"未命名", nil];
}
// 添加联系人
- (void)addressBookAddLinkman
{
    NSLog(@"添加联系人");
}

- (void)addTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT- 113) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UIView *view =[ [UIView alloc]init];
    
    view.backgroundColor = [UIColor clearColor];
    
    [self.tableView setTableFooterView:view];
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groupArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 170;
    }
    return 50;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        AddressHeaderView *headerView = [[AddressHeaderView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 170)];
        headerView.backgroundColor = [UIColor whiteColor];
        return headerView;
    }else{
        UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 50)];
        header.backgroundColor = [UIColor whiteColor];
        
        if ([_showArr containsObject:[NSString stringWithFormat:@"%ld",section]]) {
            self.downImageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 25, 15, 15)];
            self.downImageView.image = [UIImage imageNamed:@"xiangyou"];
            self.downImageView.transform = CGAffineTransformMakeRotation(M_PI_2);
            [header addSubview:self.downImageView];
        }else{
            
            self.downImageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 25, 15, 15)];
            self.downImageView.image = [UIImage imageNamed:@"xiangyou"];
            [header addSubview:self.downImageView];
        }
       
       
     
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.downImageView.frame.size.width+35, 25, WIDTH-30, 20)];
        nameLabel.textColor = BGcolor(78, 78, 78);
        nameLabel.font = [UIFont systemFontOfSize:15];
        nameLabel.text = [NSString stringWithFormat:@"%@",_groupArr[section]];
        [header addSubview:nameLabel];
        // 单击的 Recognizer ,收缩分组cell
        header.tag = section+1000;
        
        UITapGestureRecognizer *singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(SingleTap:)];
        singleRecognizer.numberOfTapsRequired = 1; //点击的次数 =1:单击
        [singleRecognizer setNumberOfTouchesRequired:1];//1个手指操作
        [header addGestureRecognizer:singleRecognizer];//添加一个手势监测；
        return header;
    }
    return nil;
}
#pragma mark - 手势点击方法
-(void)SingleTap:(UITapGestureRecognizer*)recognizer{
    NSString *string = [NSString stringWithFormat:@"%ld",recognizer.view.tag-1000];
    //数组selectedArr里面存的数据和表头想对应，方便以后做比较
    if ([self.showArr containsObject:string])
    {
        [self.showArr removeObject:string];
    }
    else
    {
        [self.showArr addObject:string];
    }
    [self.tableView reloadData];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

        return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *sectionStr = [NSString stringWithFormat:@"%ld",section];
    if (section == 0) {
        return 0;
    }
    if ([self.showArr containsObject:sectionStr]) {
        return self.friendArr.count;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    NSString *indexStr = [NSString stringWithFormat:@"%ld",indexPath.section];
    
    if (indexPath.section == 0) {
        return nil;
    }
    static NSString *addressID = @"addressID";
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:addressID];
    if (cell == nil) {
        cell = [FriendCell createFriendCell];
        
    }
    
    if ([self.showArr containsObject:indexStr]) {
        cell.nameLab.text = _friendArr[indexPath.row];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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
