//
//  NSArray+Intersection.m

//
//  Created by Hideki on 4/7/16.
//  Copyright © 2016 Hideki_Ingrid. All rights reserved.
//

#import "NSArray+Intersection.h"

@implementation NSArray (Intersection)

- (BOOL)qm_containsObjectFromArray:(NSArray *)array {
    
    NSMutableSet *baseSet = [NSMutableSet setWithArray:self];
    NSMutableSet *fromSet = [NSMutableSet setWithArray:array];
    
    return [baseSet intersectsSet:fromSet];
}

@end
