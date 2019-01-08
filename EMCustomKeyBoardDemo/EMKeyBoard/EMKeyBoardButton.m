//
//  EMKeyBoardButton.m
//  AFNetworking
//
//  Created by zhaochen on 2019/1/3.
//  数字键盘按钮

#import "EMKeyBoardButton.h"
#import "UIImage+EMColor.h"

@implementation EMKeyBoardButton

- (void)setKeyBoardButtonType:(EMKeyBoardButtonType)keyBoardButtonType
{
    _keyBoardButtonType = keyBoardButtonType;
    
    [self setBackgroundImage:[UIImage imageWithColor:kEMKeyboardBtnHighhlightColor] forState:UIControlStateSelected];
    
    switch (keyBoardButtonType) {
        case EMKeyBoardButtonTypeNumber:{
            [self configKeyBoardButtonTypeWithIsFunctionKeyBoard:NO];
            [self configKeyBoardButtonTypeWithisNumberKeyBoard:YES];
        }
            break;
            
        case EMKeyBoardButtonTypeDelete:{
            [self setImage:[UIImage imageNamed:@"button_backspace_delete"] forState:UIControlStateNormal];
            [self configKeyBoardButtonTypeWithIsFunctionKeyBoard:YES];
            [self configKeyBoardButtonTypeWithisNumberKeyBoard:YES];
        }
            break;
            
        case EMKeyBoardButtonTypeABC:{
            [self setTitle:@"ABC" forState:UIControlStateNormal];
            [self configKeyBoardButtonTypeWithIsFunctionKeyBoard:YES];
            [self configKeyBoardButtonTypeWithisNumberKeyBoard:YES];
        }
            break;
            
        case EMKeyBoardButtonTypeResign:{
            [self setImage:[UIImage imageNamed:@"button_keyboard_shouqi"] forState:UIControlStateNormal];
            [self configKeyBoardButtonTypeWithIsFunctionKeyBoard:YES];
            [self configKeyBoardButtonTypeWithisNumberKeyBoard:YES];
        }
            break;
            
        case EMKeyBoardButtonTypeComplete:{
            [self setTitle:@"完成" forState:UIControlStateNormal];
            [self configKeyBoardButtonTypeWithIsFunctionKeyBoard:YES];
            [self configKeyBoardButtonTypeWithisNumberKeyBoard:YES];
        }
            break;
            
        case EMKeyBoardButtonTypeDecimal:{
            [self setTitle:@"." forState:UIControlStateNormal];
            [self configKeyBoardButtonTypeWithIsFunctionKeyBoard:NO];
            [self configKeyBoardButtonTypeWithisNumberKeyBoard:YES];
        }
            break;
            
        case EMKeyBoardButtonTypeLetter:{
            [self configKeyBoardButtonTypeWithIsFunctionKeyBoard:NO];
            [self configKeyBoardButtonTypeWithisNumberKeyBoard:NO];
        }
            break;
            
        case EMKeyBoardButtonTypeToggleCase:{
            [self configKeyBoardButtonTypeWithIsFunctionKeyBoard:YES];
            [self configKeyBoardButtonTypeWithisNumberKeyBoard:NO];
            [self setImage:[UIImage imageNamed:@"CH_EN_icon_unsel"] forState:UIControlStateNormal];
            [self setImage:[UIImage imageNamed:@"CH_EN_icon_sel"] forState:UIControlStateSelected];
        }
            break;
            
        case EMKeyBoardButtonTypeASCIIDelete:{
            [self configKeyBoardButtonTypeWithIsFunctionKeyBoard:YES];
            [self configKeyBoardButtonTypeWithisNumberKeyBoard:NO];
            [self setImage:[UIImage imageNamed:@"button_backspace_delete"] forState:UIControlStateNormal];
        }
            break;
            
        case EMKeyBoardButtonTypeComma:{
            [self configKeyBoardButtonTypeWithIsFunctionKeyBoard:NO];
            [self configKeyBoardButtonTypeWithisNumberKeyBoard:NO];
            [self setTitle:@"," forState:UIControlStateNormal];
        }
            break;
            
            
        case EMKeyBoardButtonTypeToNumber:{
            [self configKeyBoardButtonTypeWithIsFunctionKeyBoard:YES];
            [self configKeyBoardButtonTypeWithisNumberKeyBoard:NO];
            [self setTitle:@"123" forState:UIControlStateNormal];
        }
            break;
            
            case EMKeyBoardButtonTypeASCIIResign:{
                [self configKeyBoardButtonTypeWithIsFunctionKeyBoard:YES];
                [self configKeyBoardButtonTypeWithisNumberKeyBoard:NO];
                [self setImage:[UIImage imageNamed:@"button_keyboard_shouqi"] forState:UIControlStateNormal];
            }
            break;
            
            
        case EMKeyBoardButtonTypeASCIIDecimal:{
            [self configKeyBoardButtonTypeWithIsFunctionKeyBoard:NO];
            [self configKeyBoardButtonTypeWithisNumberKeyBoard:NO];
            [self setTitle:@"." forState:UIControlStateNormal];
        }
            break;
            
        case EMKeyBoardButtonTypeASCIISpace:{
            [self configKeyBoardButtonTypeWithIsFunctionKeyBoard:YES];
            [self configKeyBoardButtonTypeWithisNumberKeyBoard:NO];
            [self setTitle:@"空格" forState:UIControlStateNormal];
        }
            break;
            
        case EMKeyBoardButtonTypeStockHeader600:{
            [self configStockBtn];
            [self configKeyBoardButtonTypeWithisNumberKeyBoard:YES];
            [self setTitle:@"600" forState:UIControlStateNormal];
        }
            break;
            
        case EMKeyBoardButtonTypeStockHeader601:{
            [self configStockBtn];
            [self configKeyBoardButtonTypeWithisNumberKeyBoard:YES];
            [self setTitle:@"601" forState:UIControlStateNormal];
        }
            break;
            
        case EMKeyBoardButtonTypeStockHeader000:{
            [self configStockBtn];
            [self configKeyBoardButtonTypeWithisNumberKeyBoard:YES];
            [self setTitle:@"000" forState:UIControlStateNormal];
        }
            break;
            
        case EMKeyBoardButtonTypeStockHeader002:{
            [self configStockBtn];
            [self configKeyBoardButtonTypeWithisNumberKeyBoard:YES];
            [self setTitle:@"002" forState:UIControlStateNormal];
        }
            break;
            
        case EMKeyBoardButtonTypeStockHeader300:{
            [self configStockBtn];
            [self configKeyBoardButtonTypeWithisNumberKeyBoard:YES];
            [self setTitle:@"300" forState:UIControlStateNormal];
        }
            break;
            
        case EMKeyBoardButtonTypeStockHeader00:{
            [self configStockBtn];
            [self configKeyBoardButtonTypeWithisNumberKeyBoard:YES];
            [self setTitle:@"00" forState:UIControlStateNormal];
        }
            break;
            
            
        case EMKeyBoardButtonTypeStockPositionFull:{
            [self configStockBtn];
            [self configKeyBoardButtonTypeWithisNumberKeyBoard:YES];
            [self setTitle:@"全仓" forState:UIControlStateNormal];
        }
            break;
            
        case EMKeyBoardButtonTypeStockPositionHalf:{
            [self configStockBtn];
            [self configKeyBoardButtonTypeWithisNumberKeyBoard:YES];
            [self setTitle:@"半仓" forState:UIControlStateNormal];
        }
            break;
            
            
        case EMKeyBoardButtonTypeStockPositionOneThird:{
            [self configStockBtn];
            [self configKeyBoardButtonTypeWithisNumberKeyBoard:YES];
            [self setTitle:@"1/3仓" forState:UIControlStateNormal];
        }
            break;
            
        case EMKeyBoardButtonTypeStockPositionQuartern:{
            [self configStockBtn];
            [self configKeyBoardButtonTypeWithisNumberKeyBoard:YES];
            [self setTitle:@"1/4仓" forState:UIControlStateNormal];
        }
            break;
            
            
        default:
            break;
    }
}


