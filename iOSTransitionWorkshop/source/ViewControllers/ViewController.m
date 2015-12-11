//
//  ViewController.m
//  iOSTransitionWorkshop
//
//  Created by Nick on 3/12/15.
//  Copyright © 2015 Nick Babkin. All rights reserved.
//

#import "ViewController.h"

#import "NavigationDelegate.h"
#import "ViewControllerDelegate.h"

#import "PushViewController.h"
#import "PresentedViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NavigationDelegate *navDelegate;
@property (nonatomic, strong) ViewControllerDelegate *vcDelegate;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navDelegate = [[NavigationDelegate alloc] init];
    self.vcDelegate = [[ViewControllerDelegate alloc] init];
    
    self.navigationController.delegate = self.navDelegate;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"push"]) {
        PushViewController *vc = (PushViewController*)segue.destinationViewController;
        vc.image = self.imageView.image;
    } else if ([segue.identifier isEqualToString:@"present"]) {
        PresentedViewController *vc = (PresentedViewController*)segue.destinationViewController;
        vc.transitioningDelegate = self.vcDelegate;
    }
}

@end
