//
//  EMCustomKeyboardView.h
//  AFNetworking
//
//  Created by zhaochen on 2019/1/3.
//  自定义键盘

#import <UIKit/UIKit.h>
#import "EMKeyboardDefine.h"
#import "EMNumberKeyboard.h"
#import "EMASCIIKeyboard.h"

@interface EMCustomKeyboardView : UIView

@property (nonatomic,assign)EMCustomKeyboardType keyboardType;

@property (nonatomic,copy)EMStockPositionBtnClickBlock stockPositionBtnClickBlock;

@end

