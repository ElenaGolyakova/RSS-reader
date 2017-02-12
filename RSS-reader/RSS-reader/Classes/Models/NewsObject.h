//
//  NewsObject.h
//  RSS-reader
//
//  Created by Elena G on 11.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsObject : NSObject

@property(nonatomic, readonly) NSString *title;
@property(nonatomic, readonly) NSString *descriptionString;
@property(nonatomic, readonly) NSString *sourceLink;
@property(nonatomic, readonly) NSDate *date;

-(instancetype) initWithTitle:(NSString*)title description:(NSString*)description imageURL:(NSString*)imageURL sourceLink:(NSString*)sourceLink date:(NSDate*)date;

@end
