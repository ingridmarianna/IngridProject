//
//  WUEmoticonsKeyboardKeyItem.h
//  WeicoUI
//
//  Created by Venus on 3/20/16.
//  Copyright (c) 2016 YuAo. All rights reserved.//

#import <Foundation/Foundation.h>
#import "FLAnimatedImage.h"

@interface WUEmoticonsKeyboardKeyItem : NSObject
@property (nonatomic,copy)    NSString *title;
@property (nonatomic,strong)  UIImage  *image;
@property (nonatomic,strong)  FLAnimatedImage *animatedimage;
@property (nonatomic,copy)    NSString *textToInput;
@end
