//
//  QMSearchDataProvider.m

//
//  Created by Hideki on 6/19/16.
//  Copyright © 2016 Hideki_Ingrid. All rights reserved.
//

#import "QMSearchDataProvider.h"

@implementation QMSearchDataProvider

- (void)performSearch:(NSString *)__unused searchText {
    
    if ([self.delegate respondsToSelector:@selector(searchDataProviderDidFinishDataFetching:)]) {
        
        [self.delegate searchDataProviderDidFinishDataFetching:self];
    }
}

@end
