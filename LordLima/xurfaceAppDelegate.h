//
//  xurfaceAppDelegate.h
//  LordLima
//
//  Created by Alejandro Mayta on 13/07/13.
//  Copyright (c) 2013 Alejandro Mayta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
@class xurfaceViewController;
extern NSString *const FBSessionStateChangedNotification;
@interface xurfaceAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) xurfaceViewController *viewController;
@property (strong, nonatomic) UINavigationController *mainNavigationController;
- (void) rootViewControllerByNavigationController;
- (BOOL)openSessionWithAllowLoginUI:(BOOL)allowLoginUI;
- (void) closeSession;


@end
