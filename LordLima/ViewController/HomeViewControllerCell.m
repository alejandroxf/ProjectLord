//
//  HomeViewControllerCell.m
//  LordLima
//
//  Created by mac developer on 7/17/13.
//  Copyright (c) 2013 Alejandro Mayta. All rights reserved.
//

#import "HomeViewControllerCell.h"

@implementation HomeViewControllerCell
@synthesize lblTitle = _lblTitle;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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
    self.lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 180, 20)];
    [self.lblTitle setText:@"Title"];
    
    
}

@end
