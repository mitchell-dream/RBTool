//
//  UIView+RBLayoutExtension.h
//  RBTool
//
//  Created by william on 16/10/13.
//  Copyright © 2016年 Roobo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RBLayoutExtension)

@property(nonatomic) CGFloat            left;   /** 左 */
@property(nonatomic) CGFloat            top;    /** 上 */
@property(nonatomic, readonly) CGFloat  right;  /** 右 */
@property(nonatomic, readonly) CGFloat  bottom; /** 下 */
@property(nonatomic) CGFloat            width;  /** 宽度 */
@property(nonatomic) CGFloat            height; /** 高度 */
@end
