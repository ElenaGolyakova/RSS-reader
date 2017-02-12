//
//  NSIndexPath+Equal.m
//  RSS-reader
//
//  Created by Elena G on 12.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

#import "NSIndexPath+Equal.h"

@implementation NSIndexPath (Equal)

-(BOOL)isEqualToIndexPath:(NSIndexPath *)indexPath {
    return self.row == indexPath.row && self.section == indexPath.section;
}

@end
