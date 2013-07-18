//
//  xurfaceViewController.h
//  LordLima
//
//  Created by Alejandro Mayta on 13/07/13.
//  Copyright (c) 2013 Alejandro Mayta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface xurfaceViewController : UIViewController

@property(nonatomic, strong) IBOutlet UIButton *btnIniciarSesion;
@property(nonatomic, strong) IBOutlet UIButton *btnRegistrar;

-(IBAction)loadHomeViewController:(id)sender;
@end
