//
//  PushNavigationAnimator.m
//  iOSTransitionWorkshop
//
//  Created by Nick on 3/12/15.
//  Copyright © 2015 Nick Babkin. All rights reserved.
//

#import "PushNavigationAnimator.h"
#import "ViewController.h"
#import "PushViewController.h"

@implementation PushNavigationAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    ViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    PushViewController *toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:toVC.view];
    [toVC.view setFrame:[transitionContext finalFrameForViewController:toVC]];
    [toVC.view layoutIfNeeded];
    toVC.view.alpha = 0.0f;

    UIImageView *tmpImageView = [[UIImageView alloc] initWithImage:toVC.image];
    tmpImageView.contentMode = UIViewContentModeScaleAspectFill;
    tmpImageView.frame = fromVC.imageView.frame;
    [containerView addSubview:tmpImageView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:2.0
                        options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         tmpImageView.frame = toVC.imageView.frame;
                     }
                     completion:^(BOOL finished){
                         toVC.view.alpha = 1.0f;
                         [tmpImageView removeFromSuperview];
                         [fromVC.view removeFromSuperview];
                         [transitionContext completeTransition:YES];
                     }];

}

@end
