//
//  UINavigationController+QMNotification.h

//
//  Created by Hideki on 5/19/16.
//  Copyright © 2016 Hideki_Ingrid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QMNotificationPanel.h"

@interface UINavigationController (QMNotification)

- (void)showNotificationWithType:(QMNotificationPanelType)notificationType message:(NSString *)message duration:(NSTimeInterval)duration;

- (void)dismissNotificationPanel;

- (void)shake;

@end
