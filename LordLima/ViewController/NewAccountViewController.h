//
//  NewAccountViewController.h
//  LordLima
//
//  Created by Alejandro Mayta on 18/07/13.
//  Copyright (c) 2013 Alejandro Mayta. All rights reserved.
//

#import <UIKit/UIKit.h>

@class xurfaceAppDelegate;

@interface NewAccountViewController : UIViewController<UITextFieldDelegate>


@property(nonatomic, strong) xurfaceAppDelegate *delegate;
@property(nonatomic, strong) IBOutlet UILabel *lblFirstName;
@property(nonatomic, strong) IBOutlet UILabel *lblStatus;
@property(nonatomic, strong) IBOutlet UILabel *lblLocation;
@property(nonatomic, strong) IBOutlet UIButton *btnHome;


-(IBAction)dismissRegister:(id)sender;
-(IBAction)sendLoginFacebook:(id)sender;

@end
