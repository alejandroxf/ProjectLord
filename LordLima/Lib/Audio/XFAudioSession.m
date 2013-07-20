//
//  XFAudioSession.m
//  LordLima
//
//  Created by mac developer on 7/19/13.
//  Copyright (c) 2013 Alejandro Mayta. All rights reserved.
//

#import "XFAudioSession.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
@implementation XFAudioSession
@synthesize audioQueue = _audioQueue;


+(void)initSession{
    // Registers this class as the delegate of the audio session.
    [[AVAudioSession sharedInstance] setDelegate: self];
    
    NSError *setCategoryError = nil;
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error: &setCategoryError];
    if (setCategoryError) {
        NSLog(@"Error setting category! %@", [setCategoryError localizedDescription]);
    }
    
    UInt32 doSetProperty = 0;
    AudioSessionSetProperty (
                             kAudioSessionProperty_OverrideCategoryMixWithOthers,
                             sizeof (doSetProperty),
                             &doSetProperty
                             );
    
    NSError *activationError = nil;
    [[AVAudioSession sharedInstance] setActive: YES error: &activationError];
    if (activationError) {
        NSLog(@"Could not activate audio session. %@", [activationError localizedDescription]);
    }
}


-(AVQueuePlayer*) audioPlayer{
    if(_audioQueue == nil){
        _audioQueue = [[AVQueuePlayer alloc] init];
    }
    return _audioQueue;
}


-(void) PlayAtindex:(int)index items:(NSArray*)mp3Array {
    [_audioQueue removeAllItems];
    
    for(int i = index; i < mp3Array.count; i++){
        AVPlayerItem *obj = [mp3Array objectAtIndex:index];
        if([_audioQueue canInsertItem:obj afterItem:nil]){
            [obj seekToTime:kCMTimeZero];
            [_audioQueue insertItem:obj afterItem:nil];
            
            [_audioQueue play];
        }
        
    }
}


#pragma mark audio actions

-(float)play_pause{
    if(_audioQueue.rate == 1.0){
        [_audioQueue pause];
    }else{
        [_audioQueue play];
    }
    
    return _audioQueue.rate;
}

-(void)clear{
    [_audioQueue removeAllItems];
}

-(void)volume:(float)value{
    
    AVPlayerItem *playerItem = [_audioQueue currentItem];
    NSArray *audioTracks = [playerItem.asset tracksWithMediaType:AVMediaTypeAudio];
    NSMutableArray *allAudioParams = [NSMutableArray array];
    for(AVAssetTrack *track in audioTracks){
        AVMutableAudioMixInputParameters *audioInputParams = [AVMutableAudioMixInputParameters audioMixInputParameters];
        [audioInputParams setVolume:value atTime:[playerItem currentTime]];
        [audioInputParams setTrackID:[track trackID]];
        [allAudioParams addObject:audioInputParams];
    }
    
    AVMutableAudioMix *audioMix = [AVMutableAudioMix audioMix];
    [audioMix setInputParameters:allAudioParams];
    
    [playerItem setAudioMix:audioMix];
}

-(void) remoteControlReceivedWithEvent:(UIEvent *)event{
    NSLog(@"received event!");
    if (event.type == UIEventTypeRemoteControl) {
        switch (event.subtype) {
            case UIEventSubtypeRemoteControlTogglePlayPause: {
                if ([self audioPlayer].rate > 0.0) {
                    [[self audioPlayer] pause];
                } else {
                    [[self audioPlayer] play];
                }
                
                break;
            }
            default:
                break;
        }
    }
}
@end