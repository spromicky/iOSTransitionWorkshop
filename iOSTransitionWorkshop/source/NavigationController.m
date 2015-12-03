//
//  NavigationController.m
//  iOSTransitionWorkshop
//
//  Created by Nick on 3/12/15.
//  Copyright © 2015 Nick Babkin. All rights reserved.
//

#import "NavigationController.h"
#import "PopNavigationAnimator.h"
#import "PushViewController.h"

@interface NavigationController ()

@property (nonatomic, weak) PopNavigationAnimator *transition;

@end

@implementation NavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.delegate = self;
    [self.interactivePopGestureRecognizer addTarget:self action:@selector(handleGesture:)];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    self.transition = (PopNavigationAnimator *)((PushViewController *)self.viewControllers.lastObject).popAnimator;
    self.transition.interactive = YES;
    return YES;
}

- (void)handleGesture:(UIScreenEdgePanGestureRecognizer *)sender
{
    CGFloat x = [sender locationInView:self.view].x;
    CGFloat velocity = [sender velocityInView:self.view].x;
    
    switch (sender.state) {
        case UIGestureRecognizerStateChanged:
            [self.transition updateInteractiveTransition:x / self.view.frame.size.width];
            break;
        case UIGestureRecognizerStateEnded:
            if ((1.0f - x / self.view.frame.size.width) + 0.1f * velocity > 0.5f) {
                [self.transition finishInteractiveTransition];
            } else {
                [self.transition cancelInteractiveTransition];
            }
            break;
        case UIGestureRecognizerStateCancelled:
            [self.transition cancelInteractiveTransition];
            break;
            
        default:
            break;
    }
}

@end
