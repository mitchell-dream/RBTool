//
//  NSObject+RBKeychain.m
//  RBTool
//
//  Created by william on 16/10/14.
//  Copyright © 2016年 Roobo. All rights reserved.
//

#import "NSObject+RBKeychain.h"

@implementation NSObject (RBKeychain)
#pragma mark ------------------- KeyChain ------------------------
#pragma mark - action: 根据服务获取
+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service {
    NSMutableDictionary * dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  (__bridge_transfer id)kSecClassGenericPassword,(__bridge_transfer id)kSecClass,
                                  service, (__bridge_transfer id)kSecAttrService,
                                  service, (__bridge_transfer id)kSecAttrAccount,
                                  (__bridge_transfer id)kSecAttrAccessibleAfterFirstUnlock,(__bridge_transfer id)kSecAttrAccessible,
                                  nil];
    
    return dict;
}

#pragma mark - action: 根据服务存储
+ (void)saveWithKey:(NSString *)service data:(id)data {
    //Get search dictionary
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Delete old item before add new item
    SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuery);
    //Add new object to search dictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(__bridge_transfer id)kSecValueData];
    //Add item to keychain with the search dictionary
    SecItemAdd((__bridge_retained CFDictionaryRef)keychainQuery, NULL);
}

#pragma mark - action: 根据服务读取
+ (id)loadWithKey:(NSString *)service {
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Configure the search setting
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(__bridge_transfer id)kSecReturnData];
    [keychainQuery setObject:(__bridge_transfer id)kSecMatchLimitOne forKey:(__bridge_transfer id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((__bridge_retained CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge_transfer NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", service, e);
        } @finally {
        }
    }
    return ret;
}

#pragma mark - action: 根据服务删除
+ (void)deleteWithKey:(NSString *)service {
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuery);
}
@end
