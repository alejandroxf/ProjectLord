//
//  xurfaceAppDelegate.h
//  LordLima
//
//  Created by Alejandro Mayta on 13/07/13.
//  Copyright (c) 2013 Alejandro Mayta. All rights reserved.
//

#import <UIKit/UIKit.h>

@class xurfaceViewController;

@interface xurfaceAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) xurfaceViewController *viewController;
@property (strong, nonatomic) UINavigationController *mainNavigationController;
-(void) rootViewControllerByNavigationController;

@end
