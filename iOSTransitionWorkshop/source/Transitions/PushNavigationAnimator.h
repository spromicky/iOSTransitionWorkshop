//
//  PushNavigationAnimator.h
//  iOSTransitionWorkshop
//
//  Created by Nick on 3/12/15.
//  Copyright © 2015 Nick Babkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PushNavigationAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, readonly) BOOL reverse;

- (instancetype)initWithReverse:(BOOL)reverse;

@end
