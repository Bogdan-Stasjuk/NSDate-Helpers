//
//  NSDateHelpersUsingViewController.h
//  NSDate-Helpers
//
//  Created by Bogdan Stasjuk on 4/8/14.
//  Copyright (c) 2014 Bogdan Stasjuk. All rights reserved.
//

@interface NSDateHelpersUsingViewController : UIViewController

#pragma mark - Unavailable methods

#pragma mark -UIViewController

- (id)init __attribute__((unavailable));
- (id)initWithCoder:(NSCoder *)aDecoder __attribute__((unavailable));
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil __attribute__((unavailable));

@end
