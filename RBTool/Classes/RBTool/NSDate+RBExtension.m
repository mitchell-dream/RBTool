//
//  NSDate+RBExtension.m
//  RBTool
//
//  Created by william on 16/10/13.
//  Copyright © 2016年 Roobo. All rights reserved.
//

#import "NSDate+RBExtension.h"

@implementation NSDate (RBExtension)
#pragma mark - 获取年月日
- (NSString *)getFormatYearMonthDay
{
    NSString *string = [NSString stringWithFormat:@"%lu%02lu%02lu",(unsigned long)[self getYear],(unsigned long)[self getMonth],(unsigned long)[self getDay]];
    return string;
}

#pragma mark - 获取该日期是该年的第几周
- (int )getWeekOfYear
{
    int i;
    int year = (int)[self getYear];
    NSDate *date = [self endOfWeek];
    for (i = 1;[[date dateAfterDay:-7 * i] getYear] == year;i++)
    {
    }
    return i;
}

#pragma mark - 返回day天后的日期(若day为负数,则为|day|天前的日期)
- (NSDate *)dateAfterDay:(int)day
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // Get the weekday component of the current date
    // NSDateComponents *weekdayComponents = [calendar components:NSCalendarUnitWeekday fromDate:self];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    // to get the end of week for a particular date, add (7 - weekday) days
    [componentsToAdd setDay:day];
    NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];
    
    return dateAfterDay;
}
#pragma mark - month 个月后的日期
- (NSDate *)dateafterMonth:(int)month
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setMonth:month];
    NSDate *dateAfterMonth = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];
    
    return dateAfterMonth;
}

#pragma mark - 获取日
- (NSUInteger)getDay{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitDay) fromDate:self];
    return [dayComponents day];
}

#pragma mark - 获取月
- (NSUInteger)getMonth
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMonth) fromDate:self];
    return [dayComponents month];
}

#pragma mark - 获取年
- (NSUInteger)getYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitYear) fromDate:self];
    return [dayComponents year];
}

#pragma mark - 获取小时
- (int )getHour {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags =NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitHour|NSCalendarUnitMinute;
    NSDateComponents *components = [calendar components:unitFlags fromDate:self];
    NSInteger hour = [components hour];
    return (int)hour;
}
- (int )getHour:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags =NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitHour|NSCalendarUnitMinute;
    NSDateComponents *components = [calendar components:unitFlags fromDate:date];
    NSInteger hour = [components hour];
    return (int)hour;
}

#pragma mark - 获取分钟
- (int)getMinute {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags =NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitHour|NSCalendarUnitMinute;
    NSDateComponents *components = [calendar components:unitFlags fromDate:self];
    NSInteger minute = [components minute];
    return (int)minute;
}

- (int)getMinute:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags =NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitHour|NSCalendarUnitMinute;
    NSDateComponents *components = [calendar components:unitFlags fromDate:date];
    NSInteger minute = [components minute];
    return (int)minute;
}

#pragma mark - 在当前日期前几天
- (NSUInteger)daysAgo {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitDay)
                                               fromDate:self
                                                 toDate:[NSDate date]
                                                options:0];
    return [components day];
}

#pragma mark - 午夜时间距今几天
- (NSUInteger)daysAgoAgainstMidnight {
    // get a midnight version of ourself:
    NSDateFormatter *mdf = [[NSDateFormatter alloc] init];
    [mdf setDateFormat:@"yyyy-MM-dd"];
    NSDate *midnight = [mdf dateFromString:[mdf stringFromDate:self]];
    
    return (int)[midnight timeIntervalSinceNow] / (60*60*24) *-1;
}

- (NSString *)stringDaysAgo {
    return [self stringDaysAgoAgainstMidnight:YES];
}

- (NSString *)stringDaysAgoAgainstMidnight:(BOOL)flag {
    NSUInteger daysAgo = (flag) ? [self daysAgoAgainstMidnight] : [self daysAgo];
    NSString *text = nil;
    switch (daysAgo) {
        case 0:
            text = @"Today";
            break;
        case 1:
            text = @"Yesterday";
            break;
        default:
            text = [NSString stringWithFormat:@"%lu days ago", (unsigned long)daysAgo];
    }
    return text;
}


#pragma mark - 返回一周的第几天（周末为第一天）
- (NSUInteger)weekday {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *weekdayComponents = [calendar components:(NSCalendarUnitWeekday) fromDate:self];
    return [weekdayComponents weekday];
}
#pragma mark ------------------- NSDate 与 NSString 时间相互转换 ------------------------


