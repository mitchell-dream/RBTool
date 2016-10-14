//
//  NSObject+RBKeychain.h
//  RBTool
//
//  Created by william on 16/10/14.
//  Copyright © 2016年 Roobo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RBKeychain)
#pragma mark ------------------- KeyChain ------------------------
#pragma mark - action: 根据服务获取
+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service;

#pragma mark - action: 根据服务存储
+ (void)saveWithKey:(NSString *)service data:(id)data;

#pragma mark - action: 根据服务读取
+ (id)loadWithKey:(NSString *)service;

#pragma mark - action: 根据服务删除
+ (void)deleteWithKey:(NSString *)service;
@end
