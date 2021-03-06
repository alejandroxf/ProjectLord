//
//  PlaceViewController.m
//  LordLima
//
//  Created by mac developer on 7/16/13.
//  Copyright (c) 2013 Alejandro Mayta. All rights reserved.
//

#import "PlaceViewController.h" 
//#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import "ALScrollViewPaging.h"
#import "XFAudioSession.h"


@interface PlaceViewController ()

@end

@implementation PlaceViewController
@synthesize hysteriaPlayer = _hysteriaPlayer;
@synthesize mp3Array = _mp3Array;
@synthesize audioPlayer = _audioPlayer; 
@synthesize scrollView = _scrollView;
@synthesize player = _player;
@synthesize limeObserver = _limeObserver;
@synthesize toolBar = _toolbar;
@synthesize indexPlaying = _indexPlaying;
@synthesize sliderVolumen = _sliderVolumen;

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
    
    
     /*SystemSoundID sound1;
    
    //NSURL *soundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"noseralomismo" ofType:@"aif"]];
    
    NSURL *soundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Libido" ofType:@"mp3"]];
    
    OSStatus status = AudioServicesCreateSystemSoundID((__bridge CFURLRef)(soundURL), &sound1);
    NSLog(@" --- %ld", status);
    
    AudioServicesPlaySystemSound(sound1);*/
    //AudioServicesDisposeSystemSoundID(sound1);
    
    
    
   /* NSURL *soundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Libido" ofType:@"mp3"]];
    
    NSError *error;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];
    
    if(error){
        NSLog(@"Error");
    }else{
        [self.audioPlayer setDelegate:self];
        [self.audioPlayer prepareToPlay];
    }
    */
    
    /*NSString *pathAudio = [[NSBundle mainBundle] pathForResource:@"Libido"
                                                          ofType:@"mp3"];*/
    
    /*self.mp3Array = [NSArray arrayWithObjects:
                     pathAudio,
                     @"http://dl.dropbox.com/u/49227701/pain%20is%20temporary.mp3",
                     @"http://www.musiclikedirt.com/wp-content/MP3/feb/01%20New%20Noise%201.mp3",  nil];
    
    [self registerAudio];*/ 
    
    //[self loadPlaying];
    
    [self initLoadListAudio];
    
    [XFAudioSession initSession];
    
    self.player = [XFAudioSession sharedInstance];
    
    
    [self createSlider];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self setTitle:@"Place"]; 
    
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self becomeFirstResponder];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //[self.player clear];
    [[UIApplication sharedApplication] endReceivingRemoteControlEvents];
    [self resignFirstResponder];
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

-(void)initLoadListAudio{
    
    self.mp3Array = @[[AVPlayerItem playerItemWithURL: [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Libido" ofType:@"mp3"]]],
                       [AVPlayerItem playerItemWithURL: [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"noseralomismo" ofType:@"aif"]]],
                       [AVPlayerItem playerItemWithURL: [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Libido" ofType:@"mp3"]]]];
    
    
    
    
    
}
-(IBAction)playStaticArray:(id)sender{
    /*[self.hysteriaPlayer removeAllItems];
    [self.hysteriaPlayer setupWithGetterBlock:^NSString *(NSUInteger index) {
        return [self.mp3Array objectAtIndex:index];
    } ItemsCount:[self.mp3Array count]];
    [self.hysteriaPlayer fetchAndPlayPlayerItem:0];
    //[self.hysteriaPlayer setPlayerRepeatMode:RepeatMode_on];*/ 
    //[self.audioPlayer play]; 
}

-(IBAction)previous:(id)sender{
    self.indexPlaying--;
    if (self.indexPlaying >= 0) {
        [self.player PlayAtindex:self.indexPlaying items:self.mp3Array];
    }else{
        self.indexPlaying++;
    }
}

-(IBAction)next:(id)sender{
   // [self.player advanceToNextItem];
    self.indexPlaying++;
    if(self.indexPlaying < self.mp3Array.count){
        [self.player PlayAtindex:self.indexPlaying items:self.mp3Array];
    }else{
        self.indexPlaying--;
    }
}

/*
-(void) PlayAtindex:(int)index {
    [self.player removeAllItems];
    for(int i = index; i < self.mp3Array.count; i++){
        AVPlayerItem *obj = [self.mp3Array objectAtIndex:index];
        if([self.player canInsertItem:obj afterItem:nil]){
            [obj seekToTime:kCMTimeZero];
            [self.player insertItem:obj afterItem:nil];
        }
        
    }
}*/


-(IBAction)play:(id)sender{
    //[self.audioPlayer play];
    [self changeStateButtonPlayPause];
}

-(void)changeStateButtonPlayPause{
    UIBarButtonItem *btnTemp;
    UIBarButtonItem *btnAdd;
    
    float rate = [self.player play_pause];
    
    btnTemp = self.btnBarPlay;
    self.btnBarPlay = nil;
    
    if(rate == 1.0){
        self.btnBarPlay = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPause target:self action:@selector(play:)];
    }else{
        self.btnBarPlay = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(play:)];
    }
    
    btnAdd = self.btnBarPlay;
    NSMutableArray *toolBarItems = [[self.toolBar items] mutableCopy];
    
    
    if(btnTemp){
        [toolBarItems removeObject:btnTemp];
    }
    
    if(![toolBarItems containsObject:btnAdd]){
        [toolBarItems insertObject:btnAdd atIndex:5];
    }
    
    [self.toolBar setItems:toolBarItems];
}

-(void)createSlider{
    ALScrollViewPaging *scrollingView = [[ALScrollViewPaging alloc] initWithFrame:CGRectMake(0, 0, 320, 295)];
    NSMutableArray *views = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shovel"]];
        [views addObject:imageView];
    }
    //add pages to scrollview
    [scrollingView addPages:views];
    
    //add scrollview to the views
    [self.scrollView addSubview:scrollingView];
    //[self.view addSubview:scrollingView];
    
    [scrollingView setHasPageControl:NO];
}

/*
-(void) loadPlaying{
    
    
    [self initLoadListAudio];
    
    
    self.player 
    
    
    self.player = [[AVQueuePlayer alloc] initWithItems:self.mp3Array];
    self.player.actionAtItemEnd = AVPlayerActionAtItemEndAdvance;
    
    [self.player addObserver:self forKeyPath:@"currentItem" options:NSKeyValueObservingOptionNew context:nil];
    
    
    void(^observerBlock)(CMTime time) = ^(CMTime time){
        NSString *timeString = [NSString stringWithFormat:@"%02.2F", (float)time.value/(float)time.timescale];
        if ([[UIApplication sharedApplication] applicationState] == UIApplicationStateActive) {
            [self setTitle:timeString];
        }else{
            NSLog(@"AppBackground in %@", timeString);
        }
    };
    self.limeObserver = [self.player addPeriodicTimeObserverForInterval:CMTimeMake(10, 1000) queue:dispatch_get_main_queue() usingBlock:observerBlock];
    
}
 */
-(void)viewWillAppear:(BOOL)animated{
    self.player.audioQueue = [[AVQueuePlayer alloc] initWithItems:self.mp3Array];
    [self.player PlayAtindex:self.indexPlaying items:self.mp3Array];
    
}

-(IBAction)slideChange:(id)sender{
    [self.player volume:self.sliderVolumen.value];
}

#pragma mark - audio session management

-(BOOL) canBecomeFirstResponder{
    return YES;
}

-(void)remoteControlReceivedWithEvent:(UIEvent *)event{
    [self.player remoteControlReceivedWithEvent:event];
}
@end
