//
//  ViewController.m
//  EMCustomKeyBoardDemo
//
//  Created by zhaochen on 2019/1/7.
//  Copyright © 2019年 zhaochen. All rights reserved.
//

#import "ViewController.h"
#import "EMCustomKeyboardView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *numberTF;

@property (weak, nonatomic) IBOutlet UITextField *asciiTF;

@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

@property (weak, nonatomic) IBOutlet UITextField *stockInputTF;

@property (weak, nonatomic) IBOutlet UITextField *stockPositionTF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    [self numberKeyboard];
    [self asciiKeyboard];
    [self secureKeyboard];
    [self stockInputKeyboard];
    [self stockPositionKeyboard];
    
}

- (void)numberKeyboard
{
    EMCustomKeyboardView *keyboardView = [[EMCustomKeyboardView alloc] init];
    keyboardView.keyboardType = EMCustomKeyboardTypeNumber;
    self.numberTF.inputView = keyboardView;
}

- (void)asciiKeyboard
{
    EMCustomKeyboardView *keyboardView = [[EMCustomKeyboardView alloc] init];
    keyboardView.keyboardType = EMCustomKeyboardTypeASCII;
    self.asciiTF.inputView = keyboardView;
}


- (void)secureKeyboard
{
    self.passwordTF.secureTextEntry = YES;
    EMCustomKeyboardView *keyboardView = [[EMCustomKeyboardView alloc] init];
    keyboardView.keyboardType = EMCustomKeyboardTypeSecury;
    self.passwordTF.inputView = keyboardView;
}

- (void)stockInputKeyboard
{
    EMCustomKeyboardView *keyboardView = [[EMCustomKeyboardView alloc] init];
    keyboardView.keyboardType = EMCustomKeyboardTypeStockInput;
    self.stockInputTF.inputView = keyboardView;
}

- (void)stockPositionKeyboard
{
    EMCustomKeyboardView *keyboardView = [[EMCustomKeyboardView alloc] init];
    keyboardView.keyboardType = EMCustomKeyboardTypeStockPosition;
    keyboardView.stockPositionBtnClickBlock = ^(EMKeyboardButtonType KeyboardButtonType) {
        switch (KeyboardButtonType) {
            case EMKeyboardButtonTypeStockPositionFull:
                NSLog(@"全仓");
                break;
                
            case EMKeyboardButtonTypeStockPositionHalf:
                NSLog(@"半仓");
                break;
                
            case EMKeyboardButtonTypeStockPositionOneThird:
                NSLog(@"1/3仓");
                break;
                
            case EMKeyboardButtonTypeStockPositionQuartern:
                NSLog(@"1/4仓");
                break;
                
            default:
                break;
        }
    };
    self.stockPositionTF.inputView = keyboardView;
}

@end
