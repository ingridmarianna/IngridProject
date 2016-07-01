//
//  QBUpdateUserParameters+CustomData.h

//
//  Created by Hideki on 9/28/15.
//  Copyright © 2015 Quickblox. All rights reserved.
//

#import <Quickblox/Quickblox.h>

@interface QBUpdateUserParameters (CustomData)

@property (copy, nonatomic) NSString *avatarUrl;
@property (copy, nonatomic) NSString *status;
@property (assign, nonatomic) BOOL isImport;

@end
