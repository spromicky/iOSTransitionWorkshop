//
//  ModalTransitionAnimator.h
//  iOSTransitionWorkshop
//
//  Created by Nick on 4/12/15.
//  Copyright © 2015 Nick Babkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModalTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>

- (instancetype)initWithReverse:(BOOL)reverse;

@end
