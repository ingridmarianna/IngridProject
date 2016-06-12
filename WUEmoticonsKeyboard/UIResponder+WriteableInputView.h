//
//  UIResponder+writeableInputView.h
//  WeicoUI
//
///  Created by Venus on 3/20/16.
//  Copyright (c) 2016 YuAo. All rights reserved.//

#import <UIKit/UIKit.h>

@interface UIResponder (WriteableInputView)
@property (readwrite, retain) UIView *inputView;
@end
