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

- (instancetype)initWithReverse:(BOOL)reverse
{
    self = [super init];
    if (self) {
        _reverse = reverse;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    ViewController *vc = (ViewController*)(self.reverse ? toVC : fromVC);
    PushViewController *pushVC = (PushViewController*)(self.reverse ? fromVC : toVC);
    
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:toVC.view];
    
    [toVC.view setFrame:[transitionContext finalFrameForViewController:toVC]];
    [toVC.view layoutIfNeeded];
    
    if (self.reverse) {
        [fromVC.view removeFromSuperview];
        vc.imageView.alpha = 0.0f;
    } else {
        toVC.view.alpha = 0.0f;
    }
    

    UIImageView *tmpImageView = [[UIImageView alloc] initWithImage:pushVC.image];
    tmpImageView.contentMode = UIViewContentModeScaleAspectFill;
    tmpImageView.frame = self.reverse ? pushVC.imageView.frame : vc.imageView.frame;
    [containerView addSubview:tmpImageView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:2.0
                        options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         tmpImageView.frame = self.reverse ? vc.imageView.frame : pushVC.imageView.frame;
                     }
                     completion:^(BOOL finished){
                         
                         if (self.reverse) {
                             [fromVC.view removeFromSuperview];
                             vc.imageView.alpha = 1.0f;
                         } else {
                             toVC.view.alpha = 1.0f;
                         }
                         
                         [tmpImageView removeFromSuperview];
                         [transitionContext completeTransition:YES];
                     }];

}

@end
