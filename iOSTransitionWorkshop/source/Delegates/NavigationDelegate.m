//
//  NavigationDelegate.m
//  iOSTransitionWorkshop
//
//  Created by Nick on 3/12/15.
//  Copyright © 2015 Nick Babkin. All rights reserved.
//

#import "NavigationDelegate.h"
#import "PushNavigationAnimator.h"

@implementation NavigationDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
    return [[PushNavigationAnimator alloc] initWithReverse:operation == UINavigationControllerOperationPop];
}

@end
