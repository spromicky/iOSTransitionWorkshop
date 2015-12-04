//
//  ModalTransitionAnimator.m
//  iOSTransitionWorkshop
//
//  Created by Nick on 4/12/15.
//  Copyright © 2015 Nick Babkin. All rights reserved.
//

#import "ModalTransitionAnimator.h"

@interface ModalTransitionAnimator ()

@property (nonatomic) BOOL reverse;

@end

@implementation ModalTransitionAnimator

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
    return 0.3f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *infoVC = _reverse ? [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey] : [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    [infoVC.view setFrame:[transitionContext finalFrameForViewController:infoVC]];
    [infoVC.view layoutIfNeeded];
    
    if (!_reverse) {
        [containerView addSubview:infoVC.view];
        
        CGRect newFrame = infoVC.view.frame;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            newFrame.origin.x += newFrame.size.width;
        } else {
            newFrame.origin.y += newFrame.size.height;
        }
        infoVC.view.frame = newFrame;
    }
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        CGRect newFrame = infoVC.view.frame;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            newFrame.origin.x += _reverse ? newFrame.size.width : -newFrame.size.width;
        } else {
            newFrame.origin.y += _reverse ? newFrame.size.height : -newFrame.size.height;
        }
        infoVC.view.frame = newFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

@end
