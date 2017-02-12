//
//  SortServiceImplementation.m
//  RSS-reader
//
//  Created by Elena G on 12.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

#import "SortServiceImplementation.h"

@implementation SortServiceImplementation

-(NSArray*)sortByDate:(NSArray *)array{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO];
    return [array sortedArrayUsingDescriptors:@[sortDescriptor]];
}


@end
