//
//  ViewController.m
//  iOSTransitionWorkshop
//
//  Created by Nick on 3/12/15.
//  Copyright © 2015 Nick Babkin. All rights reserved.
//

#import "ViewController.h"
#import "PushViewController.h"

@implementation ViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PushViewController *vc = (PushViewController*)segue.destinationViewController;
    vc.image = self.imageView.image;
}

@end
