//
//  EMCustomKeyboardView.m
//  AFNetworking
//
//  Created by zhaochen on 2019/1/3.
//

#import "EMCustomKeyboardView.h"

@interface EMCustomKeyboardView()


/**
 切换键盘时记录上一个键盘类型
 */
@property (nonatomic,assign)EMCustomKeyboardType lastKeyboardType;

/**
 用于类型和键盘对应
 */
@property (nonatomic,strong)NSDictionary *typeDictionary;


/**
 密码键盘
 */
@property (nonatomic,strong)EMNumberKeyboard *secureKeyBoard;


/**
 数字键盘
 */
@property (nonatomic,strong)EMNumberKeyboard *numberKeyBoard;


/**
 字母键盘
 */
@property (nonatomic,strong)EMASCIIKeyboard *asciiKeyBoard;


/**
 股票代码输入键盘
 */
@property (nonatomic,strong)EMNumberKeyboard *stockInputKeyBoard;


/**
 买入，卖出股票数量输入键盘
 */
@property (nonatomic,strong)EMNumberKeyboard *stockPositionKeyBoard;

@end

@implementation EMCustomKeyboardView


#pragma mark - init

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.frame = CGRectMake(0, 0, kEMScreenWidth, kEMCustomKeyboardHeight);
        [self addSubview:self.secureKeyBoard];
        [self addSubview:self.numberKeyBoard];
        [self addSubview:self.asciiKeyBoard];
        [self addSubview:self.stockInputKeyBoard];
        [self addSubview:self.stockPositionKeyBoard];
        
        //默认是ASCII类型
        self.keyboardType = EMCustomKeyboardTypeASCII;
        [self showKeyBoard];
    }
    return self;
}


/**
 当键盘再次展示时，密码键盘需要重新随机数字

 @param newSuperview newSuperview
 */
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    if (newSuperview != nil && self.keyboardType==EMCustomKeyboardTypeSecury) {
        [self.secureKeyBoard resetSecureKeyboard];
    }
}


#pragma mark - private

/**
 展示当前类型的键盘
 */
- (void)showKeyBoard
{
    for (NSNumber *typeNumber in self.typeDictionary.allKeys) {
        UIView *keyBoard = [self.typeDictionary objectForKey:typeNumber];
        keyBoard.hidden = (typeNumber.integerValue != self.keyboardType);
    }
}

#pragma mark - set & get

- (void)setStockPositionBtnClickBlock:(EMStockPositionBtnClickBlock)stockPositionBtnClickBlock
{
    self.stockPositionKeyBoard.stockPositionBtnClickBlock = stockPositionBtnClickBlock;
}

- (void)setKeyboardType:(EMCustomKeyboardType)keyboardType
{
    _keyboardType = keyboardType;
    [self showKeyBoard];
}

- (NSDictionary *)typeDictionary
{
    if (!_typeDictionary) {
        _typeDictionary = @{@(EMCustomKeyboardTypeSecury):self.secureKeyBoard,@(EMCustomKeyboardTypeNumber):self.numberKeyBoard,@(EMCustomKeyboardTypeASCII):self.asciiKeyBoard,@(EMCustomKeyboardTypeStockInput):self.stockInputKeyBoard,@(EMCustomKeyboardTypeStockPosition):self.stockPositionKeyBoard};
    }
    return _typeDictionary;
}

- (EMNumberKeyboard *)secureKeyBoard
{
    if (!_secureKeyBoard) {
        _secureKeyBoard = [[EMNumberKeyboard alloc] initWithFrame:self.bounds];
        _secureKeyBoard.keyboardType = EMCustomKeyboardTypeSecury;
    }
    return _secureKeyBoard;
}

- (EMNumberKeyboard *)numberKeyBoard
{
    if (!_numberKeyBoard) {
        _numberKeyBoard = [[EMNumberKeyboard alloc] initWithFrame:self.bounds];
        _numberKeyBoard.keyboardType = EMCustomKeyboardTypeNumber;
        __weak __typeof(self)weakSelf = self;
        _numberKeyBoard.changeASCIIBlock = ^{
            weakSelf.keyboardType = EMCustomKeyboardTypeASCII;
            [weakSelf showKeyBoard];
            
            weakSelf.lastKeyboardType = EMCustomKeyboardTypeNumber;
        };
    }
    return _numberKeyBoard;
}

- (EMASCIIKeyboard *)asciiKeyBoard
{
    if (!_asciiKeyBoard) {
        _asciiKeyBoard = [[EMASCIIKeyboard alloc] initWithFrame:self.bounds];
        __weak __typeof(self)weakSelf = self;
        _asciiKeyBoard.changeNumberBlock = ^{
            
            //切换到数字键盘
            if (weakSelf.lastKeyboardType == EMCustomKeyboardTypeStockInput) {
                weakSelf.keyboardType = EMCustomKeyboardTypeStockInput;
            }else{
                weakSelf.keyboardType = EMCustomKeyboardTypeNumber;
            }
            weakSelf.numberKeyBoard.needChangeASCIIKeyBoard = YES;
            [weakSelf showKeyBoard];
            
            weakSelf.lastKeyboardType = EMCustomKeyboardTypeASCII;
            
        };
    }
    return _asciiKeyBoard;
}

- (EMNumberKeyboard *)stockInputKeyBoard
{
    if (!_stockInputKeyBoard) {
        _stockInputKeyBoard = [[EMNumberKeyboard alloc] initWithFrame:self.bounds];
        _stockInputKeyBoard.keyboardType = EMCustomKeyboardTypeStockInput;
        __weak __typeof(self)weakSelf = self;
        _stockInputKeyBoard.changeASCIIBlock = ^{
            weakSelf.keyboardType = EMCustomKeyboardTypeASCII;
            [weakSelf showKeyBoard];
            
            weakSelf.lastKeyboardType = EMCustomKeyboardTypeStockInput;
        };
    }
    return _stockInputKeyBoard;
}

- (EMNumberKeyboard *)stockPositionKeyBoard
{
    if (!_stockPositionKeyBoard) {
        _stockPositionKeyBoard = [[EMNumberKeyboard alloc] initWithFrame:self.bounds];
        _stockPositionKeyBoard.keyboardType = EMCustomKeyboardTypeStockPosition;
    }
    return _stockPositionKeyBoard;
}


@end
