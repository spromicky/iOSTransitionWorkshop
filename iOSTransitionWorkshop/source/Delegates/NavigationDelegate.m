//
//  NavigationDelegate.m
//  iOSTransitionWorkshop
//
//  Created by Nick on 3/12/15.
//  Copyright © 2015 Nick Babkin. All rights reserved.
//

#import "NavigationDelegate.h"
#import "PushNavigationAnimator.h"
#import "PopNavigationAnimator.h"
#import "PushViewController.h"

@implementation NavigationDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        return [[PushNavigationAnimator alloc] init];
    } else {
        return ((PushViewController *)fromVC).popAnimator;
    } 
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                         interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    if ([animationController isKindOfClass:[PopNavigationAnimator class]] && ((PopNavigationAnimator*)animationController).interactive) {
        return (PopNavigationAnimator*)animationController;
    }
    return nil;
}

@end
