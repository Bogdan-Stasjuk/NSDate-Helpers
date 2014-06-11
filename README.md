NSDate-Helpers
==============

Category on NSDate that includes useful methods for work with date and time.

There are __ENUMs for TimeZone and DateFormat__:

```objc
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
```

##Static methods

```objc
+ (NSDictionary *)timeZoneAbbreviations;
+ (NSTimeZone *)timeZone:(NSDateTimeZone)timeZone;
+ (NSDateFormatter *)dateFormatterWithFormat:(NSDateFormat)format andTimeZone:(NSDateTimeZone)dateTimeZone;

+ (NSString *)getStringFromDate:(NSDate *)date withFormat:(NSDateFormat)format andTimeZone:(NSDateTimeZone)timeZone;
+ (NSDate *)getDateFromString:(NSString *)string withFormat:(NSDateFormat)format andTimeZone:(NSDateTimeZone)dateTimeZone;

+ (NSDate *)dateWithoutTime:(NSDate *)dateTime;
+ (NSDate *)nowPlusDays:(NSUInteger)day;
```

##Nonstatic methods

```objc
- (BOOL)isEqualToDateIgnoringTime:(NSDate *)otherDate;
```

Demo
====

Clone project and run it. You can find examples of usage at `NSDateHelpersUsingViewController.m`.


Compatibility
=============

This class has been tested back to iOS 6.0.


Installation
============

__Cocoapods__: `pod 'NSDate+Helpers'`<br />
__Manual__: Copy the __NSDate+Helpers__ folder in your project<br />

Import header in your project. .pch is a good place ;)

    #import "NSDate+Helpers.h"

License
=======

This code is released under the MIT License. See the LICENSE file for
details.
