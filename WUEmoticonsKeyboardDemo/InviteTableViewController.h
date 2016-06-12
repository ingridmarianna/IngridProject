//
//  InviteTableViewController.h
//  WUEmoticonsKeyboardDemo
//
//  Created by Star_Venus on 4/24/16.
//  Copyright © 2016 YuAo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface InviteTableViewController : UITableViewController <MFMailComposeViewControllerDelegate>

{
    MFMailComposeViewController *mailComposer;
}

@property (weak, nonatomic) IBOutlet UIButton *InviteBtn;

@end
