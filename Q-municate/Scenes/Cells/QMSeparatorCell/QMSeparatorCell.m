//
//  QMSeparatorCell.m

//
//  Created by Hideki on 4/7/16.
//  Copyright © 2016 Hideki_Ingrid. All rights reserved.
//

#import "QMSeparatorCell.h"
#import "QMShadowView.h"

@implementation QMSeparatorCell

+ (CGFloat)height {
    
    return 32.0f;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    QMShadowView *shadowView = [[QMShadowView alloc] initWithFrame:CGRectMake(0,
                                                                              0,
                                                                              CGRectGetWidth(self.frame),
                                                                              kQMShadowViewHeight)];
    [self.contentView addSubview:shadowView];
}

- (UIEdgeInsets)layoutMargins {
    
    return UIEdgeInsetsZero;
}

@end
