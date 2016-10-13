//
//  NSString+Date.h
//  RBTool
//
//  Created by william on 16/10/12.
//  Copyright © 2016年 Roobo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RBDate)

/**
 *  根据时间戳获取距离现在多少天
 *
 *  @param timestr 时间戳
 *
 */
+ (NSString *)getDayTimeWithTimeInterval:(NSString *)timestr;
/**
 *  根据时间戳获取距离现在多少小时分钟
 *
 *  @param timestr 时间戳
 *
 */
+ (NSString *)getTimeWithTimeInterval:(NSString *)timestr;
/**
 *  根据时间戳获取日期 YYYY-MM-dd
 *
 *  @param timestr 时间戳
 *
 */
+ (NSString *)getNormailDataString:(NSDate *)date;
/**
 *  获取前一天
 *
 *  @param timestr 时间戳
 *
 */
+ (NSString *)getNormolastDay:(NSString *)timestr;
/**
 *  根据时间戳获取 日期
 *
 *  @param timestr 时间戳
 *
 */
+ (NSString *)getDayTimeWithString:(NSString *)timestr;


+ (NSString *)getMapContentTimeWithString:(NSString *)timestr;
+ (NSString *)getMapContentTimeWithNSTimeInterval:(NSTimeInterval )timestr;

/**
 *  获取当前日期 全格式
 *
 */
+ (NSString *)getAllInfoTime;


@end
