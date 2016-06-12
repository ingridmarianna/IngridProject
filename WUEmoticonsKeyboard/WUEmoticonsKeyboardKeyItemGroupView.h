//
//  WUEmoticonsKeyboardKeyItemGroupView.h
//  WeicoUI
//
//  Created by Venus on 3/20/16.
//  Copyright (c) 2016 YuAo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WUEmoticonsKeyboardKeyItemGroup.h"
#import "WUEmoticonsKeyboardKeyItem.h"
#import "WUEmoticonsKeyboardKeyCell.h"

@interface WUEmoticonsKeyboardKeyItemGroupView : UIView
@property (nonatomic,strong)        WUEmoticonsKeyboardKeyItemGroup *keyItemGroup;
@property (nonatomic,copy)          void                            (^keyItemTappedBlock)(WUEmoticonsKeyboardKeyItem *keyItem);
@property (nonatomic,copy)          void                            (^pressedKeyItemCellChangedBlock)(WUEmoticonsKeyboardKeyCell *fromKeyCell, WUEmoticonsKeyboardKeyCell *toKeyCell);
@property (nonatomic,weak,readonly) UIImageView                     *backgroundImageView;
@end
