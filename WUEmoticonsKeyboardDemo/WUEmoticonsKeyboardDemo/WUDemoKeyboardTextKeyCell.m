//
//  WPEmoticonsKeyboardTextKeyCell.m
//  WeicoPlusUniversal
//
//  Created by Venus on 3/20/16.
//  Copyright (c) 2016 YuAo. All rights reserved.//

#import "WUDemoKeyboardTextKeyCell.h"

@implementation WUDemoKeyboardTextKeyCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.keyButton.bounds = self.bounds;
        self.keyButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.keyButton setTitleColor:[UIColor colorWithWhite:41/255.0 alpha:1] forState:UIControlStateNormal];
    }
    return self;
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if (selected) {
        self.backgroundColor = [UIColor lightGrayColor];
    }else{
        self.backgroundColor = nil;
    }
}

@end
