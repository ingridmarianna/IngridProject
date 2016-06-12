//
//  TableViewController.h
//  WUEmoticonsKeyboardDemo
//
//  Created by AkiraYoshida on 6/11/16.
//  Copyright © 2016 YuAo. All rights reserved.
//



#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TestChatViewController.h"

@interface TableViewController : UITableViewController <JSQTestChatViewControllerDelegate>

- (IBAction)unwindSegue:(UIStoryboardSegue *)sender;

@end
