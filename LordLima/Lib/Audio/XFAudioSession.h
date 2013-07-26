//
//  XFAudioSession.h
//  LordLima
//
//  Created by mac developer on 7/19/13.
//  Copyright (c) 2013 Alejandro Mayta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface XFAudioSession : NSObject

@property(nonatomic, strong) AVQueuePlayer* audioQueue;

+(XFAudioSession *)sharedInstance;
+(void)initSession; 
-(float)play_pause;
-(void) PlayAtindex:(int)index items:(NSArray*)mp3Array;
-(void) clear;
-(void) volume:(float)value;
-(void) remoteControlReceivedWithEvent:(UIEvent *)event;

@end
