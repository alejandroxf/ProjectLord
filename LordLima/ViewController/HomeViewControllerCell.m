//
//  HomeViewControllerCell.m
//  LordLima
//
//  Created by mac developer on 7/17/13.
//  Copyright (c) 2013 Alejandro Mayta. All rights reserved.
//

#import "HomeViewControllerCell.h"

@implementation HomeViewControllerCell 

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self createElements];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void) createElements{
    
    UILabel *NameText=[[UILabel alloc] initWithFrame:CGRectMake(50, 4, 230, 14)];
    NameText.font=[UIFont fontWithName:@"Helvetica"  size:12];
  	NameText.backgroundColor =[UIColor clearColor];
     NameText.tag=1;
	[self.contentView addSubview:NameText]; 
}

@end
