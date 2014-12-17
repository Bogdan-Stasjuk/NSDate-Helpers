//
//  NSDate+Helpers.h
//
//  Created by Bogdan Stasjuk on 4/7/14.
//
//

typedef NS_ENUM(UInt8, NSDateTimeZone) {
  NSDateTimeZoneUTC,
  NSDateTimeZoneGMT,
};

typedef NS_ENUM(UInt8, NSDateFormat) {
  NSDateFormatHm24,
  NSDateFormatHms24,
  NSDateFormatDmy4,
  NSDateFormatDmy4Hm24,
};


static NSUInteger const BSMinute    = 60;
static NSUInteger const BSHour      = 3600;
static NSUInteger const BSDay       = 86400;
static NSUInteger const BSWeek      = 604800;
static NSUInteger const BSYear      = 31556926;


@interface NSDate (Helpers)

+ (NSDictionary *)timeZoneAbbreviations;
+ (NSTimeZone *)timeZone:(NSDateTimeZone)timeZone;
+ (NSDateFormatter *)dateFormatterWithFormat:(NSDateFormat)format andTimeZone:(NSDateTimeZone)dateTimeZone;

+ (NSString *)stringFromDate:(NSDate *)date withFormatString:(NSString *)formatString andTimeZone:(NSDateTimeZone)timeZone;
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSDateFormat)format andTimeZone:(NSDateTimeZone)timeZone;
+ (NSDate *)dateFromString:(NSString *)string withFormatString:(NSString *)formatString andTimeZone:(NSDateTimeZone)dateTimeZone;
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSDateFormat)format andTimeZone:(NSDateTimeZone)dateTimeZone;

+ (NSDate *)dateWithoutTime:(NSDate *)dateTime;
+ (NSDate *)nowPlusDays:(NSUInteger)day;

- (BOOL)isEqualToDateIgnoringTime:(NSDate *)otherDate;

@end
