//
//  NSDate+Helpers.m
//  ETL
//
//  Created by Bogdan Stasjuk on 4/7/14.
//
//

#import "NSDate+Helpers.h"


#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#define EmptyString @""


@implementation NSDate (Helpers)

#pragma mark - Static methods

#pragma mark -public

+ (NSDictionary *)timeZoneAbbreviations
{
    return [NSTimeZone abbreviationDictionary];
}

+ (NSString *)getStringFromDate:(NSDate *)date withFormat:(NSDateFormat)format andTimeZone:(NSDateTimeZone)dateTimeZone
{
    NSDateFormatter *dateFormatter = [self dateFormatterWithFormat:format andTimeZone:dateTimeZone];
    NSString *dateStr = [dateFormatter stringFromDate:date];
    
    return dateStr;
}

+ (NSDate *)getDateFromString:(NSString *)string withFormat:(NSDateFormat)format andTimeZone:(NSDateTimeZone)dateTimeZone
{
    NSDateFormatter *dateFormatter = [self dateFormatterWithFormat:format andTimeZone:dateTimeZone];
    NSDate *date = [dateFormatter dateFromString:string];
    if (!date)
    {
        ALog("can not parse the string \"%@\"", string);
    }
    
    return date;
}

#pragma mark -private

+ (NSDateFormatter *)dateFormatterWithFormat:(NSDateFormat)format andTimeZone:(NSDateTimeZone)dateTimeZone
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    
    NSString *timeZoneAbbr = [self timeZoneAbbr:dateTimeZone];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithAbbreviation:timeZoneAbbr];
    [formatter setTimeZone:timeZone];
    
    NSString *dateFormatStr = [self dateFormatString:format];
    [formatter setDateFormat:dateFormatStr];

    return formatter;
}

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