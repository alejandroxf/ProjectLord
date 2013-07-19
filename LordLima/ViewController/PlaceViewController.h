//
//  PlaceViewController.h
//  LordLima
//
//  Created by mac developer on 7/16/13.
//  Copyright (c) 2013 Alejandro Mayta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "HysteriaPlayer.h"



@interface PlaceViewController : UIViewController<AVAudioPlayerDelegate>
 
@property(nonatomic, weak) IBOutlet UIScrollView *scrollView;

@property(nonatomic, strong) AVAudioPlayer *audioPlayer;


@property(nonatomic, strong) HysteriaPlayer *hysteriaPlayer;

@property(nonatomic, strong) NSArray *mp3Array;



@property(nonatomic, strong) AVQueuePlayer *player;
@property(nonatomic, strong) id limeObserver;

@property(nonatomic, strong) IBOutlet UIToolbar *toolBar;
@property(nonatomic, strong) IBOutlet UIBarButtonItem *btnBarNext;
@property(nonatomic, strong) IBOutlet UIBarButtonItem *btnBarPrevious;
@property(nonatomic, strong) IBOutlet UIBarButtonItem *btnBarPlay;

-(IBAction)playStaticArray:(id)sender; 
-(IBAction)previous:(id)sender;
-(IBAction)next:(id)sender;
-(IBAction)play:(id)sender;
@end
