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



@interface HomeViewController () <UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>


@end

@implementation HomeViewController
@synthesize scrollView = _scrollView;
@synthesize collectionRoutes = _collectionRoutes;


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
    
    /*UICollectionViewFlowLayout *flowLayout  = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(200, 200)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    [self.collectionRoutes setCollectionViewLayout:flowLayout];*/
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
    [self.scrollView addSubview:scrollingView];
    //[self.view addSubview:scrollingView];
    
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

-(void) loadCollectionView{
    //[self.collectionRoutes registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"HomeViewControllerCell"];
    UINib *cellNib = [UINib nibWithNibName:@"NibCell" bundle:nil];
    [self.collectionRoutes registerNib:cellNib forCellWithReuseIdentifier:@"cvCell"];
    
}


#pragma mark - UICollectionView Datasource
//1
-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 2;
}
//2
-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 10;
}
//3
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"cvCell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier
                                                                           forIndexPath:indexPath];
    
    UILabel *lblTitle = (UILabel*)[cell viewWithTag:100];
    
    [lblTitle setText:@"Esto es !!"];
    
    return cell;
}

//4
/*
-(UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    return [[UICollectionReusableView alloc] init];
}
*/

#pragma mark - UICollectionViewDelegate
-(void) collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *currentVC = [[RouteViewController alloc]  initWithNibName:@"RouteViewController"
                                                                         bundle:nil];
    
    
    [self.navigationController pushViewController:currentVC
                                         animated:YES];
}



#pragma mark - UICollectionViewDelegateFlowLayout
//1
-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(145, 145);
}

//2
-(UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}



@end