#pragma mark - NSString -> NSDate
+ (NSDate *)dateFromString:(NSString *)string {
    return [NSDate dateFromString:string withFormat:[NSDate dbFormatString]];
}

#pragma mark - 根据 format 格式转换 NSDate -> NSString
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    NSDate *date = [inputFormatter dateFromString:string];
    return date;
}
#pragma mark - 根据 format 格式转换 NSString ->  NSDate
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format {
    return [date stringWithFormat:format];
}

#pragma mark - NSDate -> NSString
+ (NSString *)stringFromDate:(NSDate *)date {
    return [date string];
}

+ (NSString *)stringForDisplayFromDate:(NSDate *)date prefixed:(BOOL)prefixed {
    /*
     * if the date is in today, display 12-hour time with meridian,
     * if it is within the last 7 days, display weekday name (Friday)
     * if within the calendar year, display as Jan 23
     * else display as Nov 11, 2008
     */
    
    NSDate *today = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *offsetComponents = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay)
                                                     fromDate:today];
    
    NSDate *midnight = [calendar dateFromComponents:offsetComponents];
    
    NSDateFormatter *displayFormatter = [[NSDateFormatter alloc] init];
    NSString *displayString = nil;
    
    // comparing against midnight
    if ([date compare:midnight] == NSOrderedDescending) {
        if (prefixed) {
            [displayFormatter setDateFormat:@"'at' h:mm a"]; // at 11:30 am
        } else {
            [displayFormatter setDateFormat:@"h:mm a"]; // 11:30 am
        }
    } else {
        // check if date is within last 7 days
        NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
        [componentsToSubtract setDay:-7];
        NSDate *lastweek = [calendar dateByAddingComponents:componentsToSubtract toDate:today options:0];
        if ([date compare:lastweek] == NSOrderedDescending) {
            [displayFormatter setDateFormat:@"EEEE"]; // Tuesday
        } else {
            // check if same calendar year
            NSInteger thisYear = [offsetComponents year];
            
            NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay)
                                                           fromDate:date];
            NSInteger thatYear = [dateComponents year];
            if (thatYear >= thisYear) {
                [displayFormatter setDateFormat:@"MMM d"];
            } else {
                [displayFormatter setDateFormat:@"MMM d, yyyy"];
            }
        }
        if (prefixed) {
            NSString *dateFormat = [displayFormatter dateFormat];
            NSString *prefix = @"'on' ";
            [displayFormatter setDateFormat:[prefix stringByAppendingString:dateFormat]];
        }
    }
    
    // use display formatter to return formatted date string
    displayString = [displayFormatter stringFromDate:date];
    return displayString;
}

+ (NSString *)stringForDisplayFromDate:(NSDate *)date {
    return [self stringForDisplayFromDate:date prefixed:NO];
}

- (NSString *)stringWithFormat:(NSString *)format {
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:format];
    NSString *timestamp_str = [outputFormatter stringFromDate:self];
    return timestamp_str;
}

- (NSString *)string {
    return [self stringWithFormat:[NSDate dbFormatString]];
}

- (NSString *)stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle {
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateStyle:dateStyle];
    [outputFormatter setTimeStyle:timeStyle];
    NSString *outputString = [outputFormatter stringFromDate:self];
    return outputString;
}

#pragma mark - 返回周日的开始时间
- (NSDate *)beginningOfWeek {
    // largely borrowed from "Date and Time Programming Guide for Cocoa"
    // we'll use the default calendar and hope for the best
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *beginningOfWeek = nil;
    BOOL ok = [calendar rangeOfUnit:NSCalendarUnitWeekOfMonth startDate:&beginningOfWeek
                           interval:NULL forDate:self];
    if (ok) {
        return beginningOfWeek;
    }
    
    // couldn't calc via range, so try to grab Sunday, assuming gregorian style
    // Get the weekday component of the current date
    NSDateComponents *weekdayComponents = [calendar components:NSCalendarUnitWeekday fromDate:self];
    
    /*
     Create a date components to represent the number of days to subtract from the current date.
     The weekday value for Sunday in the Gregorian calendar is 1, so subtract 1 from the number of days to subtract from the date in question.  (If today's Sunday, subtract 0 days.)
     */
    NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
    [componentsToSubtract setDay: 0 - ([weekdayComponents weekday] - 1)];
    beginningOfWeek = nil;
    beginningOfWeek = [calendar dateByAddingComponents:componentsToSubtract toDate:self options:0];
    
    //normalize to midnight, extract the year, month, and day components and create a new date from those components.
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay)
                                               fromDate:beginningOfWeek];
    return [calendar dateFromComponents:components];
}

