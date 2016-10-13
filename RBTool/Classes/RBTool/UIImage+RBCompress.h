//
//  UIImage+RBCompress.h
//  RBTool
//
//  Created by william on 16/10/13.
//  Copyright © 2016年 Roobo. All rights reserved.
//

/**
 *  图片压缩处理类
 *
 */
#import <UIKit/UIKit.h>

@interface UIImage (RBCompress)
#pragma mark ------------------- 图片压缩 ------------------------
#pragma mark - 压缩图片
+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;
#pragma mark - 等比压缩
+ (UIImage *) imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size;
@end
