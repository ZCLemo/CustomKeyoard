//
//  UIColor+EMColor.h
//  EMJSTradeQSTB
//
//  Created by zhaochen on 2018/7/27.
//  Copyright © 2018年 frank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (EMColor)

/**
 rgb
 
 @param r 红色色值
 @param g 绿色色值
 @param b 蓝色色值
 @param alpha 透明图
 @return 颜色
 */
+ (UIColor *)colorWithR:(CGFloat)r andG:(CGFloat)g andB:(CGFloat)b andAlpha:(CGFloat)alpha;

/**
 *  十六进制颜色转UIColor
 *
 *  @param hexString 十六进制颜色 #FFFFFF / FFFFFF / EEEEEE2B / #EEEEEE2B
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHex:(NSString *)hexString;

/**
 *  设置颜色透明度
 *
 *  @param alpha 0-1之间
 *
 *  @return UIColor
 */
- (UIColor *)alphaValue:(CGFloat)alpha;

/**
 *  获取颜色中的R值
 *
 *  @return CGFloat
 */
- (CGFloat)redValue;
/**
 *  获取颜色中的G值
 *
 *  @return CGFloat
 */
- (CGFloat)greenValue;
/**
 *  获取颜色中的B值
 *
 *  @return CGFloat
 */
- (CGFloat)blueValue;
/**
 *  获取颜色中的A值
 *
 *  @return CGFloat
 */
- (CGFloat)alphaValue;

@end
