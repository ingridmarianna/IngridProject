//
//  WUDemoKeyboardBuilder.m
//  WUEmoticonsKeyboardDemo
//
//  Created by Venus on 3/20/16.
//  Copyright (c) 2016 YuAo. All rights reserved.
//

#import "WUDemoKeyboardBuilder.h"
#import "WUDemoKeyboardTextKeyCell.h"
#import "WUDemoKeyboardPressedCellPopupView.h"
#import "WUDemoViewController.h"
#import "FLAnimatedImage.h"



@implementation WUDemoKeyboardBuilder

+ (WUEmoticonsKeyboard *)sharedEmoticonsKeyboard {
    static WUEmoticonsKeyboard *_sharedEmoticonsKeyboard;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //create a keyboard of default size
        WUEmoticonsKeyboard *keyboard = [WUEmoticonsKeyboard keyboard];
        
        //Icon keys
        WUEmoticonsKeyboardKeyItem *loveKey = [[WUEmoticonsKeyboardKeyItem alloc] init];
        loveKey.image = [UIImage imageNamed:@"love"];
        loveKey.textToInput = @"love";
        
        WUEmoticonsKeyboardKeyItem *applaudKey = [[WUEmoticonsKeyboardKeyItem alloc] init];
        applaudKey.image = [UIImage imageNamed:@"applaud"];
        applaudKey.textToInput = @"applaud";
        
        WUEmoticonsKeyboardKeyItem *weicoKey = [[WUEmoticonsKeyboardKeyItem alloc] init];
        weicoKey.image = [UIImage imageNamed:@"weico"];
        weicoKey.textToInput = @"weico";
        
        WUEmoticonsKeyboardKeyItem *unicornKey = [[WUEmoticonsKeyboardKeyItem alloc] init];
        unicornKey.image = [UIImage imageNamed:@"unicorn"];
        unicornKey.textToInput = @"unicorn";
        
        WUEmoticonsKeyboardKeyItem *pandaKey = [[WUEmoticonsKeyboardKeyItem alloc] init];
        pandaKey.image = [UIImage imageNamed:@"panda"];
        pandaKey.textToInput = @"panda";

        WUEmoticonsKeyboardKeyItem *firefoxKey = [[WUEmoticonsKeyboardKeyItem alloc] init];
        firefoxKey.image = [UIImage imageNamed:@"firefox"];
        firefoxKey.textToInput = @"firefox";
        
        WUEmoticonsKeyboardKeyItem *ballonKey = [[WUEmoticonsKeyboardKeyItem alloc] init];
        ballonKey.image = [UIImage imageNamed:@"ballon"];
        ballonKey.textToInput = @"ballon";
                
        WUEmoticonsKeyboardKeyItem *bear1Key = [[WUEmoticonsKeyboardKeyItem alloc] init];
        bear1Key.image = [UIImage imageNamed:@"bear1"];
        bear1Key.textToInput = @"bear1";
        
        WUEmoticonsKeyboardKeyItem *blueappleKey = [[WUEmoticonsKeyboardKeyItem alloc] init];
        blueappleKey.image = [UIImage imageNamed:@"blueapple"];
        blueappleKey.textToInput = @"blueapple";
        
        WUEmoticonsKeyboardKeyItem *dogKey = [[WUEmoticonsKeyboardKeyItem alloc] init];
        dogKey.image = [UIImage imageNamed:@"Angel.gif"];
        dogKey.textToInput = @"Angel";
        

//        WUEmoticonsKeyboardKeyItem *gifKey = [[WUEmoticonsKeyboardKeyItem alloc] init];
//        NSURL *url = [[NSBundle mainBundle] URLForResource:@"Thank you"withExtension:@"gif"];
//        NSLog(@"%@",url);
//        FLAnimatedImage *gif_image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:url]];
//        gifKey.animatedimage = gif_image;
//        gifKey.textToInput = @"Thank you";
        
        
        //Icon key group
        
        
        WUEmoticonsKeyboardKeyItemGroup *imageIconsGroup = [[WUEmoticonsKeyboardKeyItemGroup alloc] init];

        imageIconsGroup.keyItems = @[loveKey,applaudKey,weicoKey,unicornKey,ballonKey,firefoxKey,pandaKey,ballonKey,bear1Key,blueappleKey,dogKey];
        
        UIImage *keyboardEmotionImage = [UIImage imageNamed:@"keyboard_emotion"];
        UIImage *keyboardEmotionSelectedImage = [UIImage imageNamed:@"keyboard_emotion_selected"];
        
        if ([UIImage instancesRespondToSelector:@selector(imageWithRenderingMode:)]) {
            keyboardEmotionImage = [keyboardEmotionImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            keyboardEmotionSelectedImage = [keyboardEmotionSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }
        imageIconsGroup.image = keyboardEmotionImage;
        imageIconsGroup.selectedImage = keyboardEmotionSelectedImage;
        
        //Text keys
        NSArray *textKeys = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"EmotionTextKeys" ofType:@"plist"]];
        
        NSMutableArray *textKeyItems = [NSMutableArray array];
        for (NSString *text in textKeys) {
            WUEmoticonsKeyboardKeyItem *keyItem = [[WUEmoticonsKeyboardKeyItem alloc] init];
            keyItem.title = text;
            keyItem.textToInput = text;
            [textKeyItems addObject:keyItem];
        }
        
        //Text key group
        WUEmoticonsKeyboardKeysPageFlowLayout *textIconsLayout = [[WUEmoticonsKeyboardKeysPageFlowLayout alloc] init];
        textIconsLayout.itemSize = CGSizeMake(80, 142/3.0);
        textIconsLayout.itemSpacing = 0;
        textIconsLayout.lineSpacing = 0;
        textIconsLayout.pageContentInsets = UIEdgeInsetsMake(0,0,0,0);
        
        WUEmoticonsKeyboardKeyItemGroup *textIconsGroup = [[WUEmoticonsKeyboardKeyItemGroup alloc] init];
        textIconsGroup.keyItems = textKeyItems;
        textIconsGroup.keyItemsLayout = textIconsLayout;
        textIconsGroup.keyItemCellClass = WUDemoKeyboardTextKeyCell.class;
        
        UIImage *keyboardTextImage = [UIImage imageNamed:@"keyboard_text"];
        UIImage *keyboardTextSelectedImage = [UIImage imageNamed:@"keyboard_text_selected"];
        if ([UIImage instancesRespondToSelector:@selector(imageWithRenderingMode:)]) {
            keyboardTextImage = [keyboardTextImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            keyboardTextSelectedImage = [keyboardTextSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }
        textIconsGroup.image = keyboardTextImage;
        textIconsGroup.selectedImage = keyboardTextSelectedImage;
        
        
        //Set keyItemGroups
        keyboard.keyItemGroups = @[imageIconsGroup,textIconsGroup];
        
        //Setup cell popup view
        [keyboard setKeyItemGroupPressedKeyCellChangedBlock:^(WUEmoticonsKeyboardKeyItemGroup *keyItemGroup, WUEmoticonsKeyboardKeyCell *fromCell, WUEmoticonsKeyboardKeyCell *toCell) {
            [WUDemoKeyboardBuilder sharedEmotionsKeyboardKeyItemGroup:keyItemGroup pressedKeyCellChangedFromCell:fromCell toCell:toCell];
        }];
        

        //Keyboard appearance
        
        //Custom text icons scroll background
        if (textIconsLayout.collectionView) {
            UIView *textGridBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [textIconsLayout collectionViewContentSize].width, [textIconsLayout collectionViewContentSize].height)];
            textGridBackgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            textGridBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"keyboard_grid_bg"]];
            [textIconsLayout.collectionView addSubview:textGridBackgroundView];
        }
        
        //Custom utility keys
        [keyboard setImage:[UIImage imageNamed:@"keyboard_switch"] forButton:WUEmoticonsKeyboardButtonKeyboardSwitch state:UIControlStateNormal];
        [keyboard setImage:[UIImage imageNamed:@"keyboard_del"] forButton:WUEmoticonsKeyboardButtonBackspace state:UIControlStateNormal];
        [keyboard setImage:[UIImage imageNamed:@"keyboard_switch_pressed"] forButton:WUEmoticonsKeyboardButtonKeyboardSwitch state:UIControlStateHighlighted];
        [keyboard setImage:[UIImage imageNamed:@"keyboard_del_pressed"] forButton:WUEmoticonsKeyboardButtonBackspace state:UIControlStateHighlighted];
        [keyboard setAttributedTitle:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"Space",@"") attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15], NSForegroundColorAttributeName: [UIColor darkGrayColor]}] forButton:WUEmoticonsKeyboardButtonSpace state:UIControlStateNormal];
        [keyboard setBackgroundImage:[[UIImage imageNamed:@"keyboard_segment_normal"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10, 0, 10)] forButton:WUEmoticonsKeyboardButtonSpace state:UIControlStateNormal];

        //Keyboard background
        [keyboard setBackgroundImage:[[UIImage imageNamed:@"keyboard_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 1, 0, 1)]];
        
        //SegmentedControl
        [[UISegmentedControl appearanceWhenContainedIn:[WUEmoticonsKeyboard class], nil] setBackgroundImage:[[UIImage imageNamed:@"keyboard_segment_normal"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10, 0, 10)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [[UISegmentedControl appearanceWhenContainedIn:[WUEmoticonsKeyboard class], nil] setBackgroundImage:[[UIImage imageNamed:@"keyboard_segment_selected"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10, 0, 10)] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        [[UISegmentedControl appearanceWhenContainedIn:[WUEmoticonsKeyboard class], nil] setDividerImage:[UIImage imageNamed:@"keyboard_segment_normal_selected"] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        [[UISegmentedControl appearanceWhenContainedIn:[WUEmoticonsKeyboard class], nil] setDividerImage:[UIImage imageNamed:@"keyboard_segment_selected_normal"] forLeftSegmentState:UIControlStateSelected rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
                
        _sharedEmoticonsKeyboard = keyboard;
    });
    return _sharedEmoticonsKeyboard;
}

+ (void)sharedEmotionsKeyboardKeyItemGroup:(WUEmoticonsKeyboardKeyItemGroup *)keyItemGroup
             pressedKeyCellChangedFromCell:(WUEmoticonsKeyboardKeyCell *)fromCell
                                    toCell:(WUEmoticonsKeyboardKeyCell *)toCell
{
    static WUDemoKeyboardPressedCellPopupView *pressedKeyCellPopupView;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pressedKeyCellPopupView = [[WUDemoKeyboardPressedCellPopupView alloc] initWithFrame:CGRectMake(0, 0, 83, 110)];
        pressedKeyCellPopupView.hidden = YES;
        [[self sharedEmoticonsKeyboard] addSubview:pressedKeyCellPopupView];
    });
    
    if ([[self sharedEmoticonsKeyboard].keyItemGroups indexOfObject:keyItemGroup] == 0) {
        [[self sharedEmoticonsKeyboard] bringSubviewToFront:pressedKeyCellPopupView];
        if (toCell) {
            pressedKeyCellPopupView.keyItem = toCell.keyItem;
            pressedKeyCellPopupView.hidden = NO;
            CGRect frame = [[self sharedEmoticonsKeyboard] convertRect:toCell.bounds fromView:toCell];
            pressedKeyCellPopupView.center = CGPointMake(CGRectGetMidX(frame), CGRectGetMaxY(frame)-CGRectGetHeight(pressedKeyCellPopupView.frame)/2);
        }else{
            pressedKeyCellPopupView.hidden = YES;
        }
    }
}

@end
