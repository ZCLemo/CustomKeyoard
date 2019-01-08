//
//  EMASCIIKeyBoard.h
//  AFNetworking
//
//  Created by zhaochen on 2019/1/3.
//

#import <UIKit/UIKit.h>

typedef void(^EMChangeNumberKeyBoardBlock)(void);

@interface EMASCIIKeyBoard : UIView

@property (nonatomic,copy)EMChangeNumberKeyBoardBlock changeNumberBlock;

@end

