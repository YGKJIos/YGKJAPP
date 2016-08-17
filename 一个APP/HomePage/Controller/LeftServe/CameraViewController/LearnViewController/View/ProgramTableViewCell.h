//
//  ProgramTableViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

// 节目选票
@interface ProgramTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *programName;
@property (weak, nonatomic) IBOutlet UIImageView *programImage;
@property (weak, nonatomic) IBOutlet UILabel *programContent;
@property (weak, nonatomic) IBOutlet UILabel *numProgram;
- (IBAction)programBtn:(id)sender;

+ (ProgramTableViewCell *)createProgramCellNib;
//- (void)setprogramcontentModel;



@end
