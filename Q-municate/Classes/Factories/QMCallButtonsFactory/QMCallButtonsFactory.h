//
//  QMCallButtonsFactory.h

//
//  Created by Hideki on 5/10/16.
//  Copyright © 2016 Hideki_Ingrid. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  QMCallButtonsFactory class interface.
 *  Used as call buttons initializer for QMCallToolbar.
 *
 *  @see QMCallViewController class, QMCallToolbar class.
 */
@interface QMCallButtonsFactory : NSObject

+ (UIButton *)acceptButton;
+ (UIButton *)acceptVideoCallButton;
+ (UIButton *)declineButton;
+ (UIButton *)declineVideoCallButton;
+ (UIButton *)muteAudioCallButton;
+ (UIButton *)muteVideoCallButton;
+ (UIButton *)speakerButton;
+ (UIButton *)cameraButton;
+ (UIButton *)cameraRotationButton;

@end
