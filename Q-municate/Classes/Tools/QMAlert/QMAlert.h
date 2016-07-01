//
//  QMAlert.h

//
//  Created by Hideki on 5/20/16.
//  Copyright © 2016 Hideki_Ingrid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QMAlert : NSObject

+ (void)showAlertWithMessage:(NSString *)message actionSuccess:(BOOL)success inViewController:(UIViewController *)viewController;

@end
