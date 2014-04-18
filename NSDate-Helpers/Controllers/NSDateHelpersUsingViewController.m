//
//  NSDateHelpersUsingViewController.m
//  NSDate-Helpers
//
//  Created by Bogdan Stasjuk on 4/8/14.
//  Copyright (c) 2014 Bogdan Stasjuk. All rights reserved.
//

#import "NSDateHelpersUsingViewController.h"

#import "NSDate+Helpers.h"


@interface NSDateHelpersUsingViewController ()

@end


@implementation NSDateHelpersUsingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"%@", [NSDate timeZoneAbbreviations]);

    NSString *currentDateTimeGMT = [NSDate getStringFromDate:[NSDate date] withFormat:NSDateFormatDmy4Hm24 andTimeZone:NSDateTimeZoneGMT];
    NSLog(@"Current date and time GMT %@\n", currentDateTimeGMT);

    NSString *currentDateTimeUTC = [NSDate getStringFromDate:[NSDate date] withFormat:NSDateFormatDmy4Hm24 andTimeZone:NSDateTimeZoneUTC];
    NSLog(@"Current date and time UTC %@\n", currentDateTimeUTC);
    
    NSString *currentDateUTC = [NSDate getStringFromDate:[NSDate date] withFormat:NSDateFormatDmy4 andTimeZone:NSDateTimeZoneUTC];
    NSLog(@"Current date %@\n", currentDateUTC);
    
    NSDate *date = [NSDate getDateFromString:currentDateTimeUTC withFormat:NSDateFormatDmy4Hm24 andTimeZone:NSDateTimeZoneGMT];
    NSLog(@"Date from string %@\n", date);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
