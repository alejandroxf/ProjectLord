//
//  StartSesionViewController.h
//  LordLima
//
//  Created by Alejandro Mayta on 18/07/13.
//  Copyright (c) 2013 Alejandro Mayta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "xurfaceAppDelegate.h"
@interface StartSesionViewController : UIViewController

@property(nonatomic, strong) xurfaceAppDelegate *delegate;

-(IBAction)sendLoginFacebook:(id)sender;
-(IBAction)dismissRegister:(id)sender;
-(void)loadViewControllerHome;



@end
