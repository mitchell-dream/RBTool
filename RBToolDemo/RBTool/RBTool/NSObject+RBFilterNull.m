//
//  NSObject+RBFilterNull.m
//  RBTool
//
//  Created by william on 16/10/13.
//  Copyright © 2016年 Roobo. All rights reserved.
//

#import "NSObject+RBFilterNull.h"

@implementation NSObject (RBFilterNull)
#pragma mark - Dictionary

#pragma mark ------------------- Dictionary ------------------------


/**
 *  根据 key 获取对象
 *
 *  @param aKey  key
 *
 */
#pragma mark - 根据 key 获取对象
- (id)mObjectForKey:(id)aKey
{
    id object = nil;
    
    if([self mIsDictionary] || [self isKindOfClass:[NSUserDefaults class]]){
        object = [(NSDictionary *)self objectForKey:aKey];
    }
    return object;
}

- (id)stringForKey:(id)aKey
{
    id object = @"";
    
    if([self mIsDictionary] && aKey!= nil && ![aKey isKindOfClass:[NSNull class]]) {
        
        NSString *string = [(NSDictionary *)self objectForKey: aKey];
        object = string && [string isKindOfClass: [NSString class]] && [string length] > 0 ? string : @"";
    }
    return object;
}

/**
 *  是否是可变数组
 *
 */
#pragma mark - 是否是可变数组
- (BOOL)mIsDictionary{
    if([self isKindOfClass:[NSDictionary class]] && self != nil){
        return YES;
    }
    return NO;
}

/**
 *  获取数据的键值对个数 或 数组的长度
 *
 *  @return 长度
 */
#pragma mark - 获取数据的键值对个数 或 数组的长度
- (NSUInteger)mCount
{
    if([self mIsDictionary]){
        return [(NSDictionary *)self count];
    }
    if([self mIsArray]){
        return [(NSArray *)self count];
    }
    return 0;
    
}



#pragma mark ------------------- NSMutableDictionary ------------------------

/**
 *  是否是可变数组
 *
 */
#pragma mark - 是否是可变数组
- (BOOL)mIsMutableDictionary{
    if([self isKindOfClass:[NSMutableDictionary class]] && self != nil){
        return YES;
    }
    return NO;
}

/**
 *  根据 key 移除键值对
 *
 */
#pragma mark - 根据 key 移除键值对
- (void)mRemoveObjectForKey:(id)aKey
{
    if(aKey != nil && ![aKey isKindOfClass:[NSNull class]] && [self mIsMutableDictionary]){
        [(NSMutableDictionary *)self removeObjectForKey:aKey];
    }
    
}

/**
 *  设置 key 和 value 的值
 *
 *  @param anObject 对象
 *  @param aKey      key
 */
#pragma mark - 设置 key 和 value 的值
- (void)mSetObject:(id)anObject forKey:(id <NSCopying>)aKey
{
    if(anObject != nil  && ![anObject isKindOfClass:[NSNull class]] && aKey != nil && [self mIsMutableDictionary]){
        [(NSMutableDictionary *)self setObject:anObject forKey:aKey];
    }
}

- (void)mSetValue:(id)value forKey:(NSString *)key{
    if(value != nil && key != nil && [self mIsMutableDictionary]){
        [self setValue:value forKey:key];
    }
}


#pragma mark ------------------- NSArray ------------------------


/**
 *  是否是不可变数组
 *
 */
#pragma mark - 是否是不可变数组
- (BOOL)mIsArray{
    if([self isKindOfClass:[NSArray class]] && self != nil){
        return YES;
    }
    return NO;
    
}


/**
 *  获取 index 序号上的元素
 *
 *  @param index 序号
 *
 */
#pragma mark - 获取 index 序号上的元素
- (id)mObjectAtIndex:(NSUInteger)index
{
    if([self mIsArray] && index < [self mCount]){
        return [(NSArray *)self objectAtIndex:index];
    }
    return nil;
    
}




#pragma mark ------------------- NSMutableArray ------------------------

/**
 *  是否是可变数组
 *
 */
#pragma mark - 是否是可变数组
- (BOOL)mIsMutableArray{
    if([self isKindOfClass:[NSMutableArray class]] && self != nil){
        return YES;
    }
    return NO;
    
}


/**
 *  数据添加元素
 *
 */
#pragma mark - 数据添加元素
- (void)mAddObject:(id)anObject
{
    if([self mIsMutableArray] && self != nil && anObject != nil && ![anObject isKindOfClass:[NSNull class]] ){
        [(NSMutableArray *)self addObject:anObject];
    }
}

/**
 *  在 index 上插入一个元素
 *
 */
#pragma mark - 在 index 上插入一个元素
- (void)mInsertObject:(id)anObject atIndex:(int)index
{
    if([self mIsMutableArray] && index >=0 && index <= [self mCount]  && anObject != nil && ![anObject isKindOfClass:[NSNull class]]){
        [(NSMutableArray *)self insertObject:anObject atIndex:index];
    } else{
        NSLog(@"---------------- insertObject error %@ at index %d",anObject ,index);

    }
}


