//
//  ImageLoadServiceImplemantation.m
//  RSS-reader
//
//  Created by Elena G on 12.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

#import "ImageLoadServiceImplementation.h"
#import "ImageLoadServiceDelegate.h"

@interface ImageLoadServiceImplementation()

@property (nonatomic, strong) NSMutableDictionary *imagesCash;
@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic, strong) NSMutableArray *loadedArray;

@end

@implementation ImageLoadServiceImplementation

-(instancetype)init{
    self = [super init];
    if(self) {
        self.imagesCash = [NSMutableDictionary dictionary];
        
        self.operationQueue = [[NSOperationQueue alloc] init];
        self.operationQueue.name = @"RSSReaderLoadImageQueue";
        self.operationQueue.maxConcurrentOperationCount = NSOperationQueueDefaultMaxConcurrentOperationCount;
    }
    
    return self;
}

-(void)loadImageByObject:(NSObject*)object{
    
    if(!object || !object.imageUrlString || object.image) {
        return;
    }
    
    @synchronized (_imagesCash) {
        
        UIImage *image = [_imagesCash objectForKey:object.imageUrlString];
        
        if(image) {
            object.image = image;
        }
        else{
            
            @synchronized (_loadedArray) {
                
                if(![_loadedArray containsObject:object.imageUrlString]) {
                    [_loadedArray addObject:object.imageUrlString];
                    [self addLoadImageOperationByObject:object];
                }
            }
        }
    }
}


-(void)addLoadImageOperationByObject:(NSObject*)object {
    
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        
        NSURL *url = [NSURL URLWithString:object.imageUrlString];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [[UIImage alloc] initWithData:data];
        object.image = image;
        if(image) {
            
            @synchronized (_imagesCash) {
                [_imagesCash setObject:image forKey:object.imageUrlString];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [_delegate didLoadImageByObject:object];
            });
        }
        
        @synchronized (_loadedArray) {
            [_loadedArray removeObject:object.imageUrlString];
        }
    }];
    [self.operationQueue addOperation:blockOperation];
}



@end
