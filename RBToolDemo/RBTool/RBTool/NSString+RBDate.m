//
//  NSString+Date.m
//  RBTool
//
//  Created by william on 16/10/12.
//  Copyright © 2016年 Roobo. All rights reserved.
//

#import "NSString+RBDate.h"
#import "NSDateFormatter+RBHelper.h"
@implementation NSString (RBDate)

/**
 *  根据时间戳获取距离现在多少天
 *
 *  @param timestr 时间戳
 *
 */
#pragma mark - 根据时间戳获取距离现在多少天
+ (NSString *)getDayTimeWithTimeInterval:(NSString *)timestr{
    NSTimeInterval time = [timestr doubleValue]/1000;
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:time];
    
    NSString * dataStr =  [[NSDateFormatter tcDayDateFormat] stringFromDate:date];
    NSString * currentStr =  [[NSDateFormatter tcDayDateFormat] stringFromDate:[NSDate date]];
    long over = [currentStr integerValue] - [dataStr integerValue];
    
    if(over == 0){
        return @"今天";
    }else if(over == 1){
        return @"昨天";
    }else{
        return [[NSDateFormatter tcMouthDateFormat] stringFromDate:date];
        
    }
    
}
/**
 *  根据时间戳获取距离现在多少小时分钟
 *
 *  @param timestr 时间戳
 *
 */
#pragma mark - 根据时间戳获取距离现在多少小时分钟
+ (NSString *)getTimeWithTimeInterval:(NSString *)timestr{
    NSTimeInterval time = [timestr doubleValue]/1000;
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:time];
    //显示北京时区的时间
    //    [NSTimeZone setDefaultTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"]];
    return [[NSDateFormatter tcTimeDateFormat] stringFromDate:date];
}

/**
 *  根据时间戳获取日期 YYYY-MM-dd
 *
 *  @param timestr 时间戳
 *
 */
#pragma mark - 根据时间戳获取日期 YYYY-MM-dd
+ (NSString *)getNormailDataString:(NSDate *)date{
    NSTimeZone *zone = [NSTimeZone localTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    NSString * st = [[NSDateFormatter tcNormalFormat] stringFromDate:localeDate];
    return st;
}

/**
 *  获取前一天
 *
 *  @param timestr 时间戳
 *
 */
#pragma mark - 获取前一天
+ (NSString *)getNormolastDay:(NSString *)timestr{
    NSTimeInterval interval =  [[[NSDateFormatter tcNormalFormat] dateFromString:timestr] timeIntervalSince1970] - 24 * 60 * 60;
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:interval];
    return [[NSDateFormatter tcNormalFormat] stringFromDate:date];
}

/**
 *  根据时间戳获取 日期
 *
 *  @param timestr 时间戳
 *
 */
#pragma mark - 根据时间戳获取 日期
+ (NSString *)getDayTimeWithString:(NSString *)timestr{
    NSTimeInterval interval =  [[[NSDateFormatter tcNormalFormat] dateFromString:timestr] timeIntervalSince1970];
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSString * dataStr =  [[NSDateFormatter tcDayDateFormat] stringFromDate:date];
    NSString * currentStr =  [[NSDateFormatter tcDayDateFormat] stringFromDate:[NSDate date]];
    long over = [currentStr integerValue] - [dataStr integerValue];
    if(over == 0){
        return @"今天";
    }else if(over == 1){
        return @"昨天";
    }else{
        return timestr;
    }
}

+ (NSString *)getMapContentTimeWithString:(NSString *)timestr{
    NSDate * date = [[NSDateFormatter tcAllInfoFormat] dateFromString:timestr];
    NSString * str = [[NSDateFormatter tcSimpleInfoFormat] stringFromDate:date] ;
    return str;
}

+ (NSString *)getMapContentTimeWithNSTimeInterval:(NSTimeInterval )timestr{
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:timestr/1000];
    NSString * str = [[NSDateFormatter tcSimpleInfoFormat] stringFromDate:date] ;
    return str;
}

/**
 *  获取当前日期 全格式
 *
 */
#pragma mark - 获取当前日期 全格式
+ (NSString *)getAllInfoTime{
    NSString * str = [[NSDateFormatter tcAllInfoFormat] stringFromDate:[NSDate date]];
    return str;
}


@end