#pragma mark - 返回当前天的年月日
- (NSDate *)beginningOfDay {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // Get the weekday component of the current date
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay)
                                               fromDate:self];
    return [calendar dateFromComponents:components];
}

#pragma mark - 返回该月的第一天
- (NSDate *)beginningOfMonth
{
    return [self dateAfterDay:-(int)[self getDay] + 1];
}

#pragma mark - 该月的最后一天
- (NSDate *)endOfMonth
{
    return [[[self beginningOfMonth] dateafterMonth:1] dateAfterDay:-1];
}

#pragma mark - 返回当前周的周末
- (NSDate *)endOfWeek {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // Get the weekday component of the current date
    NSDateComponents *weekdayComponents = [calendar components:NSCalendarUnitWeekday fromDate:self];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    // to get the end of week for a particular date, add (7 - weekday) days
    [componentsToAdd setDay:(7 - [weekdayComponents weekday])];
    NSDate *endOfWeek = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];
    
    return endOfWeek;
}

#pragma mark ------------------- 日期格式 ------------------------
#pragma mark - yyyy-MM-dd
+ (NSString *)dateFormatString {
    return @"yyyy-MM-dd";
}
#pragma mark - HH:mm:ss
+ (NSString *)timeFormatString {
    return @"HH:mm:ss";
}
#pragma mark - yyyy-MM-dd HH:mm:ss
+ (NSString *)timestampFormatString {
    return @"yyyy-MM-dd HH:mm:ss";
}

// preserving for compatibility
+ (NSString *)dbFormatString {
    return [NSDate timestampFormatString];
}


#pragma mark ------------------- 创建时间 ------------------------

/**
 *  创建时间
 *
 *  @param year   年
 *  @param month  月
 *  @param day    日
 *  @param hour   时
 *  @param minute 分
 *  @param second 秒
 *
 *  @return 返回 NSDateComponents*
 */
+ (NSDateComponents*)createDateCompWithY:(NSInteger)year mon:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second{
    NSDateComponents*comp = [[NSDateComponents alloc] init];
    [comp setYear:year];
    [comp setMonth:month];
    [comp setDay:day];
    [comp setHour:hour];
    [comp setMinute:minute];
    [comp setSecond:second];
    return comp;
}
/**
 *  创建时间
 *
 *  @param year   年
 *  @param month  月
 *  @param day    日
 *  @param hour   时
 *  @param minute 分
 *  @param second 秒
 *
 *  @return 返回 NSDate*
 */
+ (NSDate*)createDateWithY:(NSInteger)year mon:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second{
    NSDateComponents*comp = [[NSDateComponents alloc] init];
    [comp setYear:year];
    [comp setMonth:month];
    [comp setDay:day];
    [comp setHour:hour];
    [comp setMinute:minute];
    [comp setSecond:second];
    NSDate*date = [[NSDate alloc]init];
    NSCalendar*cal      = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    date = [cal dateFromComponents:comp];
    date = [self toStandardDateWithDate:date];
    return date;
}




#pragma mark -  获取当前时间
/**
 *  获取当前时间
 *
 *  @return NSDateComponents*
 */
+ (NSDateComponents*)getCurrentDateComp{
    NSDate*currentDate              = [NSDate date];
    NSCalendar *calendar            = [NSCalendar currentCalendar];
    NSUInteger unitFlags            = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay |   NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:currentDate];
    return dateComponent;
}

/**
 *  获取几年前的日期
 *
 *  @return 年
 */
#pragma mark - 获取几年前的日期
+ (NSDateComponents*)getDateCompWithYears:(NSInteger)year{
    NSDate*currentDate              = [NSDate date];
    NSCalendar *calendar            = [NSCalendar currentCalendar];
    //    NSUInteger unitFlags            = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay |   NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSUInteger unitFlags            = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents * dateComponent = [calendar components:unitFlags fromDate:currentDate];
    dateComponent.year = dateComponent.year - year;
    return dateComponent;
}