/**
 *  在 index 索引上移除一个元素
 *
 *  @param index 索引
 */
#pragma mark - 在 index 索引上移除一个元素
- (void)mRemoveObjectAtIndex:(int)index
{
    if([self mIsMutableArray] && index >=0 && index < [self mCount]){
        [(NSMutableArray *)self removeObjectAtIndex:index];
    }else{
        NSLog(@"---------------- mRemoveObjectAtIndex error at index %d" ,index);
    }
    
}



/**
 *  替换 index 元素
 *
 *  @param index    序号
 *  @param anObject 对象
 */
#pragma mark - 替换 index 索引上的元素
- (void)mReplaceObjectAtIndex:(int)index withObject:(id)anObject
{
    if([self mIsMutableArray] && index >=0 && index < [self mCount] && anObject != nil && ![anObject isKindOfClass:[NSNull class]]){
        
        [(NSMutableArray *)self replaceObjectAtIndex:index withObject:anObject];
    }else{
        NSLog(@"---------------- insertObject error %@ at index %d",anObject ,index);
    }
}


#pragma mark ------------------- NSString ------------------------

/**
 *  是否是 string 类型
 *
 */
#pragma mark - 是否是  string 类型
- (BOOL)mIsStr
{
    if([self isKindOfClass:[NSString class]] && self != nil){
        return YES;
    }
    return NO;
}

/**
 *  获取 string 的长度
 *
 *
 */
#pragma mark - 获取 string 的长度
- (NSUInteger)mStrLength
{
    if([self mIsStr]){
        return [(NSString *)self length];
    }
    return 0;
    
}

/**
 *  获取字符串长度
 *
 */
#pragma mark - 获取字符串长度
- (NSUInteger)mIntLength
{
    //    NSUInteger strLength = 0;
    //    char *p = (char *)[(NSString*)self cStringUsingEncoding:NSUnicodeStringEncoding];
    //    NSInteger length = [(NSString*)self lengthOfBytesUsingEncoding:NSUnicodeStringEncoding];
    //    for (NSInteger i = 0; i < length; i ++) {
    //        if (*p) {
    //            p ++;
    //            strLength ++;
    //        }else{
    //            p ++;
    //        }
    //    }
    //    return (strLength+1)/2;
    NSInteger len = [(NSString*)self lengthOfBytesUsingEncoding:NSUnicodeStringEncoding];
    
    return len/2;
}

/**
 *  根据索引获取 char
 *
 *  @param index 索引
 *
 */
#pragma mark - 根据索引获取 char
- (unichar)mCharAtIndex:(int)index{
    if(index >= 0 && index < [self mStrLength]){
        return [(NSString *)self characterAtIndex:index];
    }
    return 0;
}


/**
 *  根据范围获取 char *
 *
 *  @param buffer buffer
 *  @param aRange 范围
 */
#pragma mark -  根据 Range 获取 char *
- (void)mGetCharacters:(unichar *)buffer range:(NSRange)aRange{
    if([self mStrLength] > (aRange.length + aRange.location)){
        [(NSString *)self getCharacters:buffer range:aRange];
    }
}


/**
 *  从 from 截取后面的字符串
 *
 */
#pragma mark - 从 from 截取后面的字符串
- (NSString *)mSubstringFromIndex:(int)from{
    if([self mStrLength] > from && from >= 0){
        return [(NSString *)self substringFromIndex:from];
    }
    return nil;
}



/**
 *  截取字符串到 to 的索引
 *
 *  @param to to 的索引
 *
 */
#pragma mark - 截取字符串到 to 的索引
- (NSString *)mSubstringToIndex:(int)to{
    if([self mStrLength] >= to && to > 0){
        return [(NSString *)self substringToIndex:to];
    }
    return nil;
    
}


/**
 *  根据 range 截取字符串
 *
 *  @param range 范围
 *
 */
#pragma mark - 根据 range 截取字符串
- (NSString *)mSubstringWithRange:(NSRange)range{
    if([self mStrLength] >= (range.length + range.location)){
        return [(NSString *)self substringWithRange:range];
    }
    return nil;
}


/**
 *  判断是否存在对象字符
 *
 */
#pragma mark - 判断是否存在对象字符
- (BOOL) containsObjectCharacter {
    
    if (![self isKindOfClass: [NSString class]])
        return NO;
    
    int index = 0;
    NSString *string = (NSString *) self;
    while (index < [string length]) {
        
        NSString *character = [string substringWithRange: NSMakeRange(index, 1)];
        if ([character lengthOfBytesUsingEncoding: NSUTF8StringEncoding] == 3)
            return YES;
        index++;
    }
    
    return NO;
}

/**
 *  是否是 NSNumber 类型
 *
 */
#pragma mark - 是否是 NSNumber 类型
- (BOOL)mIsNum{
    if([self isKindOfClass:[NSNumber class]] && self != nil){
        return YES;
    }
    return NO;
    
}
@end
