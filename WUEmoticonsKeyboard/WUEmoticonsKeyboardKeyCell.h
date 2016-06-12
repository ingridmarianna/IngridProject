//
//  WUEmoticonsKeyboardKeyCell.h
//  WeicoUI
//
//  Created by Venus on 3/20/16.
//  Copyright (c) 2016 YuAo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WUEmoticonsKeyboardKeyItem.h"

@interface WUEmoticonsKeyboardKeyCell : UICollectionViewCell
@property (nonatomic,weak,readonly) UIButton *keyButton;
@property (nonatomic,strong) WUEmoticonsKeyboardKeyItem *keyItem;
@end
