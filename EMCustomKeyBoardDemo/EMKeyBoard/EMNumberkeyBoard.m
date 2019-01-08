//
//  EMNumberkeyBoard.m
//  AFNetworking
//
//  Created by zhaochen on 2019/1/3.
//

#import "EMNumberkeyBoard.h"
#import "EMKeyBoardButton.h"
#import "UIResponder+EMFirstResponder.h"
#import "UIImage+EMColor.h"

@interface EMNumberkeyBoard ()

@end

@implementation EMNumberkeyBoard

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
        if ([subView isKindOfClass:[EMKeyBoardButton class]]) {
            EMKeyBoardButton *subBtn = (EMKeyBoardButton *)subView;
            if (subBtn.keyBoardButtonType == EMKeyBoardButtonTypeNumber) {
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
            keyBoards = @[@(1),@(2),@(3),@(EMKeyBoardButtonTypeDelete),@(4),@(5),@(6),@(EMKeyBoardButtonTypeNone),@(7),@(8),@(9),@(EMKeyBoardButtonTypeDecimal),@(EMKeyBoardButtonTypeABC),@(0),@(EMKeyBoardButtonTypeResign),@(EMKeyBoardButtonTypeComplete)];
        }
            break;
            
        case EMCustomKeyboardTypeStockInput:{
            col = 5;
            keyBoards = @[@(EMKeyBoardButtonTypeStockHeader600),@(1),@(2),@(3),@(EMKeyBoardButtonTypeDelete),@(EMKeyBoardButtonTypeStockHeader601),@(4),@(5),@(6),@(EMKeyBoardButtonTypeStockHeader002),@(EMKeyBoardButtonTypeStockHeader000),@(7),@(8),@(9),@(EMKeyBoardButtonTypeStockHeader300),@(EMKeyBoardButtonTypeABC),@(EMKeyBoardButtonTypeStockHeader00),@(0),@(EMKeyBoardButtonTypeResign),@(EMKeyBoardButtonTypeComplete)];
        }
            break;
            
        case EMCustomKeyboardTypeStockPosition:{
            col = 5;
            keyBoards = @[@(EMKeyBoardButtonTypeStockPositionFull),@(1),@(2),@(3),@(EMKeyBoardButtonTypeDelete),@(EMKeyBoardButtonTypeStockPositionHalf),@(4),@(5),@(6),@(EMKeyBoardButtonTypeNone),@(EMKeyBoardButtonTypeStockPositionOneThird),@(7),@(8),@(9),@(EMKeyBoardButtonTypeComplete),@(EMKeyBoardButtonTypeStockPositionQuartern),@(EMKeyBoardButtonTypeStockHeader00),@(0),@(EMKeyBoardButtonTypeResign),@(EMKeyBoardButtonTypeNone)];
        }
            break;
            
            
        case EMCustomKeyboardTypeSecury:{
            col = 3;
            keyBoards = @[@(EMKeyBoardButtonTypeNumber),@(EMKeyBoardButtonTypeNumber),@(EMKeyBoardButtonTypeNumber),@(EMKeyBoardButtonTypeNumber),@(EMKeyBoardButtonTypeNumber),@(EMKeyBoardButtonTypeNumber),@(EMKeyBoardButtonTypeNumber),@(EMKeyBoardButtonTypeNumber),@(EMKeyBoardButtonTypeNumber),@(EMKeyBoardButtonTypeResign),@(EMKeyBoardButtonTypeNumber),@(EMKeyBoardButtonTypeDelete)];
        }
            break;
            
        default:
            break;
    }
    
    CGFloat btnWidth = kEMScreenWidth / col;
    
    for (int i = 0; i < keyBoards.count; i++) {
        NSInteger keyBoardType = [[keyBoards objectAtIndex:i] integerValue];
        EMKeyBoardButton *btn = [EMKeyBoardButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i % col * btnWidth, i / col * kEMNumberKeyboardBtnHeight, btnWidth, kEMNumberKeyboardBtnHeight);
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:btn];
        
        if (keyBoardType < EMKeyBoardButtonTypeNone) {
            btn.keyBoardButtonType = EMKeyBoardButtonTypeNumber;
            [btn setTitle:[NSString stringWithFormat:@"%zd",keyBoardType] forState:UIControlStateNormal];
        }else{
            btn.keyBoardButtonType = keyBoardType;
        }
        
        //页面上的特殊处理
        switch (self.keyboardType) {
            case EMCustomKeyboardTypeNumber:{//普通数字键盘特殊处理
                //删除按钮占两格
                if (keyBoardType == EMKeyBoardButtonTypeDelete) {
                    btn.frame = CGRectMake(i % col * btnWidth, i / col * kEMNumberKeyboardBtnHeight, btnWidth, kEMNumberKeyboardBtnHeight * 2);
                    [btn setBackgroundImage:[UIImage imageWithColor:kEMKeyboardBtnWhiteColor] forState:UIControlStateNormal];
                }else if (keyBoardType == EMKeyBoardButtonTypeNone){
                    btn.frame = CGRectZero;
                }
            }
                break;
                
            case EMCustomKeyboardTypeStockInput:{//股票输入键盘特殊处理
                if (keyBoardType == EMKeyBoardButtonTypeDelete) {
                    [btn setBackgroundImage:[UIImage imageWithColor:kEMKeyboardBtnWhiteColor] forState:UIControlStateNormal];
                }
            }
                break;
                
            case EMCustomKeyboardTypeStockPosition:{//股票数量输入特殊处理
                //删除按钮和完成占两格
                if (keyBoardType == EMKeyBoardButtonTypeDelete) {
                    btn.frame = CGRectMake(i % col * btnWidth, i / col * kEMNumberKeyboardBtnHeight, btnWidth, kEMNumberKeyboardBtnHeight * 2);
                    [btn setBackgroundImage:[UIImage imageWithColor:kEMKeyboardBtnWhiteColor] forState:UIControlStateNormal];
                }else if ( keyBoardType == EMKeyBoardButtonTypeComplete){
                    btn.frame = CGRectMake(i % col * btnWidth, i / col * kEMNumberKeyboardBtnHeight, btnWidth, kEMNumberKeyboardBtnHeight * 2);
                }
                else if (keyBoardType == EMKeyBoardButtonTypeNone){
                    btn.frame = CGRectZero;
                }
            }
                break;
                
            case EMCustomKeyboardTypeSecury:{//密码键盘特殊处理
                if (keyBoardType == EMKeyBoardButtonTypeNumber) {
                    btn.keyBoardButtonType = EMKeyBoardButtonTypeNumber;
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
- (void)btnClick:(EMKeyBoardButton *)sender
{
    
    UIView <UITextInput> *textView = [UIResponder firstResponderTextView];
    switch (sender.keyBoardButtonType) {
            
        case EMKeyBoardButtonTypeNumber:
        case EMKeyBoardButtonTypeDecimal:
        case EMKeyBoardButtonTypeStockHeader00:
        case EMKeyBoardButtonTypeStockHeader600:
        case EMKeyBoardButtonTypeStockHeader601:
        case EMKeyBoardButtonTypeStockHeader300:
        case EMKeyBoardButtonTypeStockHeader000:
        case EMKeyBoardButtonTypeStockHeader002:{
            [self inputNumber:sender.titleLabel.text];
        }
            break;
            
            
        case EMKeyBoardButtonTypeDelete:{
            [textView deleteBackward];
        }
            break;
            
        case EMKeyBoardButtonTypeComplete:{
            [textView resignFirstResponder];
        }
            break;
            
        case EMKeyBoardButtonTypeResign:{
            [textView resignFirstResponder];
        }
            break;
            
        case EMKeyBoardButtonTypeABC:{
            //切换到字母键盘
            if (self.changeASCIIBlock) {
                self.changeASCIIBlock();
            }
        }
            break;
            
        case EMKeyBoardButtonTypeStockPositionFull:
        case EMKeyBoardButtonTypeStockPositionHalf:
        case EMKeyBoardButtonTypeStockPositionOneThird:
        case EMKeyBoardButtonTypeStockPositionQuartern:{
            if (self.stockPositionBtnClickBlock) {
                self.stockPositionBtnClickBlock(sender.keyBoardButtonType);
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
    UIView <UITextInput> *textView = [UIResponder firstResponderTextView];
    NSString *character = [NSString stringWithString:text];
    if ([textView isKindOfClass:[UITextView class]] || [textView isKindOfClass:[UITextField class]]) {
        [textView insertText:character];
    }
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
        if ([subView isKindOfClass:[EMKeyBoardButton class]]) {
            EMKeyBoardButton *subBtn = (EMKeyBoardButton *)subView;
            if (subBtn.keyBoardButtonType == EMKeyBoardButtonTypeABC && self.keyboardType == EMCustomKeyboardTypeNumber) {
                subBtn.hidden = !needChangeASCIIKeyBoard;
            }
        }
    }
}

@end
