//
//  EMNumberKeyboard.m
//  AFNetworking
//
//  Created by zhaochen on 2019/1/3.
//

#import "EMNumberKeyboard.h"
#import "EMKeyboardButton.h"
#import "UIResponder+EMFirstResponder.h"
#import "UIImage+EMColor.h"

@interface EMNumberKeyboard ()

@end

@implementation EMNumberKeyboard

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = kEMKeyboardViewBackgroundColor;
    }
    return self;
}


#pragma mark - external

- (void)resetSecureKeyboard
{
    if (self.keyboardType != EMCustomKeyboardTypeSecury) {
        return;
    }
    NSMutableArray *numArray = [NSMutableArray arrayWithArray:@[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"0"]];
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:[EMKeyboardButton class]]) {
            EMKeyboardButton *subBtn = (EMKeyboardButton *)subView;
            if (subBtn.KeyboardButtonType == EMKeyboardButtonTypeNumber) {
                //随机键盘上的数字
                int loc = arc4random_uniform((int)numArray.count);
                [subBtn setTitle:[numArray objectAtIndex:loc] forState:UIControlStateNormal];
                [numArray removeObjectAtIndex:loc];
            }
        }
    }
}

#pragma mark - private

- (void)createKeyBoard
{
    NSMutableArray *numArray = [NSMutableArray arrayWithArray:@[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"0"]];
    
    int col = 0;
    NSArray *keyBoards = nil;
    
    switch (self.keyboardType) {
        case EMCustomKeyboardTypeNumber:{
            col = 4;
            keyBoards = @[@(1),@(2),@(3),@(EMKeyboardButtonTypeDelete),@(4),@(5),@(6),@(EMKeyboardButtonTypeNone),@(7),@(8),@(9),@(EMKeyboardButtonTypeDecimal),@(EMKeyboardButtonTypeABC),@(0),@(EMKeyboardButtonTypeResign),@(EMKeyboardButtonTypeComplete)];
        }
            break;
            
        case EMCustomKeyboardTypeStockInput:{
            col = 5;
            keyBoards = @[@(EMKeyboardButtonTypeStockHeader600),@(1),@(2),@(3),@(EMKeyboardButtonTypeDelete),@(EMKeyboardButtonTypeStockHeader601),@(4),@(5),@(6),@(EMKeyboardButtonTypeStockHeader002),@(EMKeyboardButtonTypeStockHeader000),@(7),@(8),@(9),@(EMKeyboardButtonTypeStockHeader300),@(EMKeyboardButtonTypeABC),@(EMKeyboardButtonTypeStockHeader00),@(0),@(EMKeyboardButtonTypeResign),@(EMKeyboardButtonTypeComplete)];
        }
            break;
            
        case EMCustomKeyboardTypeStockPosition:{
            col = 5;
            keyBoards = @[@(EMKeyboardButtonTypeStockPositionFull),@(1),@(2),@(3),@(EMKeyboardButtonTypeDelete),@(EMKeyboardButtonTypeStockPositionHalf),@(4),@(5),@(6),@(EMKeyboardButtonTypeNone),@(EMKeyboardButtonTypeStockPositionOneThird),@(7),@(8),@(9),@(EMKeyboardButtonTypeComplete),@(EMKeyboardButtonTypeStockPositionQuartern),@(EMKeyboardButtonTypeStockHeader00),@(0),@(EMKeyboardButtonTypeResign),@(EMKeyboardButtonTypeNone)];
        }
            break;
            
            
        case EMCustomKeyboardTypeSecury:{
            col = 3;
            keyBoards = @[@(EMKeyboardButtonTypeNumber),@(EMKeyboardButtonTypeNumber),@(EMKeyboardButtonTypeNumber),@(EMKeyboardButtonTypeNumber),@(EMKeyboardButtonTypeNumber),@(EMKeyboardButtonTypeNumber),@(EMKeyboardButtonTypeNumber),@(EMKeyboardButtonTypeNumber),@(EMKeyboardButtonTypeNumber),@(EMKeyboardButtonTypeResign),@(EMKeyboardButtonTypeNumber),@(EMKeyboardButtonTypeDelete)];
        }
            break;
            
        default:
            break;
    }
    
    CGFloat btnWidth = kEMScreenWidth / col;
    
    for (int i = 0; i < keyBoards.count; i++) {
        NSInteger keyBoardType = [[keyBoards objectAtIndex:i] integerValue];
        EMKeyboardButton *btn = [EMKeyboardButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i % col * btnWidth, i / col * kEMNumberKeyboardBtnHeight, btnWidth, kEMNumberKeyboardBtnHeight);
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:btn];
        
        if (keyBoardType < EMKeyboardButtonTypeNone) {
            btn.KeyboardButtonType = EMKeyboardButtonTypeNumber;
            [btn setTitle:[NSString stringWithFormat:@"%zd",keyBoardType] forState:UIControlStateNormal];
        }else{
            btn.KeyboardButtonType = keyBoardType;
        }
        
        //页面上的特殊处理
        switch (self.keyboardType) {
            case EMCustomKeyboardTypeNumber:{//普通数字键盘特殊处理
                //删除按钮占两格
                if (keyBoardType == EMKeyboardButtonTypeDelete) {
                    btn.frame = CGRectMake(i % col * btnWidth, i / col * kEMNumberKeyboardBtnHeight, btnWidth, kEMNumberKeyboardBtnHeight * 2);
                    [btn setBackgroundImage:[UIImage imageWithColor:kEMKeyboardBtnWhiteColor] forState:UIControlStateNormal];
                }else if (keyBoardType == EMKeyboardButtonTypeNone){
                    btn.frame = CGRectZero;
                }
            }
                break;
                
            case EMCustomKeyboardTypeStockInput:{//股票输入键盘特殊处理
                if (keyBoardType == EMKeyboardButtonTypeDelete) {
                    [btn setBackgroundImage:[UIImage imageWithColor:kEMKeyboardBtnWhiteColor] forState:UIControlStateNormal];
                }
            }
                break;
                
            case EMCustomKeyboardTypeStockPosition:{//股票数量输入特殊处理
                //删除按钮和完成占两格
                if (keyBoardType == EMKeyboardButtonTypeDelete) {
                    btn.frame = CGRectMake(i % col * btnWidth, i / col * kEMNumberKeyboardBtnHeight, btnWidth, kEMNumberKeyboardBtnHeight * 2);
                    [btn setBackgroundImage:[UIImage imageWithColor:kEMKeyboardBtnWhiteColor] forState:UIControlStateNormal];
                }else if ( keyBoardType == EMKeyboardButtonTypeComplete){
                    btn.frame = CGRectMake(i % col * btnWidth, i / col * kEMNumberKeyboardBtnHeight, btnWidth, kEMNumberKeyboardBtnHeight * 2);
                }
                else if (keyBoardType == EMKeyboardButtonTypeNone){
                    btn.frame = CGRectZero;
                }
            }
                break;
                
            case EMCustomKeyboardTypeSecury:{//密码键盘特殊处理
                if (keyBoardType == EMKeyboardButtonTypeNumber) {
                    btn.KeyboardButtonType = EMKeyboardButtonTypeNumber;
                    //随机键盘上的数字
                    int loc = arc4random_uniform((int)numArray.count);
                    [btn setTitle:[numArray objectAtIndex:loc] forState:UIControlStateNormal];
                    [numArray removeObjectAtIndex:loc];
                }
            }
                break;
                
            default:
                break;
        }
        
    }
}


