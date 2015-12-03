//
//  PushViewController.h
//  iOSTransitionWorkshop
//
//  Created by Nick on 3/12/15.
//  Copyright © 2015 Nick Babkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopNavigationAnimator.h"

@interface PushViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) UIImage *image;

@property (nonatomic, readonly) PopNavigationAnimator *popAnimator;

- (IBAction)hadlePinch:(UIPinchGestureRecognizer *)sender;

@end
