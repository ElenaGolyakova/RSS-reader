//
//  NewsLoadService.m
//  RSS-reader
//
//  Created by Elena G on 12.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

#import "LoadService.h"

@interface LoadService() <NSURLSessionDelegate>

@end

@implementation LoadService

-(void)loadDataWithURL:(NSURL *)url{
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: self delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithURL:url
                                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                        
                                                        if(error) {
                                                            [self.delegate didLoadWithError:error];
                                                        }
                                                        else {
                                                            [self.delegate didLoadData:data];
                                                        }
                                                    }];
    [dataTask resume];

}


#pragma mark - NSURLSessionDelegate


- (void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(nullable NSError *)error{
    [self.delegate didLoadWithError:error];
}


@end
