//
//  QMSearchDataSource.h

//
//  Created by Hideki on 6/19/16.
//  Copyright © 2016 Hideki_Ingrid. All rights reserved.
//

#import "QMTableViewDatasource.h"

@interface QMSearchDataSource : QMTableViewDataSource

@property (strong, nonatomic) QMSearchDataProvider *searchDataProvider;

- (instancetype)initWithSearchDataProvider:(QMSearchDataProvider *)searchDataProvider;

@end
