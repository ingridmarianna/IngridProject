//
//  QMGlobalSearchDataProvider.h

//
//  Created by Hideki on 3/3/16.
//  Copyright © 2016 Hideki_Ingrid. All rights reserved.
//

#import "QMSearchDataProvider.h"

@interface QMGlobalSearchDataProvider : QMSearchDataProvider

- (void)nextPage;
- (void)cancel;

@end

@protocol QMGlobalSearchDataProviderProtocol <NSObject>

- (QMGlobalSearchDataProvider *)globalSearchDataProvider;

@end
