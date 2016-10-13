//
//  NSDateFormatter+Helper.h
//  RBTool
//
//  Created by william on 16/10/12.
//  Copyright © 2016年 Roobo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (RBHelper)
/**
 *  HH:mm 格式
 *
 */
+ (NSDateFormatter *)tcTimeDateFormat;
/**
 *  YYYY 格式
 *
 */
+ (NSDateFormatter *)tcYearDateFormat;
/**
 *  YYYY年MM月dd日 格式
 *
 */
+ (NSDateFormatter *)tcMouthDateFormat;

/**
 *  YYYYMMdd 格式
 *
 */
+ (NSDateFormatter *)tcDayDateFormat;
/**
 *  YYYY-MM-dd 格式
 *
 */
+ (NSDateFormatter *)tcNormalFormat;
/**
 *  YYYY.MM.dd HH:mm:ss 格式
 *
 */
+ (NSDateFormatter *)tcAllInfoFormat;
/**
 *  MM.dd HH:mm 格式
 *
 */
+ (NSDateFormatter *)tcSimpleInfoFormat;
@end
