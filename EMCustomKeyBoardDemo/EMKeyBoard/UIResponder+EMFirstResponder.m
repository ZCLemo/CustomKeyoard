//
//  UIResponder+EMFirstResponder.m
//  AFNetworking
//
//  Created by zhaochen on 2019/1/3.
//

#import "UIResponder+EMFirstResponder.h"

@implementation UIResponder (EMFirstResponder)

static __weak id EMTradeCurrentFirstResponder;

+ (UIView <UITextInput> *)firstResponderTextView
{
    UIView <UITextInput> *textInput = (UIView <UITextInput> *)[UIResponder EMTradeCurrentFirstResponder];
    
    if ([textInput conformsToProtocol:@protocol(UIKeyInput)]) {
        return textInput;
    }
    return nil;
}

+ (UIResponder *)EMTradeCurrentFirstResponder {
    EMTradeCurrentFirstResponder = nil;
    [[UIApplication sharedApplication] sendAction:@selector(findEMTradeFirstResponder:) to:nil from:nil forEvent:nil];
    
    return EMTradeCurrentFirstResponder;
}

- (UIResponder *)EMTradeCurrentFirstResponder {
    return [[self class] EMTradeCurrentFirstResponder];
}

- (void)findEMTradeFirstResponder:(id)sender {
    EMTradeCurrentFirstResponder = self;
}

@end
