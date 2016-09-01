//
//  MoiveTableViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/6/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
#import "BaseTableViewCell.h"


@interface MoiveTableViewCell : BaseTableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *movieImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabe;
@property (weak, nonatomic) IBOutlet UIImageView *xingImage;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UILabel *fenLabel;
@property (weak, nonatomic) IBOutlet UILabel *jieshaoLabel;
@property (weak, nonatomic) IBOutlet UIImageView *tuijianImage;

@property (weak, nonatomic) IBOutlet UILabel *rmbshuLabel;
@property (weak, nonatomic) IBOutlet UILabel *yuanjiaLabel;
@property (weak, nonatomic) IBOutlet UILabel *yjrmbLabel;

@property (weak, nonatomic) IBOutlet UIImageView *stylImage;
- (IBAction)telephoneNumAction:(id)sender;



+ (MoiveTableViewCell *) createMoiveCell;

- (void)MovieModel:(MovieModel *) model;

@end
