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

#pragma mark - Private methods

#pragma mark -UIViewController

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
    
    NSLog(@"Date without time: %@\n", [NSDate dateWithoutTime:nil]);
    
    NSDate *currentDate = [NSDate date];
    NSDate *otherDate = [NSDate dateWithTimeIntervalSinceNow:1000];
    NSLog(@"Date %@ is equeal to date %@ ignoring time: %@\n", currentDateUTC, otherDate, [currentDate isEqualToDateIgnoringTime:otherDate] ? @"YES" : @"NO");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end