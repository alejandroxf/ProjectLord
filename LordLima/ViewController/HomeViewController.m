//
//  HomeViewController.m
//  LordLima
//
//  Created by mac developer on 7/16/13.
//  Copyright (c) 2013 Alejandro Mayta. All rights reserved.
//

#import "HomeViewController.h"
#import "RouteViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

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
    
    [self createMenuBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)showRoute:(id)sender{
    UIViewController *currentVC = [[RouteViewController alloc]  initWithNibName:@"RouteViewController"
                                                                         bundle:nil];
    
    [self.navigationController pushViewController:currentVC
                                         animated:YES];
}

-(void)createMenuBar{
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(changeTitle)];
    
    [self.navigationItem setRightBarButtonItem:barButton];
    barButton = nil;
}
-(void)viewWillAppear:(BOOL)animated{
    [self setTitle:@"Home"];
}
-(void)changeTitle{
    [self setTitle:@"Cool!!!"];
}

@end
