//
//  NSObject+RBHandle.m
//  RBTool
//
//  Created by william on 16/10/13.
//  Copyright © 2016年 Roobo. All rights reserved.
//

#import "NSObject+RBSSIDMsg.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#import "NSObject+RBFilterNull.m"
@implementation NSObject (RBSSIDMsg)


/**
 *  获取 SSID
 *
 *  @return 返回 SSID 字典
 */
#pragma mark - 获取 SSID 字典
- (NSDictionary *)fetchSSIDInfo {
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();

    id info = nil;
    for (NSString *ifnam in ifs) {
        info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        if (info && [info count]) {
            break;
        }
    }
    if([[info allKeys] count] > 0){
        info = [self resetMacAddress:info];
    }
    return info ;
}

/**
 *  重新设置 mac 地址格式（1位前面+0）
 *
 *  @param dict  字典
 *
 */
#pragma mark - 重新设置 mac 地址格式（1位前面+0）
- (id)resetMacAddress:(NSDictionary *) dict{
    NSString * macAddress = [dict mObjectForKey:@"BSSID"];
    NSArray * array = [macAddress componentsSeparatedByString:@":"];
    
    NSMutableString * string = [NSMutableString new] ;
    for(int i = 0 ; i < array.count ; i++){
        NSString * str = [array objectAtIndex:i];
        if(str.length == 1){
            str = [NSString stringWithFormat:@"0%@",str];
        }
        if(i < (array.count - 1)){
            [string appendFormat:@"%@:",str];
        }else{
            [string appendFormat:@"%@",str];
        }
        
    }
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] initWithDictionary:dict];
    //BSSID 是站点的 Mac 地址
    [dic setObject:string forKey:@"BSSID"];
    return dic;
}

@end
