//
//  EMASCIIKeyBoard.m
//  AFNetworking
//
//  Created by zhaochen on 2019/1/3.
//

#import "EMASCIIKeyBoard.h"
#import "EMKeyBoardButton.h"
#import "UIResponder+EMFirstResponder.h"
#import "EMKeyboardDefine.h"

@interface EMASCIIKeyBoard ()
//所有高度
@property (nonatomic,assign)CGFloat buttonHeight;
//输入按钮宽度
@property (nonatomic,assign)CGFloat buttonWeight;
//按钮之前的间距
@property (nonatomic,assign)CGFloat buttonSpace;
//功能按钮宽度
@property (nonatomic,assign)CGFloat functionButtonWidth;
//收起键盘按钮宽度
@property (nonatomic,assign)CGFloat resignButtonWidth;

@property (nonatomic,strong)NSArray *firstRowTitles;

@property (nonatomic,strong)NSArray *secondRowTitles;

@property (nonatomic,strong)NSArray *thirdRowTitles;

@end

@implementation EMASCIIKeyBoard

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = kEMKeyboardViewBackgroundColor;
        
        self.firstRowTitles = @[@"q",@"w",@"e",@"r",@"t",@"y",@"u",@"i",@"o",@"p"];
        self.secondRowTitles  = @[@"a",@"s",@"d",@"f",@"g",@"h",@"j",@"k",@"l"];
        self.thirdRowTitles = @[@"z",@"x",@"c",@"v",@"b",@"n",@"m"];
        
        self.buttonSpace = kEMASCIIKeyboardBtnHorizontalSpace;
        self.buttonHeight = kEMASCIIKeyboardBtnHeight;
        self.buttonWeight = [self btnWidth];
        self.functionButtonWidth = [self functionBtnWidth];
        self.resignButtonWidth = [self resignBtnWidth];
        
        [self createKeyBoard];
    }
    return self;
}


- (void)createKeyBoard
{
    [self createFirstRow:kEMASCIIKeyboardBtnVerticalSpace/2];
    
}

- (void)createFirstRow:(CGFloat)offsetY
{
    CGFloat secondOffsetY = 0.0;
    //距两边间距
    CGFloat sideSpace = 2;
    for (int i = 0; i < self.firstRowTitles.count; i++) {
        EMKeyBoardButton *btn = [self createBtn];
        [btn setTitle:self.firstRowTitles[i] forState:UIControlStateNormal];
        btn.frame = CGRectMake(sideSpace+i*(self.buttonSpace+self.buttonWeight), offsetY, self.buttonWeight, self.buttonHeight);
        btn.keyBoardButtonType = EMKeyBoardButtonTypeLetter;
        [self addSubview:btn];
        
        secondOffsetY = CGRectGetMaxY(btn.frame) + kEMASCIIKeyboardBtnVerticalSpace;
    }
    
    [self createSecondRow:secondOffsetY];
}

- (void)createSecondRow:(CGFloat)offsetY
{
    CGFloat thirdOffsetY = 0.0;
    //距两边间距
    CGFloat sideSpace = (kEMScreenWidth-self.secondRowTitles.count*self.buttonWeight - (self.secondRowTitles.count-1)*self.buttonSpace)/2;
    for (int i = 0; i < self.secondRowTitles.count; i++) {
        EMKeyBoardButton *btn = [self createBtn];
        [btn setTitle:self.secondRowTitles[i] forState:UIControlStateNormal];
        btn.frame = CGRectMake(sideSpace+i*(self.buttonSpace+self.buttonWeight), offsetY, self.buttonWeight, self.buttonHeight);
        btn.keyBoardButtonType = EMKeyBoardButtonTypeLetter;
        [self addSubview:btn];
        thirdOffsetY = CGRectGetMaxY(btn.frame) + kEMASCIIKeyboardBtnVerticalSpace;
    }
    
    [self createThirdRow:thirdOffsetY];
}

- (void)createThirdRow:(CGFloat)offsetY
{
    CGFloat fourthOffsetY = 0.0;
    //距两边间距
    CGFloat sideSpace = kEMASCIIKeyboardBtnHorizontalSpace/2;
    for (int i = 0; i < self.thirdRowTitles.count+2; i++) {
        EMKeyBoardButton *btn = [self createBtn];
        if (i == 0) {
            btn.frame = CGRectMake(sideSpace, offsetY, self.functionButtonWidth, self.buttonHeight);
            btn.keyBoardButtonType = EMKeyBoardButtonTypeToggleCase;
        }else if (i == self.thirdRowTitles.count+1){
            btn.frame = CGRectMake(kEMScreenWidth-sideSpace-self.functionButtonWidth, offsetY, self.functionButtonWidth, self.buttonHeight);
            btn.keyBoardButtonType = EMKeyBoardButtonTypeASCIIDelete;
        }else{
            btn.frame = CGRectMake(sideSpace+self.functionButtonWidth+self.buttonSpace+(i-1)*(self.buttonSpace+self.buttonWeight), offsetY, self.buttonWeight, self.buttonHeight);
            [btn setTitle:self.thirdRowTitles[i-1] forState:UIControlStateNormal];
            btn.keyBoardButtonType = EMKeyBoardButtonTypeLetter;
        }
        [self addSubview:btn];
        
        fourthOffsetY = CGRectGetMaxY(btn.frame) + kEMASCIIKeyboardBtnVerticalSpace;
    }
    
    [self createFourthRow:fourthOffsetY];
    
}

