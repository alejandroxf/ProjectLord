//
//  HomeViewController.h
//  LordLima
//
//  Created by mac developer on 7/16/13.
//  Copyright (c) 2013 Alejandro Mayta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

@property(nonatomic, weak) IBOutlet UICollectionView *collectionRoutes;
-(IBAction)showRoute:(id)sender;
@end
