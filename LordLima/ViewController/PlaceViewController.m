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
    
    [self loadPlaying];
    
    
    
    [self createSlider];
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
    /*[self.hysteriaPlayer removeAllItems];
    [self.hysteriaPlayer setupWithGetterBlock:^NSString *(NSUInteger index) {
        return [self.mp3Array objectAtIndex:index];
    } ItemsCount:[self.mp3Array count]];
    
    [self.hysteriaPlayer fetchAndPlayPlayerItem:0];
    //[self.hysteriaPlayer setPlayerRepeatMode:RepeatMode_on];*/
    
    
    //[self.audioPlayer play];
    
   
    
}

-(IBAction)previous:(id)sender{
    
}

-(IBAction)next:(id)sender{
    
}

-(IBAction)play:(id)sender{
    //[self.audioPlayer play];
    UIBarButtonItem *btnTemp;
    UIBarButtonItem *btnAdd;
    
    
    btnTemp = self.btnBarPlay;
    self.btnBarPlay = nil;
    
    if(self.player.rate == 1.0){ 
        self.btnBarPlay = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(play:)]; 
        btnAdd = self.btnBarPlay;
        
        [self.player pause];
    }else{
        
        self.btnBarPlay = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPause target:self action:@selector(play:)];
        btnAdd = self.btnBarPlay;
        [self.player play];
    }
    
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
    ALScrollViewPaging *scrollingView = [[ALScrollViewPaging alloc] initWithFrame:CGRectMake(0, 0, 320, 335)];
    
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


-(void) loadPlaying{
    NSArray *queue = @[[AVPlayerItem playerItemWithURL: [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Libido" ofType:@"mp3"]]],
                       [AVPlayerItem playerItemWithURL: [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Libido" ofType:@"mp3"]]],
                       [AVPlayerItem playerItemWithURL: [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Libido" ofType:@"mp3"]]]];
    
    
    self.player = [[AVQueuePlayer alloc] initWithItems:queue];
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

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if([keyPath isEqualToString:@"currentItem"]){
        AVPlayerItem *item = ((AVPlayer *) object).currentItem;
        
    }
}
@end
