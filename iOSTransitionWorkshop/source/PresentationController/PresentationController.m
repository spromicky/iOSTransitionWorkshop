//
//  PresentationController.m
//  iOSTransitionWorkshop
//
//  Created by Nick on 3/12/15.
//  Copyright © 2015 Nick Babkin. All rights reserved.
//

#import "PresentationController.h"

@interface PresentationController ()

@property (nonatomic, strong) UIView *dimmingView;

@end

@implementation PresentationController

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController
{
    self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
    if (self) {
        self.dimmingView = [[UIView alloc] init];
        self.dimmingView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.4f];
        [self.dimmingView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture)]];
    }
    return self;
}

- (CGRect)frameOfPresentedViewInContainerView
{
    CGRect containerBounds = [[self containerView] bounds];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return CGRectMake(2.f * containerBounds.size.width / 3.f, containerBounds.origin.y, containerBounds.size.width / 3.f, containerBounds.size.height);
    } else {
        return CGRectMake(containerBounds.origin.x, 2.f * containerBounds.size.height / 3.f, containerBounds.size.width, containerBounds.size.height / 3.f);
    }
    
}

- (void)presentationTransitionWillBegin
{
    [super presentationTransitionWillBegin];
    
    [[self containerView] insertSubview:self.dimmingView atIndex:0];
    self.dimmingView.alpha = 0.f;
    
    [[[self presentedViewController] transitionCoordinator] animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        [self.dimmingView setAlpha:1.f];
    } completion:nil];
}

- (void)containerViewWillLayoutSubviews
{
    [[self presentedView] setFrame:[self frameOfPresentedViewInContainerView]];
    [self.dimmingView setFrame:[[self containerView] bounds]];
}

- (void)dismissalTransitionWillBegin
{
    [super dismissalTransitionWillBegin];
    
    [[[self presentedViewController] transitionCoordinator] animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        [self.dimmingView setAlpha:0.f];
    } completion:nil];
}

- (void)tapGesture
{
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}


@end
