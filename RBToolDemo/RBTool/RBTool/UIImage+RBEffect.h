//
//  UIImage+RBEffect.h
//  RBTool
//
//  Created by william on 16/10/13.
//  Copyright © 2016年 Roobo. All rights reserved.
//


/**
 *  图片模糊处理类
 *
 */
#import <UIKit/UIKit.h>

@interface UIImage (RBEffect)
#pragma mark ------------------- 模糊图片处理 ------------------------

#pragma mark - 图片模糊风格：LightEffect
- (UIImage *)applyLightEffect;
#pragma mark - 图片模糊风格：ExtraLightEffect
- (UIImage *)applyExtraLightEffect;
#pragma mark - 图片模糊风格：DarkEffect
- (UIImage *)applyDarkEffect;
#pragma mark - 图片模糊风格：TintEffect
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;
#pragma mark - 模糊图片方法
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;
#pragma mark - 给图片添加模糊效果
+ (UIImage *)blurredImageWithRadius:(CGFloat)radius iterations:(NSUInteger)iterations tintColor:(UIColor *)tintColor image:(UIImage*)image;

@end
