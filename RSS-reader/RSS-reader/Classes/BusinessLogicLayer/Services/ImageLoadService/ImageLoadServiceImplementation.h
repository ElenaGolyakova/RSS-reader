//
//  ImageLoadServiceImplemantation.h
//  RSS-reader
//
//  Created by Elena G on 12.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageLoadService.h"

@protocol ImageLoadServiceDelegate;

@interface ImageLoadServiceImplementation : NSObject <ImageLoadService>

@property(nonatomic, weak) id <ImageLoadServiceDelegate> delegate;

@end
