//
//  xurfaceAppDelegate.m
//  LordLima
//
//  Created by Alejandro Mayta on 13/07/13.
//  Copyright (c) 2013 Alejandro Mayta. All rights reserved.
//

#import "xurfaceAppDelegate.h"

#import "xurfaceViewController.h"
#import "HomeViewController.h"
#import "NewAccountViewController.h"

@implementation xurfaceAppDelegate

NSString *const FBSessionStateChangedNotification =
@"com.xurface.LordLima:FBSessionStateChangedNotification";


@synthesize mainNavigationController = _mainNavigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //Register the view facebook image
    [FBProfilePictureView class];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[xurfaceViewController alloc] initWithNibName:@"xurfaceViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

-(void) rootViewControllerByNavigationController{
    UIViewController *currentVC = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    self.mainNavigationController  = [[UINavigationController alloc] initWithRootViewController:currentVC];
    self.window.rootViewController = self.mainNavigationController;
    [self.window makeKeyAndVisible];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    [FBSession.activeSession handleDidBecomeActive];
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Release ViewController and MainNavigationCotroller.
    self.viewController = nil;
    self.mainNavigationController = nil;
    
    //Close the session of facebook
    [FBSession.activeSession close];
}


#pragma mark - Facebook



/*
 * Opens a Facebook session and optionally shows the login UX.
 */
- (BOOL)openSessionWithAllowLoginUI:(BOOL)allowLoginUI {
    
    NSArray *permissions = @[@"basic_info", @"email"];
    
    return [FBSession openActiveSessionWithReadPermissions:permissions
                                              allowLoginUI:allowLoginUI
                                         completionHandler:^(FBSession *session,
                                                             FBSessionState status,
                                                             NSError *error) {
                                             
                                             [self sessionStateChanged:session
                                                                 state:status
                                                                 error:error];
                                             }];
}

- (void)sessionStateChanged:(FBSession *)session
                      state:(FBSessionState) state
                      error:(NSError *)error
{
    switch (state) {
        case FBSessionStateOpen:
            if (!error) {
                // We have a valid session
            }
            break;
        case FBSessionStateClosed:
        case FBSessionStateClosedLoginFailed:
            [FBSession.activeSession closeAndClearTokenInformation];
            break;
        default:
            break;
    }
    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:FBSessionStateChangedNotification
     object:session];
    
    if (error) {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Error"
                                  message:error.localizedDescription
                                  delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    }
}

/*
 * If we have a valid session at the time of openURL call, we handle
 * Facebook transitions by passing the url argument to handleOpenURL
 */

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    // attempt to extract a token from the url
    return [FBSession.activeSession handleOpenURL:url];
}


-(void)closeSession{
    [FBSession.activeSession closeAndClearTokenInformation];
}

@end
