//
//  xurfaceViewController.m
//  LordLima
//
//  Created by Alejandro Mayta on 13/07/13.
//  Copyright (c) 2013 Alejandro Mayta. All rights reserved.
//

#import "xurfaceViewController.h"
#import "xurfaceAppDelegate.h"
#import "ALScrollViewPaging.h"

@interface xurfaceViewController ()

@end

@implementation xurfaceViewController
@synthesize btnIniciarSesion = _btnIniciarSesion;
@synthesize btnRegistrar = _btnRegistrar;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self createSlider]; 
    [self loadButtons];
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

-(void)createSlider{
    
    ALScrollViewPaging *scrollingView = [[ALScrollViewPaging alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    
    [scrollingView setBottomPageControl:100];
    
    NSMutableArray *views = [[NSMutableArray alloc] init];

    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"001_Init_img1"]];
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"001_Init_img2"]];
    UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"001_Init_img3"]];
    [views addObject:imageView1];
    [views addObject:imageView3];
    [views addObject:imageView2];
    
    //add pages to scrollview
    [scrollingView addPages:views];
    
    //add scrollview to the views
    [self.view addSubview:scrollingView];
    
    [scrollingView setHasPageControl:YES];
    
    
    
}

-(void) loadButtons{
    
    [self.view addSubview:self.btnRegistrar];
    [self.btnRegistrar setFrame:CGRectMake(11, 410, 90, 43)];
    
    [self.view addSubview:self.btnIniciarSesion];
    [self.btnIniciarSesion setFrame:CGRectMake(184, 410, 122, 43)];
    
    
    
}

@end
