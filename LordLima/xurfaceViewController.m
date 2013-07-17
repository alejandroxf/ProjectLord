//
//  xurfaceViewController.m
//  LordLima
//
//  Created by Alejandro Mayta on 13/07/13.
//  Copyright (c) 2013 Alejandro Mayta. All rights reserved.
//

#import "xurfaceViewController.h"
#import "xurfaceAppDelegate.h"

@interface xurfaceViewController ()

@end

@implementation xurfaceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)loadHomeViewController:(id)sender{
    xurfaceAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    [delegate rootViewControllerByNavigationController];
}
@end
