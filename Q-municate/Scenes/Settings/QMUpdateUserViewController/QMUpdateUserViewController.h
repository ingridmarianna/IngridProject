//
//  QMUpdateUserViewController.h

//
//  Created by Hideki on 5/6/16.
//  Copyright © 2016 Hideki_Ingrid. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, QMUpdateUserField) {
    
    QMUpdateUserFieldNone,
    QMUpdateUserFieldFullName,
    QMUpdateUserFieldEmail,
    QMUpdateUserFieldStatus
};

@interface QMUpdateUserViewController : UITableViewController

@property (assign, nonatomic) QMUpdateUserField updateUserField;

@end
