//
//  NSObject+Image.m
//  RSS-reader
//
//  Created by Elena G on 12.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

#import "NSObject+Image.h"
#import <objc/runtime.h>


const char  *kImageKey = "ImageKey";
const char  *kImageUrlKey = "ImageUrlKey";

@implementation NSObject (Image)

-(UIImage*)image {
    return objc_getAssociatedObject(self, kImageKey);
}

-(void)setImage:(UIImage *)image{
    objc_setAssociatedObject(self, kImageKey, image, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSString*)imageUrlString {
    return objc_getAssociatedObject(self, kImageUrlKey);
}

-(void)setImageUrlString:(NSString *)imageUrlString {
    objc_setAssociatedObject(self, kImageUrlKey, imageUrlString, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
