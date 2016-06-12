//
//  WUEmoticonsKeyboardKeyItemGroup.m
//  WeicoUI
//
//  Created by Venus on 3/20/16.
//  Copyright (c) 2016 YuAo. All rights reserved.
//

#import "WUEmoticonsKeyboardKeyItemGroup.h"
#import "WUEmoticonsKeyboardKeyCell.h"
#import "WUEmoticonsKeyboardKeysPageFlowLayout.h"

@implementation WUEmoticonsKeyboardKeyItemGroup
@synthesize keyItemCellClass = _keyItemCellClass;

- (Class)keyItemCellClass {
    if (!_keyItemCellClass) {
        _keyItemCellClass = [WUEmoticonsKeyboardKeyCell class];
    }
    return _keyItemCellClass;
}

- (UICollectionViewLayout *)keyItemsLayout {
    if (!_keyItemsLayout) {
        WUEmoticonsKeyboardKeysPageFlowLayout *layout = [[WUEmoticonsKeyboardKeysPageFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(44, 44);
        layout.pageContentInsets = UIEdgeInsetsMake(5, 5, 5, 5);
        layout.itemSpacing = 0;
        layout.lineSpacing = 0;
        _keyItemsLayout = layout;
    }
    return _keyItemsLayout;
}

- (void)setKeyItemCellClass:(Class)keyItemCellClass {
    if ([keyItemCellClass isSubclassOfClass:[WUEmoticonsKeyboardKeyCell class]]) {
        _keyItemCellClass = keyItemCellClass;
    }else{
        NSAssert(NO, @"WUEmoticonsKeyboardKeyItemGroup: Setting keyItemCellClass - keyItemCellClass must be a subclass of WUEmoticonsKeyboardKeyCell.class");
    }
}

@end
