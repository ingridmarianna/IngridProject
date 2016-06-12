//
//  NSUserDefalts+Demosettings.h
//  WUEmoticonsKeyboardDemo
//
//  Created by Frans Hennix on 05/06/16.
//  Copyright © 2016 YuAo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Demosettings)

+ (void)saveExtraMessagesSetting:(BOOL)value;
+ (BOOL)extraMessagesSetting;

+ (void)saveLongMessageSetting:(BOOL)value;
+ (BOOL)longMessageSetting;

+ (void)saveEmptyMessagesSetting:(BOOL)value;
+ (BOOL)emptyMessagesSetting;

+ (void)saveSpringinessSetting:(BOOL)value;
+ (BOOL)springinessSetting;

+ (void)saveOutgoingAvatarSetting:(BOOL)value;
+ (BOOL)outgoingAvatarSetting;

+ (void)saveIncomingAvatarSetting:(BOOL)value;
+ (BOOL)incomingAvatarSetting;

@end