/**
 数字键盘和字母键盘按钮样式

 @param isNumberKeyBoard 是否是数字键盘
 */
- (void)configKeyBoardButtonTypeWithisNumberKeyBoard:(BOOL)isNumberKeyBoard
{
    if (isNumberKeyBoard) {
        self.layer.borderWidth = kEMASCIIKeyboardBtnBorderWith;
        self.layer.borderColor = [kEMKeyboardBtnLayerColor CGColor];
    }else{
        self.layer.cornerRadius = kEMASCIIKeyboardBtnCornerRadius;
        self.clipsToBounds = YES;
    }
}



/**
 功能按钮和可输入按钮样式

 @param isFunctionKeyBoard 是否是功能按钮
 */
- (void)configKeyBoardButtonTypeWithIsFunctionKeyBoard:(BOOL)isFunctionKeyBoard
{
    if (isFunctionKeyBoard) {
        [self setTitleColor:kEMKeyboardBtnLightTitleColor forState:UIControlStateNormal];
        self.titleLabel.font = kEMKeyboardBtnSmallFont;
        [self setBackgroundImage:[UIImage imageWithColor:kEMKeyboardBtnDefaultColor] forState:UIControlStateNormal];
        
    }else{
        [self setTitleColor:kEMKeyboardBtnDarkTitleColor forState:UIControlStateNormal];
        self.titleLabel.font = kEMKeyboardBtnBigFont;
        [self setBackgroundImage:[UIImage imageWithColor:kEMKeyboardBtnWhiteColor] forState:UIControlStateNormal];
    }
}


/**
 股票相关的操作按钮
 */
- (void)configStockBtn
{
    [self setTitleColor:kEMKeyboardBtnLightTitleColor forState:UIControlStateNormal];
    self.titleLabel.font = kEMKeyboardBtnSmallFont;
    [self setBackgroundImage:[UIImage imageWithColor:kEMKeyboardBtnWhiteColor] forState:UIControlStateNormal];
}

@end
