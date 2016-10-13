//
//  NSObject+RBFilterNull.h
//  RBTool
//
//  Created by william on 16/10/13.
//  Copyright © 2016年 Roobo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RBFilterNull)
#pragma mark - Dictionary
/**
 *  是否是可变数组
 *
 */
- (BOOL)mIsDictionary;



/**
 *  数据的键值对的个数
 *
 */
- (NSUInteger)mCount;



/**
 *  根据 key 获取 object
 *
 *  @param aKey key
 *
 */
- (id)mObjectForKey:(id)aKey;

- (id)stringForKey:(id)aKey;


#pragma mark -  NSMutableDictionary


/**
 *  是否是可变数组
 *
 */
- (BOOL)mIsMutableDictionary;


/**
 *  数据的键值对个数
 *
 *  @param aKey key
 */
- (void)mRemoveObjectForKey:(id)aKey;


/**
 *  设置 key，value 值
 *
 *  @param anObject 对象
 *  @param aKey      key
 */
- (void)mSetObject:(id)anObject forKey:(id <NSCopying>)aKey;

- (void)mSetValue:(id)value forKey:(NSString *)key ;


#pragma mark - NSArray


/**
 *  是否是数组
 *
 */
- (BOOL)mIsArray;





#pragma mark - NSMutableArray

/**
 *  是否是可变数组
 *
 */
- (BOOL)mIsMutableArray;


/**
 *  数据添加元素
 *
 */
- (void)mAddObject:(id)anObject;




/**
 *  在 index 索引上插入一个元素
 *
 *  @param anObject 对象
 *  @param index    序号
 */
- (void)mInsertObject:(id)anObject atIndex:(int)index;

/**
 *  在 index 索引上移除一个元素
 *
 *  @param index 序号
 */
- (void)mRemoveObjectAtIndex:(int)index;




/**
 *  替换 index 序号上的元素
 *
 *  @param index    序号
 *  @param anObject 对象
 */
- (void)mReplaceObjectAtIndex:(int)index withObject:(id)anObject;


/**
 *  获取 index 序号上的元素
 *
 *  @param index 序号
 *
 */
- (id)mObjectAtIndex:(NSUInteger)index;



#pragma mark - NSString


/**
 *  是否是 stirng 类型
 *
 */
- (BOOL)mIsStr;


/**
 *  获取 string 的长度
 *
 */
- (NSUInteger)mStrLength;


/**
 *  获取字符串的长度（中英文同一个单位）
 *
 *  @param strtemp 字符串
 *
 *  @return 长度
 */
- (NSUInteger)mIntLength;

/**
 *   根据索引获取 char
 *
 *  @param index 序号
 *
 */
- (unichar)mCharAtIndex:(int)index;

/**
 *  根据 Range 获取 char *
 *
 *  @param buffer buffer
 *  @param aRange aRange
 */
- (void)mGetCharacters:(unichar *)buffer range:(NSRange)aRange;


/**
 *  从form 截取后面的字符串
 *
 *  @param mSubstringToIndex   开始的序号
 *
 */
- (NSString *)mSubstringFromIndex:(int)from;


/**
 *  截取字符串到 to 的索引
 *
 *
 */
- (NSString *)mSubstringToIndex:(int)to;

/**
 *  根据 range 截取字符串
 *
 *  @param range 范围
 *
 */
- (NSString *)mSubstringWithRange:(NSRange)range;

/**
 *  半段是否存在对象字符
 *
 */
- (BOOL) containsObjectCharacter;


#pragma mark - NSNumber


/**
 *  是否是 NSNumber 类型
 *
 */
- (BOOL)mIsNum;
@end
