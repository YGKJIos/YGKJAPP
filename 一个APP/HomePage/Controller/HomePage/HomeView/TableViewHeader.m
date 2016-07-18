//
//  TableViewHeader.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/17.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "TableViewHeader.h"

@implementation TableViewHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self CreateView];
    }
    return self;
}
- (void)CreateView
{
    self.backgroundColor = [UIColor whiteColor];
    UILabel *leftLine = [[UILabel alloc]initWithFrame:CGRectMake(0, self.height/2, self.width/2-70, 1)];
    leftLine.backgroundColor = BGcolor(84, 198, 214);
    [self addSubview:leftLine];
    
    self.titleLab = [[UILabel alloc]initWithFrame:CGRectMake(self.width/2-70, self.height/2-12,140, 24)];
    self.titleLab.backgroundColor = BGcolor(84, 198, 214);
    self.titleLab.font = [UIFont systemFontOfSize:15];
    self.titleLab.textAlignment = NSTextAlignmentCenter;
    self.titleLab.textColor = [UIColor whiteColor];
    [self addSubview:self.titleLab];
    
    UILabel *rightLine = [[UILabel alloc]initWithFrame:CGRectMake(self.width/2+70, self.height/2, self.width/2-70, 1)];
    rightLine.backgroundColor = BGcolor(84, 198, 214);
    [self addSubview:rightLine];
}
-(void)setTitleLabText:(NSString *)text
{
    self.titleLab.text = text;
}


@end
