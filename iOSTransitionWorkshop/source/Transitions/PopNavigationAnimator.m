//
//  PopNavigationAnimator.m
//  iOSTransitionWorkshop
//
//  Created by Nick on 3/12/15.
//  Copyright © 2015 Nick Babkin. All rights reserved.
//

#import "PopNavigationAnimator.h"
#import "ViewController.h"
#import "PushViewController.h"

@implementation PopNavigationAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    PushViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    ViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:toVC.view];
    toVC.imageView.alpha = 0.0f;
    
    UIImageView *tmpImageView = [[UIImageView alloc] initWithImage:fromVC.image];
    tmpImageView.contentMode = UIViewContentModeScaleAspectFill;
    tmpImageView.frame = fromVC.imageView.frame;
    [containerView addSubview:tmpImageView];

    void (^animation)() = ^() {
        tmpImageView.frame = toVC.imageView.frame;
    };
    
    if (self.interactive) {
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                         animations:animation
                         completion:^(BOOL finished) {
                             BOOL completed = ![transitionContext transitionWasCancelled];
                             
                             if (completed) {
                                 [fromVC.view removeFromSuperview];
                                 toVC.imageView.alpha = 1.0f;
                             } else {
                                 [toVC.view removeFromSuperview];
                             }
                             
                             [tmpImageView removeFromSuperview];
                             [transitionContext completeTransition:completed];
                             
                             self.interactive = NO;
                         }];
    } else {
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                              delay:0
             usingSpringWithDamping:0.6
              initialSpringVelocity:2.0
                            options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState
                         animations:animation
                         completion:^(BOOL finished) {
                             [fromVC.view removeFromSuperview];
                             toVC.imageView.alpha = 1.0f;
                             [tmpImageView removeFromSuperview];
                             [transitionContext completeTransition:YES];
                         }];
    }    
}

@end