//+ (NSDateComponents*)createDateCompWithYears:(NSInteger)year{
//    NSDate*currentDate              = [NSDate date];
//    NSCalendar *calendar            = [NSCalendar currentCalendar];
//    //    NSUInteger unitFlags            = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay |   NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
//    NSUInteger unitFlags            = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
//    NSDateComponents * dateComponent = [calendar components:unitFlags fromDate:currentDate];
//    dateComponent.year = dateComponent.year - year;
//    return dateComponent;
//}



/**
 *  获取当前时间
 *
 *  @return NSDate*
 */
#pragma mark - 获取当前的时间
+ (NSDate*)getCurrentDate{
    NSDate*currentDate              = [NSDate date];
    currentDate = [self toStandardDateWithDate:currentDate];
    
    
    return currentDate;
}


/**
 *  是否在这个时间段之内
 *
 *  @param time      需要比较的时间
 *  @param startTime 开始的时间
 *  @param endTime   结束的的时间
 *
 *  @return Bool：1 在，0 不在。
 */
#pragma mark - 是否在时间区间内
+ (BOOL)isInPeriodOfTimeWithComp:(NSDateComponents*)time startTime:(NSDateComponents*)startTime endTime:(NSDateComponents*)endTime{
    
    //NSDate* 输出差8小时解决方案
    NSDate*date      = [self toStandardDateWithDateComp:time];
    NSDate*startDate = [self toStandardDateWithDateComp:startTime];
    NSDate*endDate   = [self toStandardDateWithDateComp:endTime];
    //此值返回的是 date（前一个参数）是在后一个参数之前还是之后
    NSComparisonResult startResult = [date compare:startDate];
    NSComparisonResult endResult   = [date compare:endDate];
    if(((startResult == NSOrderedDescending)||(startResult ==NSOrderedSame)) &&((endResult == NSOrderedAscending)||(endResult ==NSOrderedSame)))
    {
        return  YES;
    }else{
        return NO;
    }
}
/**
 *  是否在这个时间段之内
 *
 *  @param time      待比较的时间
 *  @param startTime 开始的时间
 *  @param endTime   结束的时间
 *
 *  @return Bool：1 在，0 不在
 */
#pragma mark - 
#pragma mark - 是否在这个时间段之内
+ (BOOL)isInPeriodOfTimeWithDate:(NSDate*)time startTime:(NSDate*)startTime endTime:(NSDate*)endTime{
    NSDate*date      = [self toStandardDateWithDate:time];
    NSDate*startDate = [self toStandardDateWithDate:startTime];
    NSDate*endDate   = [self toStandardDateWithDate:endTime];
    NSComparisonResult startResult = [date compare:startDate];
    NSComparisonResult endResult   = [date compare:endDate];
    if(((startResult == NSOrderedDescending)||(startResult ==NSOrderedSame)) &&((endResult == NSOrderedAscending)||(endResult ==NSOrderedSame)))
    {
        return  YES;
    }else{
        return NO;
    }
}




#pragma mark - 输出标准 NSDate 时间（解决NSDate输出差8小时）
/**
 *
 *
 *  @param time 传入 NSDateComponents*
 *
 *  @return 返回 NSDate*
 */
+ (NSDate*)toStandardDateWithDateComp:(NSDateComponents*)time{
    NSCalendar*cal      = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate * date       = [cal dateFromComponents:time];
    NSTimeZone * zone   = [NSTimeZone systemTimeZone];
    NSInteger interval  = [zone secondsFromGMTForDate: date];
    NSDate * localeDate = [date  dateByAddingTimeInterval: interval];
    return localeDate;
}
/**
 *
 *  @param date 传入 NSDate*
 *
 *  @return 返回 NSDate*
 */
#pragma mark -  转换成标准的时间
+ (NSDate*)toStandardDateWithDate:(NSDate*)date{
    NSTimeZone *zone   = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    return localeDate;
}


#pragma mark - 是否是昨天
- (BOOL) isYesterday
{
    NSCalendar * currentCalendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags =
    NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    
    NSDateComponents * selfComps =
    [currentCalendar components:unitFlags fromDate:self];
    
    NSDate * now = [NSDate date];
    
    NSDateComponents * nowComps =
    [currentCalendar components:unitFlags fromDate:now];
    
    return [nowComps day] - 1 == [selfComps day] &&
    [nowComps month] == [selfComps month] &&
    [nowComps year] == [selfComps year];
}



#pragma mark - 是否是今天
- (BOOL)isToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return
    (selfCmps.year == nowCmps.year) &&
    (selfCmps.month == nowCmps.month) &&
    (selfCmps.day == nowCmps.day);
}
@end
