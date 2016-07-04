//
//  LearnViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/4.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "LearnViewController.h"
#import "HeaderCollectionReusableView.h"
#import "LearnCollectionViewCell.h"

@interface LearnViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation LearnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(165*(WIDTH/375), 185);
    flowLayout.headerReferenceSize = CGSizeMake(WIDTH, 150);
    flowLayout.sectionInset = UIEdgeInsetsMake(20, 15, 20, 15);
    flowLayout.minimumLineSpacing = 10;
    
    UICollectionView *collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64) collectionViewLayout:flowLayout];
    collection.backgroundColor = [UIColor whiteColor];
    collection.delegate = self;
    collection.dataSource = self;
    collection.showsVerticalScrollIndicator = NO;
    [self.view addSubview:collection];
    
    UINib *nib = [UINib nibWithNibName:@"LearnCollectionViewCell" bundle:[NSBundle mainBundle]];
    [collection registerNib:nib forCellWithReuseIdentifier:@"learnCell"];
    [collection registerClass:[HeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headID"];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LearnCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"learnCell" forIndexPath:indexPath];
    
//    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(0, 199, 200, 1)];
//    line1.backgroundColor = BGcolor(210, 210, 210);
//    [cell addSubview:line1];
//    
//    UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(174, 0, 1, 200)];
//    line2.backgroundColor = BGcolor(210, 210, 210);
//    [cell addSubview:line2];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    NSArray *arr = @[@"chaoshi_tu",@"chaoshi_tu",@"chaoshi_tu",@"chaoshi_tu",];
    HeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headID" forIndexPath:indexPath];
    [headerView setScrollViewImage:arr];
    return headerView;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"row = %ld, section= %ld",indexPath.row,indexPath.section);
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
