//
//  WUEmoticonsKeyboardKeyItemGroup.h
//  WeicoUI
//
//  Created by Venus on 3/20/16.
//  Copyright (c) 2016 YuAo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WUEmoticonsKeyboardKeyItemGroup : NSObject

@property (nonatomic,copy)              NSString                 *title;
@property (nonatomic,strong)            UIImage                  *image;
@property (nonatomic,strong)            UIImage                  *selectedImage;

@property (nonatomic,strong)            NSArray                  *keyItems;

/* CollectionViewLayout for this keyItemGroup, this property has a default value. Using WUEmoticonsKeyboardKeysPageFlowLayout is recommanded. */
@property (nonatomic,strong)            UICollectionViewLayout   *keyItemsLayout;

/* CollectionViewCell class for this keyItemGroup. default is WUEmoticonsKeyboardKeyCell.class */
@property (nonatomic,unsafe_unretained) Class                     keyItemCellClass;

@end
