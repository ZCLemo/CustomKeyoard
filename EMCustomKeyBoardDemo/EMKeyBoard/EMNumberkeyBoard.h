//
//  EMNumberkeyBoard.h
//  AFNetworking
//
//  Created by zhaochen on 2019/1/3.
//  数字键盘

#import <UIKit/UIKit.h>
#import "EMKeyboardDefine.h"

typedef void(^EMChangeASCIIKeyBoardBlock)(void);

typedef void(^ EMStockPositionBtnClickBlock)(EMKeyBoardButtonType keyBoardButtonType);

@interface EMNumberkeyBoard : UIView

@property (nonatomic,assign)EMCustomKeyboardType keyboardType;

@property (nonatomic,copy)EMChangeASCIIKeyBoardBlock changeASCIIBlock;

@property (nonatomic,copy)EMStockPositionBtnClickBlock stockPositionBtnClickBlock;

/**
 是否需要切换字母键盘，纯数字键盘是不需要切换字母键盘按钮的，但是字母键盘切换到了数字键盘，是需要有切换字母键盘按钮
 */
@property (nonatomic,assign)BOOL needChangeASCIIKeyBoard;


/**
 密码键盘数字重新随机
 */
- (void)resetSecureKeyboard;

@end
