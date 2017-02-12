//
//  NewsParseService.h
//  RSS-reader
//
//  Created by Elena G on 12.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NewsParseServiceDelegate <NSObject>

-(void)didParsedNewsData:(NSArray*)array;
-(void)didParsedWithError:(NSError*)error;

@end

@interface NewsParseService : NSObject

@property(nonatomic, weak) id <NewsParseServiceDelegate> delegate;

-(instancetype)initWithData:(NSData*)data;

-(void)parse;

@end
