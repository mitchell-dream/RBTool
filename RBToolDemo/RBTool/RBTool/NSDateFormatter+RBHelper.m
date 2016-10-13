//
//  NSDateFormatter+Helper.m
//  RBTool
//
//  Created by william on 16/10/12.
//  Copyright © 2016年 Roobo. All rights reserved.
//

#import "NSDateFormatter+RBHelper.h"

@implementation NSDateFormatter (RBHelper)


#pragma mark - 时间格式：HH:mm
+ (NSDateFormatter *)tcTimeDateFormat
{
    NSDateFormatter * format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"HH:mm"];
    return format;
}

#pragma mark - 时间格式：YYYY

+ (NSDateFormatter *)tcYearDateFormat
{
    NSDateFormatter * format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"YYYY"];
    return format;
}

#pragma mark - 时间格式：YYYY年MM月dd日
+ (NSDateFormatter *)tcMouthDateFormat
{
    NSDateFormatter * format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"YYYY年MM月dd日"];
    return format;
}

#pragma mark - 时间格式：YYYYMMdd
+ (NSDateFormatter *)tcDayDateFormat
{

    NSDateFormatter * format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"YYYYMMdd"];
    return format;
}

#pragma mark - 时间格式：YYYY-MM-dd
+ (NSDateFormatter *)tcNormalFormat
{
    NSDateFormatter * format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"YYYY-MM-dd"];
    NSTimeZone* GTMzone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    [format setTimeZone:GTMzone];
    return format;
}

#pragma mark - 时间格式：YYYY.MM.dd HH:mm:ss
+ (NSDateFormatter *)tcAllInfoFormat
{
    NSDateFormatter * format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"YYYY.MM.dd HH:mm:ss"];
    return format;
}

#pragma mark - 时间格式：MM.dd HH:mm
+ (NSDateFormatter *)tcSimpleInfoFormat
{
    NSDateFormatter * format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"MM.dd HH:mm"];    
    return format;
}
@end
