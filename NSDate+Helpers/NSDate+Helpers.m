//
//  NSDate+Helpers.m
//
//  Created by Bogdan Stasjuk on 4/7/14.
//
//

#import "NSDate+Helpers.h"


#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#define EmptyString @""

#define DAY_IN_SEC 86400


@implementation NSDate (Helpers)

#pragma mark - Public methods

#pragma mark -Static

+ (NSDictionary *)timeZoneAbbreviations
{
    return [NSTimeZone abbreviationDictionary];
}

+ (NSTimeZone *)timeZone:(NSDateTimeZone)timeZone
{
    NSString *timeZoneAbbr = [self timeZoneAbbr:timeZone];
    return [NSTimeZone timeZoneWithAbbreviation:timeZoneAbbr];
}

+ (NSDateFormatter *)dateFormatterWithFormat:(NSDateFormat)format andTimeZone:(NSDateTimeZone)dateTimeZone
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setTimeZone:[self timeZone:dateTimeZone]];
    NSString *dateFormatStr = [self dateFormatString:format];
    [formatter setDateFormat:dateFormatStr];
    
    return formatter;
}

+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSDateFormat)format andTimeZone:(NSDateTimeZone)dateTimeZone
{
    NSDateFormatter *dateFormatter = [self dateFormatterWithFormat:format andTimeZone:dateTimeZone];
    NSString *dateStr = [dateFormatter stringFromDate:date];
    
    return dateStr;
}

+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSDateFormat)format andTimeZone:(NSDateTimeZone)dateTimeZone
{
    NSDateFormatter *dateFormatter = [self dateFormatterWithFormat:format andTimeZone:dateTimeZone];
    NSDate *date = [dateFormatter dateFromString:string];
#ifdef DEBUG_NSDATE
    if (!date)
        ALog("can not parse the string \"%@\"", string);
#endif
    return date;
}

+ (NSDate *)dateWithoutTime:(NSDate *)dateTime
{
    if(!dateTime)
        dateTime = [NSDate date];
    
    NSCalendar       *calendar   = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [calendar setTimeZone:[self timeZone:NSDateTimeZoneUTC]];
    NSDateComponents *components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:dateTime];
    
    NSDate *dateOnly = [calendar dateFromComponents:components];
    
    return dateOnly;
}

+ (NSDate *)nowPlusDays:(NSUInteger)day
{
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + day * DAY_IN_SEC;
    return [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
}

#pragma mark -Nonstatic

- (BOOL)isEqualToDateIgnoringTime:(NSDate *)otherDate
{
    NSDate *dateWithoutTime = [[self class] dateWithoutTime:self];
    NSDate *otherDateWithoutTime = [[self class] dateWithoutTime:otherDate];
    
    return dateWithoutTime.timeIntervalSince1970 == otherDateWithoutTime.timeIntervalSince1970;
}


#pragma mark - Private methods

#pragma mark -Static

+ (NSString *)timeZoneAbbr:(NSDateTimeZone)timeZone
{
    NSString *timeZoneString = EmptyString;
    switch (timeZone)
    {
        case NSDateTimeZoneUTC:
            timeZoneString = @"UTC";
            break;
        case NSDateTimeZoneGMT:
            timeZoneString = @"GMT";
            break;
        default:
            ALog("There is no such timeZone in NSDateTimeZone enum. Please add the missing record.");
            break;
    }
    return timeZoneString;
}

+ (NSString *)dateFormatString:(NSDateFormat)dateFormat
{
    NSString *dateFormatString = EmptyString;
    switch (dateFormat) {
        case NSDateFormatDmy4:
            dateFormatString = @"dd/MM/yyyy";
            break;
        case NSDateFormatDmy4Hm24:
            dateFormatString = @"dd/MM/yyyy HH:mm";
            break;
        case NSDateFormatHm24:
            dateFormatString = @"HH:mm";
            break;
        default:
            ALog("There is no such dateFormat in NSDateFormat enum. Please add the missing record.");
            break;
    }
    return dateFormatString;
}

@end