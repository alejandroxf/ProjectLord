//
//  RouteViewController.h
//  LordLima
//
//  Created by mac developer on 7/16/13.
//  Copyright (c) 2013 Alejandro Mayta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


#define NibCell @"NibAudioCell"
#define NibCellIdentifier @"cvAudioCellIdentifier"

@interface RouteViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>


@property(nonatomic, weak) IBOutlet UITableView *tableViewPlace;
 
-(IBAction)showMap:(id)sender;

@end
