//
//  UIResponder+EMFirstResponder.h
//  AFNetworking
//
//  Created by zhaochen on 2019/1/3.
//

#import <UIKit/UIKit.h>

@interface UIResponder (EMFirstResponder)

+ (UIResponder *)EMTradeCurrentFirstResponder;

+ (UIView <UITextInput> *)firstResponderTextView;

@end

