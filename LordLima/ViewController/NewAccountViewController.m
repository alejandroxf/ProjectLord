//
//  NewAccountViewController.m
//  LordLima
//
//  Created by Alejandro Mayta on 18/07/13.
//  Copyright (c) 2013 Alejandro Mayta. All rights reserved.
//

#import "NewAccountViewController.h"
#import "xurfaceAppDelegate.h"

@interface NewAccountViewController ()
@end

@implementation NewAccountViewController
@synthesize lblFirstName = _lblFirstName;
@synthesize lblStatus = _lblStatus;
@synthesize lblLocation = _lblLocation;
@synthesize btnHome = _btnHome;
@synthesize delegate = _delegate;

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
    
    
    
    //Abrir sesion si este ya esta creada.
    _delegate = [[UIApplication sharedApplication] delegate];
    [self.delegate openSessionWithAllowLoginUI:NO];
    
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(sessionStateChanged:)
     name:FBSessionStateChangedNotification
     object:nil];
    
    if([FBSession.activeSession isOpen]){
        [self loadViewControllerHome];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)sendHome:(id)sender{
    
    xurfaceAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    [delegate rootViewControllerByNavigationController];
}

#pragma mark - FBLoginViewDelegate
-(IBAction)sendLoginFacebook:(id)sender{
    
    [_delegate openSessionWithAllowLoginUI:YES];
    
}


- (void)sessionStateChanged:(NSNotification*)notification {
    if (FBSession.activeSession.isOpen) {
        
        /*
         //Recueperar las propiedades del usuario que esta en sesion
         
        [[FBRequest requestForMe] startWithCompletionHandler:
         ^(FBRequestConnection *connection,
           NSDictionary<FBGraphUser> *user,
           NSError *error) {
             if (!error) {
                 self.lblFirstName.text = user.first_name;  
                 //self.lblMail.text = [user objectForKey:@"email"];
                 self.lblLocation.text = user.location.name;
             }
         }];
        */
        
        [self loadViewControllerHome];

    }
}

-(void) loadViewControllerHome{
    [_delegate rootViewControllerByNavigationController];
}
#pragma mark - end FBLoginViewDelegate

#pragma mark - UITextFieldDelegate

-(IBAction)dismissRegister:(id)sender{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
