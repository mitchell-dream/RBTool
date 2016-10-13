//
//  NSDate+RBExtension.h
//  RBTool
//
//  Created by william on 16/10/13.
//  Copyright © 2016年 Roobo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (RBExtension)
//获取年月日如:19871127.
- (NSString *)getFormatYearMonthDay;
//该日期是该年的第几周

- (int )getWeekOfYear;

//返回day天后的日期(若day为负数,则为|day|天前的日期)
- (NSDate *)dateAfterDay:(int)day;

//month个月后的日期
- (NSDate *)dateafterMonth:(int)month;

//获取日
- (NSUInteger)getDay;

//获取月
- (NSUInteger)getMonth;

//获取年
- (NSUInteger)getYear;

//获取小时
- (int )getHour;

//获取分钟
- (int)getMinute;

//在当前日期前几天
- (NSUInteger)daysAgo;

//午夜时间距今几天
- (NSUInteger)daysAgoAgainstMidnight;

//返回一周的第几天(周末为第一天)
- (NSUInteger)weekday;

//转为NSString类型的
+ (NSDate *)dateFromString:(NSString *)string;

//返回周日的的开始时间
- (NSDate *)beginningOfWeek;

//返回当前天的年月日.
- (NSDate *)beginningOfDay;

//返回该月的第一天
- (NSDate *)beginningOfMonth;

//该月的最后一天
- (NSDate *)endOfMonth;

//返回当前周的周末
- (NSDate *)endOfWeek;

#pragma mark - 创建时间
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
+ (NSDateComponents*)createDateCompWithY:(NSInteger)year mon:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second;
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
+ (NSDate*)createDateWithY:(NSInteger)year mon:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second;




#pragma mark - 获取当前时间
/**
 *  获取当前时间
 *
 *  @return NSDateComponents*
 */
+ (NSDateComponents*)getCurrentDateComp;
/**
 *  获取当前时间
 *
 *  @return NSDate*
 */
+ (NSDate*)getCurrentDate;


/**
 *  获取几年前的时间
 *
 *  @param year 年数
 *
 *  @return 日期
 */
+ (NSDateComponents*)getDateCompWithYears:(NSInteger)year;


#pragma mark - 是否在时间区间内
/**
 *  是否在这个时间段之内
 *
 *  @param time      需要比较的时间
 *  @param startTime 开始的时间
 *  @param endTime   结束的的时间
 *
 *  @return Bool：1 在，0 不在。
 */
+ (BOOL)isInPeriodOfTimeWithComp:(NSDateComponents*)time startTime:(NSDateComponents*)startTime endTime:(NSDateComponents*)endTime;
/**
 *  是否在这个时间段之内
 *
 *  @param time      待比较的时间
 *  @param startTime 开始的时间
 *  @param endTime   结束的时间
 *
 *  @return Bool：1 在，0 不在
 */
+ (BOOL)isInPeriodOfTimeWithDate:(NSDate*)time startTime:(NSDate*)startTime endTime:(NSDate*)endTime;



#pragma mark - 输出标准 NSDate 时间（解决NSDate输出差8小时）
/**
 *
 *
 *  @param time 传入 NSDateComponents*
 *
 *  @return 返回 NSDate*
 */
+ (NSDate*)toStandardDateWithDateComp:(NSDateComponents*)time;
/**
 *
 *  @param date 传入 NSDate*
 *
 *  @return 返回 NSDate*
 */
+ (NSDate*)toStandardDateWithDate:(NSDate*)date;
/**
 *  baxiang
 *
 *  @return 判断是不是今天
 */
- (BOOL)isToday;
/**
 *  baxiang
 *
 *  @return 判断是不是昨天
 */
- (BOOL) isYesterday;
@end
