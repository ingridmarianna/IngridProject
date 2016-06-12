//
//  LoginViewController.h
//  WUEmoticonsKeyboardDemo
//
//  Created by akira on 5/12/16.
//  Copyright (c) 2016 YuAo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtUserEmail;

@property (weak, nonatomic) IBOutlet UITextField *txtUserPassword;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end
