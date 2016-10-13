//
//  UIImage+RBProcess.h
//  RBTool
//
//  Created by william on 16/10/13.
//  Copyright © 2016年 Roobo. All rights reserved.
//

/**
 *  图片截取类
 *
 */
#import <UIKit/UIKit.h>

@interface UIImage (RBProcess)
#pragma mark ------------------- 图片截取 ------------------------
#pragma mark - 截取图片
+ (UIImage*)getSubImage:(UIImage *)image mCGRect:(CGRect)mCGRect centerBool:(BOOL)centerBool;
#pragma mark - 获取圆角图片
-(UIImage*) circleImage;
@end
