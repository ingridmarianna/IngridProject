//
//  QMPlaceholderDataSource.m

//
//  Created by Hideki on 1/14/16.
//  Copyright © 2016 Hideki_Ingrid. All rights reserved.
//

#import "QMPlaceholderDataSource.h"

NSString *const kQMPlaceHolderCell = @"QMPlaceholderCell";

@implementation QMPlaceholderDataSource

- (NSInteger)tableView:(UITableView *)__unused tableView numberOfRowsInSection:(NSInteger)__unused section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kQMPlaceHolderCell forIndexPath:indexPath];
    return cell;
}

@end
