//
//  NewsParseService.m
//  RSS-reader
//
//  Created by Elena G on 12.02.17.
//  Copyright © 2017 Temp. All rights reserved.
//

#import "NewsParseService.h"
#import "NewsObject.h"

static NSString  *const kItemKey = @"item";
static NSString  *const kTiteKey = @"title";
static NSString  *const kLinkKey = @"link";
static NSString  *const kDateKey = @"pubDate";
static NSString  *const kDescriptionKey = @"description";
static NSString  *const kImageDictionaryKey = @"enclosure";
static NSString  *const kImageURLKey = @"url";


@interface NewsParseService() <NSXMLParserDelegate>

@property(nonatomic, strong) NSMutableArray *parsedArray;
@property(nonatomic, strong) NSXMLParser *xmlParser;
@property(nonatomic, strong) NSData *data;
@property(nonatomic, strong) NSDateFormatter *dateFormatter;

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *imageURL;
@property(nonatomic, copy) NSString *descriptionString;
@property(nonatomic, copy) NSString *sourceLink;
@property(nonatomic, copy) NSString *dateString;

@property(nonatomic, assign) BOOL startParse;
@property(nonatomic, assign) BOOL startParseElement;
@property(nonatomic, strong) NSString *currentKey;


@end

@implementation NewsParseService

-(instancetype)initWithData:(NSData*)data{
    
    self = [super init];
    if(self) {
        self.data = data;
    }
    return self;
}

-(void)parse {
    
    if(self.startParse) {
        return;
    }
    
    self.startParse = YES;
    
    self.xmlParser = [[NSXMLParser alloc] initWithData:_data];
    self.xmlParser.delegate = self;
    self.parsedArray = [NSMutableArray array];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [_xmlParser parse];
    });
}

-(NSDateFormatter*)dateFormatter{
    if(!_dateFormatter){
        _dateFormatter = [[NSDateFormatter alloc] init];
        _dateFormatter.dateFormat = @"E, d MMM yyyy HH:mm:ss Z";
    }
    return _dateFormatter;
}

-(void)appedKey:(NSString*)key withCharacters:(NSString *)string{
    if([key isEqualToString:kTiteKey]) {
        self.title = [self.title stringByAppendingString:string];
    }
    else if ([key isEqualToString:kLinkKey]) {
        self.sourceLink = [self.sourceLink stringByAppendingString:string];
    }
    else if ([key isEqualToString:kDateKey]) {
        self.dateString = [self.dateString stringByAppendingString:string];
    }
    else if ([key isEqualToString:kDescriptionKey]) {
        self.descriptionString = [self.descriptionString stringByAppendingString:string];
    }
    else if ([key isEqualToString:kImageURLKey]) {
        self.imageURL = [self.imageURL stringByAppendingString:string];
    }
}

-(void)appedKey:(NSString*)key withDictionary:(NSDictionary *)dictionary{
    
    if ([key isEqualToString:kImageDictionaryKey]) {
        
        for(NSString *dictKey in dictionary.allKeys) {
            
            if([dictKey isEqualToString:kImageURLKey]) {
                
                [self appedKey:dictKey withCharacters:[dictionary valueForKey:dictKey]];
            }
        }
    }
}

-(void)cleanLocalValues{
    self.title = @"";
    self.imageURL = @"";
    self.descriptionString = @"";
    self.sourceLink = @"";
    self.dateString = @"";
}

#pragma mark - NSXMLParserDelegate

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict  {
    
    self.currentKey = nil;
    
    if ([elementName isEqualToString:kItemKey]) {
        self.startParseElement = YES;
        [self cleanLocalValues];
    }
    else if(_startParseElement) {
        self.currentKey = elementName;
        if(attributeDict.allKeys.count > 0){
            [self appedKey:self.currentKey withDictionary:attributeDict];
            
        }
    }
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if(_startParseElement && self.currentKey.length >0) {
        [self appedKey:self.currentKey withCharacters:string];
    }
}
- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:kItemKey] && _startParseElement) {
        
        NSCharacterSet *charactedSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        
        NSDate *date = [self.dateFormatter dateFromString:[_dateString stringByTrimmingCharactersInSet:charactedSet]];
        
        NewsObject *object = [[NewsObject alloc] initWithTitle:[_title stringByTrimmingCharactersInSet:charactedSet]
                                                   description:[_descriptionString  stringByTrimmingCharactersInSet:charactedSet]
                                                      imageURL:[_imageURL  stringByTrimmingCharactersInSet:charactedSet]
                                                    sourceLink:[_sourceLink stringByTrimmingCharactersInSet:charactedSet]
                                                          date:date];
        
        [self.parsedArray addObject:object];
        self.startParseElement = NO;
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
    dispatch_async(dispatch_get_main_queue(), ^ {
        [_delegate didParsedNewsData:self.parsedArray];
    });
}
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    
    dispatch_async(dispatch_get_main_queue(), ^ {
        [_delegate didParsedWithError:parseError];
    });
}

@end
