//
//  RouteViewController.m
//  LordLima
//
//  Created by mac developer on 7/16/13.
//  Copyright (c) 2013 Alejandro Mayta. All rights reserved.
//

#import "RouteViewController.h"
#import "PlaceViewController.h"

@interface RouteViewController ()

@end

@implementation RouteViewController
@synthesize tableViewPlace = _tableViewPlace;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)showPlace:(id)sender;{
    UIViewController *currentVC = [[PlaceViewController alloc] initWithNibName:@"PlaceViewController"
                                                                        bundle:nil];
    
    [self.navigationController pushViewController:currentVC animated:YES];
}

-(void) viewDidAppear:(BOOL)animated{
    [self setTitle:@"Route"];
}

-(IBAction)showMap:(id)sender{
    
}


#pragma mark - UITableDataSource

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 7;
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"";
}
/*
-(NSInteger) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return @"";
}
*/

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}


#pragma mark - UITableViewDelegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}




@end