/**
 点击

 @param sender btn
 */
- (void)btnClick:(EMKeyboardButton *)sender
{
    
    UIView <UITextInput> *textView = [UIResponder firstResponderTextView];
    switch (sender.KeyboardButtonType) {
            
        case EMKeyboardButtonTypeNumber:
        case EMKeyboardButtonTypeDecimal:
        case EMKeyboardButtonTypeStockHeader00:
        case EMKeyboardButtonTypeStockHeader600:
        case EMKeyboardButtonTypeStockHeader601:
        case EMKeyboardButtonTypeStockHeader300:
        case EMKeyboardButtonTypeStockHeader000:
        case EMKeyboardButtonTypeStockHeader002:{
            [self inputNumber:sender.titleLabel.text];
        }
            break;
            
            
        case EMKeyboardButtonTypeDelete:{
            [textView deleteBackward];
        }
            break;
            
        case EMKeyboardButtonTypeComplete:{
            [textView resignFirstResponder];
        }
            break;
            
        case EMKeyboardButtonTypeResign:{
            [textView resignFirstResponder];
        }
            break;
            
        case EMKeyboardButtonTypeABC:{
            //切换到字母键盘
            if (self.changeASCIIBlock) {
                self.changeASCIIBlock();
            }
        }
            break;
            
        case EMKeyboardButtonTypeStockPositionFull:
        case EMKeyboardButtonTypeStockPositionHalf:
        case EMKeyboardButtonTypeStockPositionOneThird:
        case EMKeyboardButtonTypeStockPositionQuartern:{
            if (self.stockPositionBtnClickBlock) {
                self.stockPositionBtnClickBlock(sender.KeyboardButtonType);
            }
        }
            break;
            
        default:
            break;
    }
}


/**
 输入文字

 @param text text
 */
- (void)inputNumber:(NSString *)text
{
    [UIResponder inputText:text];
}

#pragma mark set & get

- (void)setKeyboardType:(EMCustomKeyboardType)keyboardType
{
    _keyboardType = keyboardType;
    [self createKeyBoard];
    //默认的数字键盘不展示切换字母键盘按钮
    self.needChangeASCIIKeyBoard = NO;
}

- (void)setNeedChangeASCIIKeyBoard:(BOOL)needChangeASCIIKeyBoard
{
    _needChangeASCIIKeyBoard = needChangeASCIIKeyBoard;
    
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:[EMKeyboardButton class]]) {
            EMKeyboardButton *subBtn = (EMKeyboardButton *)subView;
            if (subBtn.KeyboardButtonType == EMKeyboardButtonTypeABC && self.keyboardType == EMCustomKeyboardTypeNumber) {
                subBtn.hidden = !needChangeASCIIKeyBoard;
            }
        }
    }
}

@end
