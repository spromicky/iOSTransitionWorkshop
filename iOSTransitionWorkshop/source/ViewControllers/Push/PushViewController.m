//
//  PushViewController.m
//  iOSTransitionWorkshop
//
//  Created by Nick on 3/12/15.
//  Copyright © 2015 Nick Babkin. All rights reserved.
//

#import "PushViewController.h"

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _popAnimator = [[PopNavigationAnimator alloc] init];
    self.imageView.image = self.image;
}

- (void)hadlePinch:(UIPinchGestureRecognizer *)sender
{
    CGFloat scale = sender.scale;
    CGFloat velocity = sender.velocity;
    
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
        {
            _popAnimator.interactive = YES;
            [self.navigationController popViewControllerAnimated:YES];
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            CGFloat percentComplete = 1.0 - scale;
            [_popAnimator updateInteractiveTransition:percentComplete];
            break;
        }
        case UIGestureRecognizerStateEnded:
        {
            CGFloat scaleInOneTenthSecond = scale + 0.1 * velocity;
            if (scaleInOneTenthSecond <= 0.5) {
                [_popAnimator finishInteractiveTransition];
            }
            else {
                [_popAnimator cancelInteractiveTransition];
            }
            break;
        }
        case UIGestureRecognizerStateCancelled:
        {
            [_popAnimator cancelInteractiveTransition];
            break;
        }
        default:
            break;
    }
}

@end
