//
//  PlaceViewController.m
//  LordLima
//
//  Created by mac developer on 7/16/13.
//  Copyright (c) 2013 Alejandro Mayta. All rights reserved.
//

#import "PlaceViewController.h"


@interface PlaceViewController ()

@end

@implementation PlaceViewController
@synthesize hysteriaPlayer = _hysteriaPlayer;
@synthesize mp3Array = _mp3Array;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.mp3Array = [NSArray arrayWithObjects:
                     @"http://dl.dropbox.com/u/49227701/pain%20is%20temporary.mp3",
                     @"http://www.musiclikedirt.com/wp-content/MP3/feb/01%20New%20Noise%201.mp3", nil];
    
    [self registerAudio];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [self setTitle:@"Place"];
}

-(void) registerAudio{
    self.hysteriaPlayer = [[HysteriaPlayer sharedInstance]
                            initWithHandlerPlayerReadyToPlay:^{
                                if([self.hysteriaPlayer isPlaying]){
                                    
                                }
                            }
                           PlayerRateChanged:^{
                           
                           }
                           CurrentItemChanged:^(AVPlayerItem *newItem) {
                               if(newItem != (id)[NSNull null]){
                                   
                               }
                           //[self syncPlayPauseButtons];
                           }
                           ItemReadyToPlay:^{
                               if([self.hysteriaPlayer pauseReason] == HysteriaPauseReasonUnknown){
                                   [self.hysteriaPlayer play];
                               }
                           }
                           PlayerFailed:^{
                           
                           }
                           PlayerDidReachEnd:^{
                           
                           }];
}
-(IBAction)playStaticArray:(id)sender{
    [self.hysteriaPlayer removeAllItems];
    [self.hysteriaPlayer setupWithGetterBlock:^NSString *(NSUInteger index) {
        return [self.mp3Array objectAtIndex:index];
    } ItemsCount:[self.mp3Array count]];
    
    [self.hysteriaPlayer fetchAndPlayPlayerItem:0];
    //[self.hysteriaPlayer setPlayerRepeatMode:RepeatMode_on];
}

@end
