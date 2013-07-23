//
//  NewAccountViewController.m
//  LordLima
//
//  Created by Alejandro Mayta on 18/07/13.
//  Copyright (c) 2013 Alejandro Mayta. All rights reserved.
//

#import "NewAccountViewController.h"
#import "xurfaceAppDelegate.h"

@interface NewAccountViewController ()<FBLoginViewDelegate, UITextFieldDelegate>

@property(nonatomic, strong) id<FBGraphUser> loggedInUser;
@property(nonatomic, strong) IBOutlet UILabel *lblFirstName;
@property(nonatomic, strong) IBOutlet FBProfilePictureView *fbProfilePic;
@property(nonatomic, strong) IBOutlet UILabel *lblStatus;
@property(nonatomic, strong) IBOutlet UILabel *lblLocation;
@property(nonatomic, strong) IBOutlet UIButton *btnHome;

@end

@implementation NewAccountViewController
@synthesize lblFirstName = _lblFirstName;
@synthesize fbProfilePic = _fbProfilePic;
@synthesize loggedInUser = _loggedInUser;
@synthesize lblStatus = _lblStatus;
@synthesize lblLocation = _lblLocation;
@synthesize btnHome = _btnHome;

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
    FBLoginView *loginview = [[FBLoginView alloc] init];
    
    loginview.readPermissions = @[@"email", @"user_likes"];
    loginview.publishPermissions = @[@"publish_actions"];
    loginview.defaultAudience = FBSessionDefaultAudienceFriends;
    			
    loginview.frame = CGRectOffset(loginview.frame, 5, 5);
    loginview.delegate = self;
    
    [self.view addSubview:loginview];
    
    [loginview sizeToFit];
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

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user{
    /*self.lblFirstName.text = [NSString stringWithFormat:@"Hello %@", user.first_name];
    self.fbProfilePic.profileID = user.id;
    self.loggedInUser = user;
    self.lblLocation.text = user.location.name;*/
    
    
    
    xurfaceAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    [delegate rootViewControllerByNavigationController];
}
-(void)loginViewShowingLoggedInUser:(FBLoginView *)loginView{
    self.lblStatus.text = @"login";
}

-(void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView{
    self.fbProfilePic.profileID = nil;
    self.lblFirstName.text = @"";
    self.lblStatus.text = @"logout";
    self.lblLocation.text = @"";
}

-(void) loginView:(FBLoginView *)loginView handleError:(NSError *)error{
    NSLog(@"Error %@", error);
}

#pragma mark - end FBLoginViewDelegate

#pragma mark - UITextFieldDelegate





-(IBAction)dismissRegister:(id)sender{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
    
    
}


@end
