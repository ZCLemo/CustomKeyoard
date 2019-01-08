//
//  EMKeyboardDefine.h
//  EMCustomKeyBoardDemo
//
//  Created by zhaochen on 2019/1/7.
//  Copyright © 2019年 zhaochen. All rights reserved.
//

#import "UIColor+EMColor.h"

#define kEMScreenWidth [UIScreen mainScreen].bounds.size.width
//键盘高度
#define kEMCustomKeyboardHeight 220
//数字键盘高度
#define kEMNumberKeyboardBtnHeight kEMCustomKeyboardHeight / 4
//字母键盘按钮水平间距
#define kEMASCIIKeyboardBtnHorizontalSpace 5
//字母键盘按钮垂直间距
#define kEMASCIIKeyboardBtnVerticalSpace 10
//字母键盘高度
#define kEMASCIIKeyboardBtnHeight (kEMCustomKeyboardHeight- kEMASCIIKeyboardBtnVerticalSpace*4)/4
//字母键盘按钮圆角
#define kEMASCIIKeyboardBtnCornerRadius 5
//数字键盘边框宽度
#define kEMASCIIKeyboardBtnBorderWith 0.5
//键盘背景色
#define kEMKeyboardViewBackgroundColor [UIColor colorWithHex:@"f1f1f1"]
//数字键盘边框颜色
#define kEMKeyboardBtnLayerColor [UIColor colorWithHex:@"dadada"]
//键盘按钮高亮状态颜色
#define kEMKeyboardBtnHighhlightColor [UIColor colorWithHex:@"d2d2d2"]
//有背景的按钮颜色
#define kEMKeyboardBtnDefaultColor [UIColor colorWithHex:@"e5e5e5"]
//白色背景按钮颜色
#define kEMKeyboardBtnWhiteColor [UIColor whiteColor]
//深色字体
#define kEMKeyboardBtnDarkTitleColor [UIColor colorWithHex:@"000000"]
//浅色字体
#define kEMKeyboardBtnLightTitleColor [UIColor colorWithHex:@"3d3d3d"]
//大字体
#define kEMKeyboardBtnBigFont [UIFont systemFontOfSize:24]
//小字体
#define kEMKeyboardBtnSmallFont [UIFont systemFontOfSize:18]

/**
 自定义键盘类型
 
 - EMCustomKeyboardTypeASCII: 字母-ASCII键盘，类似系统键盘
 - EMCustomKeyboardTypeStockInput: 搜索股票的键盘——有“600”按钮的快捷数字键盘
 - EMCustomKeyboardTypeSecury: 密码键盘，数字随机
 - EMCustomKeyboardTypeNumber: 数字键盘，不随机
 - EMCustomKeyboardTypeStockPosition: 股票买卖数量键盘，带有仓位选择
 */
typedef NS_ENUM(NSInteger,EMCustomKeyboardType) {
    EMCustomKeyboardTypeASCII,
    EMCustomKeyboardTypeStockInput,
    EMCustomKeyboardTypeSecury,
    EMCustomKeyboardTypeNumber,
    EMCustomKeyboardTypeStockPosition,
};


/**
 按钮类型
 
 - EMKeyBoardButtonTypeNone: 空白
 - EMKeyBoardButtonTypeNumber: 数字
 - EMKeyBoardButtonTypeLetter: 字母
 - EMKeyBoardButtonTypeDelete: 删除按钮
 - EMKeyBoardButtonTypeResign: 数字键盘收起
 - EMKeyBoardButtonTypeDecimal: 数字键盘小数点
 - EMKeyBoardButtonTypeABC: 切换英文键盘
 - EMKeyBoardButtonTypeComplete: 完成
 - EMKeyBoardButtonTypeComma: 逗号
 - EMKeyBoardButtonTypeToggleCase: 大小写切换
 - EMKeyBoardButtonTypeASCIIDelete: 字母键盘的删除按钮
 - EMKeyBoardButtonTypeToNumber: 切换数字键盘按钮
 - EMKeyBoardButtonTypeASCIISpace: 字母键盘空格键
 - EMKeyBoardButtonTypeASCIIResign: 字母键盘收起键
 - EMKeyBoardButtonTypeASCIIDecimal: 字母键盘小数点
 - EMKeyBoardButtonTypeStockHeader600: 股票600开头
 - EMKeyBoardButtonTypeStockHeader601: 股票601开头
 - EMKeyBoardButtonTypeStockHeader000: 股票000开头
 - EMKeyBoardButtonTypeStockHeader002: 股票002开头
 - EMKeyBoardButtonTypeStockHeader300: 股票300开头
 - EMKeyBoardButtonTypeStockHeader00: 股票00开头
 - EMKeyBoardButtonTypeStockPositionFull: 全仓
 - EMKeyBoardButtonTypeStockPositionHalf: 半仓
 - EMKeyBoardButtonTypeStockPositionOneThird: 三分之一
 - EMKeyBoardButtonTypeStockPositionQuartern: 四分之一
 */
typedef NS_ENUM(NSInteger,EMKeyBoardButtonType) {
    EMKeyBoardButtonTypeNone = 10000,
    EMKeyBoardButtonTypeNumber,
    EMKeyBoardButtonTypeLetter,
    EMKeyBoardButtonTypeDelete,
    EMKeyBoardButtonTypeResign,
    EMKeyBoardButtonTypeDecimal,
    EMKeyBoardButtonTypeABC,
    EMKeyBoardButtonTypeComplete,
    EMKeyBoardButtonTypeComma,
    EMKeyBoardButtonTypeToggleCase,
    EMKeyBoardButtonTypeASCIIDelete,
    EMKeyBoardButtonTypeToNumber,
    EMKeyBoardButtonTypeASCIISpace,
    EMKeyBoardButtonTypeASCIIResign,
    EMKeyBoardButtonTypeASCIIDecimal,
    EMKeyBoardButtonTypeStockHeader600,
    EMKeyBoardButtonTypeStockHeader601,
    EMKeyBoardButtonTypeStockHeader000,
    EMKeyBoardButtonTypeStockHeader002,
    EMKeyBoardButtonTypeStockHeader300,
    EMKeyBoardButtonTypeStockHeader00,
    EMKeyBoardButtonTypeStockPositionFull,
    EMKeyBoardButtonTypeStockPositionHalf,
    EMKeyBoardButtonTypeStockPositionOneThird,
    EMKeyBoardButtonTypeStockPositionQuartern,
};
