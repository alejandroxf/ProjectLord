//
//  PlaceViewController.h
//  LordLima
//
//  Created by mac developer on 7/16/13.
//  Copyright (c) 2013 Alejandro Mayta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HysteriaPlayer.h"
@interface PlaceViewController : UIViewController


@property(nonatomic, strong) HysteriaPlayer *hysteriaPlayer;

@property(nonatomic, strong) NSArray *mp3Array;

-(IBAction)playStaticArray:(id)sender;
@end
