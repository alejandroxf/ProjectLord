//
//  HomeViewController.m
//  LordLima
//
//  Created by mac developer on 7/16/13.
//  Copyright (c) 2013 Alejandro Mayta. All rights reserved.
//

#import "HomeViewController.h"
#import "RouteViewController.h" 
#import "ALScrollViewPaging.h"
#import "HomeViewControllerCell.h"



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
    [self createSlider];
    
    [self loadCollectionView];
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

-(void)createSlider{
    ALScrollViewPaging *scrollingView = [[ALScrollViewPaging alloc] initWithFrame:CGRectMake(0, 0, 320, 180)];
    
    NSMutableArray *views = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 5; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shovel"]];
        [views addObject:imageView];
    }
    
    //add pages to scrollview
    [scrollingView addPages:views];
    
    //add scrollview to the views
    [self.view addSubview:scrollingView];
    
    [scrollingView setHasPageControl:NO];
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

#pragma UICollectionViewDelegate



-(void) loadCollectionView{
    /*[self.collectionRoutes registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"HomeViewControllerCell"];*/
}



@end
