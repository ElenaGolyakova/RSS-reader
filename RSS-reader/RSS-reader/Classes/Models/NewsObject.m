//
//  NewsObject.m
//  RSS-reader
//
//  Created by Elena G on 11.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

#import "NewsObject.h"

@implementation NewsObject

-(instancetype)initWithTitle:(NSString*)title description:(NSString*)description imageURL:(NSString*)imageURL sourceLink:(NSString*)sourceLink date:(NSDate*)date{
    self = [super init];
    if(self) {
        _title = title;
        _descriptionString = description;
        self.imageUrlString = imageURL;
        _sourceLink = sourceLink;
        _date = date;
    }
    return self;
}

@end
