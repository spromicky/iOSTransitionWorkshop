//
//  PresentSegue.m
//  iOSTransitionWorkshop
//
//  Created by Nick on 11/12/15.
//  Copyright © 2015 Nick Babkin. All rights reserved.
//

#import "PresentSegue.h"
#import "ModalTransitionAnimator.h"
#import "PresentationController.h"

@implementation PresentSegue

- (void)perform
{
    self.destinationViewController.transitioningDelegate = self;
    [super perform];
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return [[PresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                   presentingController:(UIViewController *)presenting
                                                                       sourceController:(UIViewController *)source
{
    return [[ModalTransitionAnimator alloc] initWithReverse:NO];
}


- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[ModalTransitionAnimator alloc] initWithReverse:YES];
}

@end
