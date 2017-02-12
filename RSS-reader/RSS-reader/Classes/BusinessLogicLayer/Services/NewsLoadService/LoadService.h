//
//  NewsLoadService.h
//  RSS-reader
//
//  Created by Elena G on 12.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LoadServiceDelegate <NSObject>

-(void)didLoadData:(NSData*)data;
-(void)didLoadWithError:(NSError*)error;

@end

@interface LoadService : NSObject


@property(nonatomic, weak) id <LoadServiceDelegate> delegate;

-(void)loadDataWithURL:(NSURL*)url;

@end
