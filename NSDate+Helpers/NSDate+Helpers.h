//
//  NSDate+Helpers.h
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
+ (NSTimeZone *)timeZone:(NSDateTimeZone)timeZone;
+ (NSDateFormatter *)dateFormatterWithFormat:(NSDateFormat)format andTimeZone:(NSDateTimeZone)dateTimeZone;

+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSDateFormat)format andTimeZone:(NSDateTimeZone)timeZone;
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSDateFormat)format andTimeZone:(NSDateTimeZone)dateTimeZone;

+ (NSDate *)dateWithoutTime:(NSDate *)dateTime;
+ (NSDate *)nowPlusDays:(NSUInteger)day;

- (BOOL)isEqualToDateIgnoringTime:(NSDate *)otherDate;

@end
