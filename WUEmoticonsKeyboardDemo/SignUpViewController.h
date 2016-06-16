//
//  SignUpViewController.h
//  WUEmoticonsKeyboardDemo
//
//  Created by Star_Venus on 4/24/16.
//  Copyright © 2016 YuAo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController<UINavigationControllerDelegate,UITextFieldDelegate,UIImagePickerControllerDelegate>


@property (weak, nonatomic) IBOutlet UITextField *txtUserName;

@property (weak, nonatomic) IBOutlet UITextField *txtUserEmail;

@property (weak, nonatomic) IBOutlet UITextField *txtUserPhoneNumber;

@property (weak, nonatomic) IBOutlet UITextField *txtUserPassword;

@property (weak, nonatomic) IBOutlet UIButton *btnSignUp;

@property (weak, nonatomic) IBOutlet UIImageView *UserImage;


@end
