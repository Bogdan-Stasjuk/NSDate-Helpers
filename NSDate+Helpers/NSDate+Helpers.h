//
//  NSDate+Helpers.h
//  ETL
//
//  Created by Bogdan Stasjuk on 4/7/14.
//
//

typedef NS_ENUM(NSUInteger, NSDateTimeZone)
{
    NSDateTimeZoneUTC,
    NSDateTimeZoneGMT,
};

typedef NS_ENUM(NSUInteger, NSDateFormat)
{
    NSDateFormatHm24,
    NSDateFormatDmy4,
    NSDateFormatDmy4Hm24,
};


@interface NSDate (Helpers)

+ (NSDictionary *)timeZoneAbbreviations;

+ (NSString *)getStringFromDate:(NSDate *)date withFormat:(NSDateFormat)format andTimeZone:(NSDateTimeZone)timeZone;

@end
