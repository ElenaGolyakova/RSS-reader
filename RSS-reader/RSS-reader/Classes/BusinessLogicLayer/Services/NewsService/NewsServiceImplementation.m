//
//  NewsServiceImplementation.m
//  RSS-reader
//
//  Created by Elena G on 12.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

#import "NewsServiceImplementation.h"
#import "LoadService.h"
#import "NewsParseService.h"
#import "ImageLoadService.h"

@interface NewsServiceImplementation()  <LoadServiceDelegate, NewsParseServiceDelegate>

@property(nonatomic, strong) LoadService *loadService;
@property(nonatomic, strong) NewsParseService *parseService;

@property (nonatomic, copy) void(^completionBlock)(NSArray *, NSError *);

@end

static NSString *kNewsSericeURLString = @"http://lenta.ru/rss";

@implementation NewsServiceImplementation

-(instancetype)init{
    self = [super init];
    if(self) {
        
        self.loadService = [[LoadService alloc] init];
        self.loadService.delegate = self;

    }
    return self;
}


-(void)loadNewsList:(void (^)(NSArray *, NSError *))completionBlock {
    
    self.completionBlock = completionBlock;
    
    NSURL *url = [NSURL URLWithString:kNewsSericeURLString];
    [self.loadService loadDataWithURL:url];
}


#pragma mark - LoadServiceDelegate

-(void)didLoadData:(NSData*)data {
    
    self.parseService = [[NewsParseService alloc] initWithData:data];
    self.parseService.delegate = self;
    [self.parseService parse];
}

-(void)didLoadWithError:(NSError*)error {
    if(_completionBlock)
        _completionBlock(nil, error);
}

#pragma mark - NewsParseServiceDelegate

-(void)didParsedNewsData:(NSArray*)array {
    if(_completionBlock)
        _completionBlock(array, nil);
}

-(void)didParsedWithError:(NSError*)error {
    if(_completionBlock)
        _completionBlock(nil, error);

}


@end
