//
//  QMPlaceholder.h

//
//  Created by Hideki on 1/14/16.
//  Copyright © 2016 Hideki_Ingrid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QMPlaceholder : NSObject

+ (UIImage *)placeholderWithFrame:(CGRect)frame
                            title:(NSString *)title
                               ID:(NSUInteger)ID;

@end
