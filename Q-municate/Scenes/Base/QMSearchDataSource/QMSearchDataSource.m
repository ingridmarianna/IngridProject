//
//  QMSearchDataSource.m

//
//  Created by Hideki on 6/19/16.
//  Copyright © 2016 Hideki_Ingrid. All rights reserved.
//

#import "QMSearchDataSource.h"
#import "QMSearchDataProvider.h"

@implementation QMSearchDataSource

- (instancetype)initWithSearchDataProvider:(QMSearchDataProvider *)searchDataProvider {
    
    self = [super init];
    
    if (self) {
        
        _searchDataProvider = searchDataProvider;
        _searchDataProvider.dataSource = self;
    }
    
    return self;
}

@end
