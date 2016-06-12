//
//  WUEmoticonsKeyboardToolsView.h
//  WeicoUI
//
//  Created by Venus on 3/20/16.
//  Copyright (c) 2016 YuAo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WUEmoticonsKeyboardKeyItemGroup.h"

@interface WUEmoticonsKeyboardToolsView : UIView

@property (nonatomic,strong) NSArray *keyItemGroups;

@property (nonatomic,copy)   void    (^keyboardSwitchButtonTappedBlock)(void);
@property (nonatomic,copy)   void    (^backspaceButtonTappedBlock)(void);
@property (nonatomic,copy)   void    (^spaceButtonTappedBlock)(void);
@property (nonatomic,copy)   void    (^keyItemGroupSelectedBlock)(WUEmoticonsKeyboardKeyItemGroup *keyItemGroup);

@property (nonatomic,weak,readonly) UIButton *keyboardSwitchButton;
@property (nonatomic,weak,readonly) UIButton *backspaceButton;
@property (nonatomic,weak,readonly) UIButton *spaceButton;

@end
