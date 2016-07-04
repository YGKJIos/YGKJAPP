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
    flowLayout.itemSize = CGSizeMake(180*(WIDTH/375), 150);
    flowLayout.headerReferenceSize = CGSizeMake(WIDTH, 190);
    flowLayout.sectionInset = UIEdgeInsetsMake(8, 3, 8, 3);
    flowLayout.minimumInteritemSpacing = 8;
    flowLayout.minimumLineSpacing = 8;
    
    UICollectionView *collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) collectionViewLayout:flowLayout];
    collection.backgroundColor = BGcolor(226, 226, 226);
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
