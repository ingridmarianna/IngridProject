//
//  WUAppDelegate.m
//  WUEmoticonsKeyboardDemo
//
//  Created by YuAo on 7/20/13.
//  Copyright (c) 2013 YuAo. All rights reserved.
//

#import "WUAppDelegate.h"
#import "NSUserDefaults+Demosettings.h"

@implementation WUAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Load our default settings
    [NSUserDefaults saveIncomingAvatarSetting:YES];
    [NSUserDefaults saveOutgoingAvatarSetting:YES];
    
    return YES;
}


@end

int main(int argc, char *argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([WUAppDelegate class]));
    }
}