- (void)createFourthRow:(CGFloat)offsetY
{
    //距两边间距
    CGFloat sideSpace = kEMASCIIKeyboardBtnHorizontalSpace/2;
    CGFloat resignX = kEMScreenWidth-sideSpace-self.resignButtonWidth;
    CGFloat decimalX = resignX - self.buttonWeight - self.buttonSpace;
    for (int i = 0; i < 5; i ++) {
        EMKeyBoardButton *btn = [self createBtn];
        if (i == 0) {//切换数字键盘
            btn.keyBoardButtonType = EMKeyBoardButtonTypeToNumber;
            btn.frame = CGRectMake(sideSpace, offsetY, self.functionButtonWidth, self.buttonHeight);
        }else if (i == 4){//收起键盘
            btn.keyBoardButtonType = EMKeyBoardButtonTypeASCIIResign;
            btn.frame = CGRectMake(resignX, offsetY, self.resignButtonWidth, self.buttonHeight);
        }else if (i == 1){//逗号
            btn.keyBoardButtonType = EMKeyBoardButtonTypeComma;
            btn.frame = CGRectMake(sideSpace+self.functionButtonWidth+self.buttonSpace, offsetY, self.buttonWeight, self.buttonHeight);
        }else if(i == 3){//小数点
            btn.keyBoardButtonType = EMKeyBoardButtonTypeASCIIDecimal;
            btn.frame = CGRectMake(decimalX, offsetY, self.buttonWeight, self.buttonHeight);
        }else{//空格
            btn.keyBoardButtonType = EMKeyBoardButtonTypeASCIISpace;
            CGFloat x = sideSpace+self.functionButtonWidth+self.buttonSpace*2 + self.buttonWeight;
            btn.frame = CGRectMake(x, offsetY, kEMScreenWidth-2*x - self.buttonWeight - self.buttonSpace, self.buttonHeight);
        }
        
        [self addSubview:btn];
        
    }
}

- (EMKeyBoardButton *)createBtn
{
    EMKeyBoardButton *btn = [EMKeyBoardButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    return btn;
}


- (void)btnClick:(EMKeyBoardButton *)btn
{
    UIView <UITextInput> *textView = [UIResponder firstResponderTextView];
    switch (btn.keyBoardButtonType) {
        case EMKeyBoardButtonTypeLetter:{
            [self inputText:btn.titleLabel.text];
        }
            break;
        
        case EMKeyBoardButtonTypeASCIIDecimal:{
            [self inputText:btn.titleLabel.text];
        }
            break;
            
        case EMKeyBoardButtonTypeComma:{
            [self inputText:btn.titleLabel.text];
        }
            break;
            
        case EMKeyBoardButtonTypeASCIISpace:{
            [self inputText:@" "];
        }
            break;
            
        case EMKeyBoardButtonTypeToNumber:{//切换
            if (self.changeNumberBlock) {
                self.changeNumberBlock();
            }
        }
            break;
            
        case EMKeyBoardButtonTypeToggleCase:{//大小写转换
            [self keyBoardToggleCase:btn];
        }
            break;
            
        case EMKeyBoardButtonTypeASCIIDelete:{
            [textView deleteBackward];
        }
            break;
            
        case EMKeyBoardButtonTypeASCIIResign:{
            [textView resignFirstResponder];
        }
            break;
            
            
        default:
            break;
    }
}

- (void)inputText:(NSString *)text
{
    UIView <UITextInput> *textView = [UIResponder firstResponderTextView];
    NSString *character = [NSString stringWithString:text];
    if ([textView isKindOfClass:[UITextView class]] || [textView isKindOfClass:[UITextField class]]) {
        [textView insertText:character];
    }
}


/**
 切换大小写
 */
- (void)keyBoardToggleCase:(EMKeyBoardButton *)btn
{
    btn.selected = !btn.selected;
    for (UIView *subview in self.subviews) {
        if ([subview isKindOfClass:[EMKeyBoardButton class]]) {
            EMKeyBoardButton *subBtn = (EMKeyBoardButton *)subview;
            if (subBtn.keyBoardButtonType == EMKeyBoardButtonTypeLetter) {
                [subBtn setTitle:btn.isSelected ? [subBtn.titleLabel.text uppercaseString] : [subBtn.titleLabel.text lowercaseString] forState:UIControlStateNormal];
            }
        }
    }
}

/**
 按钮的宽度

 @return 按钮的宽度
 */
- (CGFloat)btnWidth
{
    return (kEMScreenWidth-self.buttonSpace*self.firstRowTitles.count)/self.firstRowTitles.count;
}


/**
 大小写切换，退格，切换数字键盘按钮宽度
 */
- (CGFloat)functionBtnWidth
{
    CGFloat functionBtnWidth = (kEMScreenWidth-self.thirdRowTitles.count*self.buttonWeight - (self.thirdRowTitles.count+2)*self.buttonSpace)/2;
    return functionBtnWidth;
}


/**
 收起键盘按钮宽度

 @return 收起键盘按钮宽度
 */
- (CGFloat)resignBtnWidth
{
    return self.buttonWeight + self.buttonSpace + self.functionButtonWidth;
}

@end
