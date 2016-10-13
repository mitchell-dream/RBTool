//
//  UIImage+RBColorInit.h
//  RBTool
//
//  Created by william on 16/10/13.
//  Copyright © 2016年 Roobo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RBColorInit)
#pragma mark ------------------- 根据颜色创建图片 ------------------------
#pragma mark - 根据颜色创建图片
- (UIImage *) imageWithTintColor:(UIColor *)tintColor;
#pragma mark - 根据颜色创建图片
- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor;
@end
