//
//  EMCustomKeyboardView.h
//  AFNetworking
//
//  Created by zhaochen on 2019/1/3.
//  自定义键盘

#import <UIKit/UIKit.h>
#import "EMKeyboardDefine.h"
#import "EMNumberkeyBoard.h"
#import "EMASCIIKeyBoard.h"

@interface EMCustomKeyboardView : UIView

@property (nonatomic,assign)EMCustomKeyboardType keyboardType;

@property (nonatomic,copy)EMStockPositionBtnClickBlock stockPositionBtnClickBlock;

@end

