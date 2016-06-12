//
//  WUDemoViewController.h
//  WUEmoticonsKeyboardDemo
//
//  Created by Venus on 3/20/16.
//  Copyright (c) 2016 YuAo. All rights reserved.//

#import <UIKit/UIKit.h>
#import "JSQMessages.h"
#import "DemoModelData.h"
#import "NSUserDefaults+DemoSettings.h"


@class WUDemoViewController;

@protocol JSQWUDemoViewControllerDellegate <NSObject>

- (void)didDismissJSQWUDemoViewController:(WUDemoViewController *)vc;

@end

@interface WUDemoViewController : JSQMessagesViewController <UIActionSheetDelegate, JSQMessagesComposerTextViewPasteDelegate>


//+ (NSAttributedString *)attributedStringWithAttachment:(NSTextAttachment *)attachment;
@property (weak, nonatomic) id<JSQWUDemoViewControllerDellegate> delegateModal;

@property (strong, nonatomic) DemoModelData *demoData;

- (void)receiveMessagePressed:(UIBarButtonItem *)sender;

- (void)closePressed:(UIBarButtonItem *)sender;

@end
