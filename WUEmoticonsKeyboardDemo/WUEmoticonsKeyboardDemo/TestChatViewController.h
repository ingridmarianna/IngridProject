//
//  TestChatViewController.h
//  WUEmoticonsKeyboardDemo
//
//  Created by AkiraYoshida on 6/11/16.
//  Copyright © 2016 YuAo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSQMessages.h"
#import "DemoModelData.h"
#import "NSUserDefaults+DemoSettings.h"


@class TestChatViewController;

@protocol JSQTestChatViewControllerDelegate <NSObject>

- (void)didDismissJSQDemoViewController:(TestChatViewController *)vc;

@end


@interface TestChatViewController : JSQMessagesViewController <UIActionSheetDelegate, JSQMessagesComposerTextViewPasteDelegate>

@property (weak, nonatomic) id<JSQTestChatViewControllerDelegate> delegateModal;

@property (strong, nonatomic) DemoModelData *demoData;

- (void)receiveMessagePressed:(UIBarButtonItem *)sender;

- (void)closePressed:(UIBarButtonItem *)sender;

@end
