//
//  PlayerVoteViewController.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/24.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "PlayerVoteViewController.h"
#import "PlayerCollectionViewCell.h"
#import "PlayerGroupCollectionReusableView.h"

@interface PlayerVoteViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong)UICollectionView *collection;

@end

@implementation PlayerVoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(131*(WIDTH/375), 231);
    flowLayout.headerReferenceSize = CGSizeMake(WIDTH, 50);
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 40*(WIDTH/375), 20, 40*(WIDTH/375));
    flowLayout.minimumLineSpacing = 10;
    
    
    self.collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64) collectionViewLayout:flowLayout];
    self.collection.backgroundColor = [UIColor whiteColor];
    self.collection.delegate = self;
    self.collection.dataSource = self;
    self.collection.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.collection];
    
    UINib *nib = [UINib nibWithNibName:@"PlayerCollectionViewCell" bundle:[NSBundle mainBundle]];
    [self.collection registerNib:nib forCellWithReuseIdentifier:@"playerCell"];
    [self.collection registerClass:[PlayerGroupCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerID"];

//    self.MarkeArr = [[NSMutableArray alloc] init];
//    [self MJrefreshLoadData];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
//    return self.MarkeArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PlayerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"playerCell" forIndexPath:indexPath];
//    [cell LearnModel:self.MarkeArr[indexPath.row]];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    PlayerGroupCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerID" forIndexPath:indexPath];
    view.groupLab.text = @"幼儿组";
    return view;
}


@end
