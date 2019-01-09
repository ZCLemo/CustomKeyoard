//
//  EMKeyboardButton.m
//  AFNetworking
//
//  Created by zhaochen on 2019/1/3.
//  数字键盘按钮

#import "EMKeyboardButton.h"
#import "UIImage+EMColor.h"

@implementation EMKeyboardButton

- (void)setKeyboardButtonType:(EMKeyboardButtonType)KeyboardButtonType
{
    _KeyboardButtonType = KeyboardButtonType;
    
    [self setBackgroundImage:[UIImage imageWithColor:kEMKeyboardBtnHighhlightColor] forState:UIControlStateSelected];
    
    switch (KeyboardButtonType) {
        case EMKeyboardButtonTypeNumber:{
            [self configKeyboardButtonTypeWithIsFunctionKeyBoard:NO];
            [self configKeyboardButtonTypeWithisNumberKeyBoard:YES];
        }
            break;
            
        case EMKeyboardButtonTypeDelete:{
            [self setImage:[UIImage imageNamed:@"button_backspace_delete"] forState:UIControlStateNormal];
            [self configKeyboardButtonTypeWithIsFunctionKeyBoard:YES];
            [self configKeyboardButtonTypeWithisNumberKeyBoard:YES];
        }
            break;
            
        case EMKeyboardButtonTypeABC:{
            [self setTitle:@"ABC" forState:UIControlStateNormal];
            [self configKeyboardButtonTypeWithIsFunctionKeyBoard:YES];
            [self configKeyboardButtonTypeWithisNumberKeyBoard:YES];
        }
            break;
            
        case EMKeyboardButtonTypeResign:{
            [self setImage:[UIImage imageNamed:@"button_keyboard_shouqi"] forState:UIControlStateNormal];
            [self configKeyboardButtonTypeWithIsFunctionKeyBoard:YES];
            [self configKeyboardButtonTypeWithisNumberKeyBoard:YES];
        }
            break;
            
        case EMKeyboardButtonTypeComplete:{
            [self setTitle:@"完成" forState:UIControlStateNormal];
            [self configKeyboardButtonTypeWithIsFunctionKeyBoard:YES];
            [self configKeyboardButtonTypeWithisNumberKeyBoard:YES];
        }
            break;
            
        case EMKeyboardButtonTypeDecimal:{
            [self setTitle:@"." forState:UIControlStateNormal];
            [self configKeyboardButtonTypeWithIsFunctionKeyBoard:NO];
            [self configKeyboardButtonTypeWithisNumberKeyBoard:YES];
        }
            break;
            
        case EMKeyboardButtonTypeLetter:{
            [self configKeyboardButtonTypeWithIsFunctionKeyBoard:NO];
            [self configKeyboardButtonTypeWithisNumberKeyBoard:NO];
        }
            break;
            
        case EMKeyboardButtonTypeToggleCase:{
            [self configKeyboardButtonTypeWithIsFunctionKeyBoard:YES];
            [self configKeyboardButtonTypeWithisNumberKeyBoard:NO];
            [self setImage:[UIImage imageNamed:@"CH_EN_icon_unsel"] forState:UIControlStateNormal];
            [self setImage:[UIImage imageNamed:@"CH_EN_icon_sel"] forState:UIControlStateSelected];
        }
            break;
            
        case EMKeyboardButtonTypeASCIIDelete:{
            [self configKeyboardButtonTypeWithIsFunctionKeyBoard:YES];
            [self configKeyboardButtonTypeWithisNumberKeyBoard:NO];
            [self setImage:[UIImage imageNamed:@"button_backspace_delete"] forState:UIControlStateNormal];
        }
            break;
            
        case EMKeyboardButtonTypeComma:{
            [self configKeyboardButtonTypeWithIsFunctionKeyBoard:NO];
            [self configKeyboardButtonTypeWithisNumberKeyBoard:NO];
            [self setTitle:@"," forState:UIControlStateNormal];
        }
            break;
            
            
        case EMKeyboardButtonTypeToNumber:{
            [self configKeyboardButtonTypeWithIsFunctionKeyBoard:YES];
            [self configKeyboardButtonTypeWithisNumberKeyBoard:NO];
            [self setTitle:@"123" forState:UIControlStateNormal];
        }
            break;
            
            case EMKeyboardButtonTypeASCIIResign:{
                [self configKeyboardButtonTypeWithIsFunctionKeyBoard:YES];
                [self configKeyboardButtonTypeWithisNumberKeyBoard:NO];
                [self setImage:[UIImage imageNamed:@"button_keyboard_shouqi"] forState:UIControlStateNormal];
            }
            break;
            
            
        case EMKeyboardButtonTypeASCIIDecimal:{
            [self configKeyboardButtonTypeWithIsFunctionKeyBoard:NO];
            [self configKeyboardButtonTypeWithisNumberKeyBoard:NO];
            [self setTitle:@"." forState:UIControlStateNormal];
        }
            break;
            
        case EMKeyboardButtonTypeASCIISpace:{
            [self configKeyboardButtonTypeWithIsFunctionKeyBoard:YES];
            [self configKeyboardButtonTypeWithisNumberKeyBoard:NO];
            [self setTitle:@"空格" forState:UIControlStateNormal];
        }
            break;
            
        case EMKeyboardButtonTypeStockHeader600:{
            [self configStockBtn];
            [self configKeyboardButtonTypeWithisNumberKeyBoard:YES];
            [self setTitle:@"600" forState:UIControlStateNormal];
        }
            break;
            
        case EMKeyboardButtonTypeStockHeader601:{
            [self configStockBtn];
            [self configKeyboardButtonTypeWithisNumberKeyBoard:YES];
            [self setTitle:@"601" forState:UIControlStateNormal];
        }
            break;
            
        case EMKeyboardButtonTypeStockHeader000:{
            [self configStockBtn];
            [self configKeyboardButtonTypeWithisNumberKeyBoard:YES];
            [self setTitle:@"000" forState:UIControlStateNormal];
        }
            break;
            
        case EMKeyboardButtonTypeStockHeader002:{
            [self configStockBtn];
            [self configKeyboardButtonTypeWithisNumberKeyBoard:YES];
            [self setTitle:@"002" forState:UIControlStateNormal];
        }
            break;
            
        case EMKeyboardButtonTypeStockHeader300:{
            [self configStockBtn];
            [self configKeyboardButtonTypeWithisNumberKeyBoard:YES];
            [self setTitle:@"300" forState:UIControlStateNormal];
        }
            break;
            
        case EMKeyboardButtonTypeStockHeader00:{
            [self configStockBtn];
            [self configKeyboardButtonTypeWithisNumberKeyBoard:YES];
            [self setTitle:@"00" forState:UIControlStateNormal];
        }
            break;
            
            
        case EMKeyboardButtonTypeStockPositionFull:{
            [self configStockBtn];
            [self configKeyboardButtonTypeWithisNumberKeyBoard:YES];
            [self setTitle:@"全仓" forState:UIControlStateNormal];
        }
            break;
            
        case EMKeyboardButtonTypeStockPositionHalf:{
            [self configStockBtn];
            [self configKeyboardButtonTypeWithisNumberKeyBoard:YES];
            [self setTitle:@"半仓" forState:UIControlStateNormal];
        }
            break;
            
            
        case EMKeyboardButtonTypeStockPositionOneThird:{
            [self configStockBtn];
            [self configKeyboardButtonTypeWithisNumberKeyBoard:YES];
            [self setTitle:@"1/3仓" forState:UIControlStateNormal];
        }
            break;
            
        case EMKeyboardButtonTypeStockPositionQuartern:{
            [self configStockBtn];
            [self configKeyboardButtonTypeWithisNumberKeyBoard:YES];
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
- (void)configKeyboardButtonTypeWithisNumberKeyBoard:(BOOL)isNumberKeyBoard
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
- (void)configKeyboardButtonTypeWithIsFunctionKeyBoard:(BOOL)isFunctionKeyBoard
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
