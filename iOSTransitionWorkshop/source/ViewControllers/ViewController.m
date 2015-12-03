//
//  ViewController.m
//  iOSTransitionWorkshop
//
//  Created by Nick on 3/12/15.
//  Copyright © 2015 Nick Babkin. All rights reserved.
//

#import "ViewController.h"
#import "PushViewController.h"
#import "NavigationDelegate.h"

@interface ViewController ()

@property (nonatomic, strong) NavigationDelegate *navDelegate;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navDelegate = [[NavigationDelegate alloc] init];
    self.navigationController.delegate = self.navDelegate;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PushViewController *vc = (PushViewController*)segue.destinationViewController;
    vc.image = self.imageView.image;
}

@end
