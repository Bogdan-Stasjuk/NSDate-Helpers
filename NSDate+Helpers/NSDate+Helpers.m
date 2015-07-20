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

+ (NSDictionary *)timeZoneAbbreviations {
  return [NSTimeZone abbreviationDictionary];
}

+ (NSTimeZone *)timeZone:(NSDateTimeZone)timeZone {
  NSString *timeZoneAbbr = [self timeZoneAbbr:timeZone];
  return [NSTimeZone timeZoneWithAbbreviation:timeZoneAbbr];
}

+ (NSDateFormatter *)dateFormatterWithFormat:(NSDateFormat)format andTimeZone:(NSDateTimeZone)dateTimeZone {
  return [self dateFormatterWithFormatString:[self dateFormatString:format] andTimeZone:dateTimeZone];
}

+ (NSString *)stringFromDate:(NSDate *)date withFormatString:(NSString *)formatString andTimeZone:(NSDateTimeZone)dateTimeZone {
  NSDateFormatter *dateFormatter = [self dateFormatterWithFormatString:formatString andTimeZone:dateTimeZone];
  return [dateFormatter stringFromDate:date];
}

+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSDateFormat)format andTimeZone:(NSDateTimeZone)dateTimeZone {
  NSDateFormatter *dateFormatter = [self dateFormatterWithFormat:format andTimeZone:dateTimeZone];
  return [dateFormatter stringFromDate:date];
}

+ (NSDate *)dateFromString:(NSString *)string withFormatString:(NSString *)formatString andTimeZone:(NSDateTimeZone)dateTimeZone {
  NSDateFormatter *dateFormatter = [self dateFormatterWithFormatString:formatString andTimeZone:dateTimeZone];
  NSDate *date = [dateFormatter dateFromString:string];
#ifdef DEBUG_NSDATE
  if (!date) {
    ALog("can not parse the string \"%@\"", string);
  }
#endif
  return date;
}

+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSDateFormat)format andTimeZone:(NSDateTimeZone)dateTimeZone {
  return [self dateFromString:string withFormatString:[self dateFormatString:format] andTimeZone:dateTimeZone];
}

+ (NSDate *)dateWithoutTime:(NSDate *)dateTime {
  if(!dateTime) {
    dateTime = [NSDate date];
  }
  NSCalendar       *calendar   = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  [calendar setTimeZone:[self timeZone:NSDateTimeZoneUTC]];
  NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:dateTime];
  
  NSDate *dateOnly = [calendar dateFromComponents:components];
  
  return dateOnly;
}

+ (NSDate *)nowPlusDays:(NSUInteger)day {
  NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + day * DAY_IN_SEC;
  return [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
}

#pragma mark -Nonstatic

- (BOOL)isEqualToDateIgnoringTime:(NSDate *)otherDate {
  NSDate *dateWithoutTime = [[self class] dateWithoutTime:self];
  NSDate *otherDateWithoutTime = [[self class] dateWithoutTime:otherDate];
  
  return dateWithoutTime.timeIntervalSince1970 == otherDateWithoutTime.timeIntervalSince1970;
}


#pragma mark - Private methods

#pragma mark -Static

+ (NSString *)timeZoneAbbr:(NSDateTimeZone)timeZone {
  switch (timeZone) {
    case NSDateTimeZoneUTC:
      return @"UTC";
    case NSDateTimeZoneGMT:
      return @"GMT";
  }
#ifdef DEBUG
  ALog("There is no timeZone string for NSDateTimeZone enum's value %d. Please add the missing record.", timeZone);
#endif
  return EmptyString;
}

+ (NSString *)dateFormatString:(NSDateFormat)dateFormat {
  switch (dateFormat) {
    case NSDateFormatHms24:
      return @"HH:mm:ss";
    case NSDateFormatHm24:
      return @"HH:mm";
    case NSDateFormatDmy4:
      return @"dd/MM/yyyy";
    case NSDateFormatDmy4Hm24:
      return @"dd/MM/yyyy HH:mm";
  }
#ifdef DEBUG
  ALog("There is no dateFormat string for NSDateFormat enum's value %d. Please add the missing record.", dateFormat);
#endif
  return EmptyString;
}

+ (NSDateFormatter *)dateFormatterWithFormatString:(NSString *)formatString andTimeZone:(NSDateTimeZone)dateTimeZone {
  NSDateFormatter *formatter = [NSDateFormatter new];
  [formatter setTimeZone:[self timeZone:dateTimeZone]];
  [formatter setDateFormat:formatString];
  
  return formatter;
}

@end
