//
//  NSUserDefalts+Demosettings.m
//  WUEmoticonsKeyboardDemo
//
//  Created by Frans Hennix on 05/06/16.
//  Copyright © 2016 YuAo. All rights reserved.
//

#import "NSUserDefaults+Demosettings.h"


static NSString * const kSettingExtraMessages = @"kSettingExtraMessages";
static NSString * const kSettingLongMessage = @"kSettingLongMessage";
static NSString * const kSettingEmptyMessages = @"kSettingEmptyMessages";
static NSString * const kSettingSpringiness = @"kSettingSpringiness";
static NSString * const kSettingIncomingAvatar = @"kSettingIncomingAvatar";
static NSString * const kSettingOutgoingAvatar = @"kSettingOutgoingAvatar";

@implementation NSUserDefaults (Demosettings)

+ (void)saveExtraMessagesSetting:(BOOL)value
{
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:kSettingExtraMessages];
}

+ (BOOL)extraMessagesSetting
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kSettingExtraMessages];
}

+ (void)saveLongMessageSetting:(BOOL)value
{
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:kSettingLongMessage];
}

+ (BOOL)longMessageSetting
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kSettingLongMessage];
}

+ (void)saveEmptyMessagesSetting:(BOOL)value
{
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:kSettingEmptyMessages];
}

+ (BOOL)emptyMessagesSetting
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kSettingEmptyMessages];
}

+ (void)saveSpringinessSetting:(BOOL)value
{
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:kSettingSpringiness];
}

+ (BOOL)springinessSetting
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kSettingSpringiness];
}

+ (void)saveOutgoingAvatarSetting:(BOOL)value
{
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:kSettingOutgoingAvatar];
}

+ (BOOL)outgoingAvatarSetting
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kSettingOutgoingAvatar];
}

+ (void)saveIncomingAvatarSetting:(BOOL)value
{
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:kSettingIncomingAvatar];
}

+ (BOOL)incomingAvatarSetting
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kSettingIncomingAvatar];
}


@end
