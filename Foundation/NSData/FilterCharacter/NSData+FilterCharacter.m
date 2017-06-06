//
//  NSData+FilterCharacter.m
//
//  Created by Leo_Lei on 2016/12/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import "NSData+FilterCharacter.h"

@implementation NSData (FilterCharacter)

+ (NSData *)handleSpecialCharactersWithJSONData:(NSData *)data {
    NSString *dataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSMutableString *handleString = [NSMutableString stringWithString:dataString];
    
    [handleString replaceOccurrencesOfString:@"\n"
                                  withString:@"\\n"
                                     options:NSCaseInsensitiveSearch
                                       range:NSMakeRange(0, handleString.length)];
    
    [handleString replaceOccurrencesOfString:@"\b"
                                  withString:@"\\b"
                                     options:NSCaseInsensitiveSearch
                                       range:NSMakeRange(0, handleString.length)];
    
    [handleString replaceOccurrencesOfString:@"\f"
                                  withString:@"\\f"
                                     options:NSCaseInsensitiveSearch
                                       range:NSMakeRange(0, handleString.length)];
    
    [handleString replaceOccurrencesOfString:@"\r"
                                  withString:@"\\r"
                                     options:NSCaseInsensitiveSearch
                                       range:NSMakeRange(0, handleString.length)];
    
    [handleString replaceOccurrencesOfString:@"\t"
                                  withString:@"\\t"
                                     options:NSCaseInsensitiveSearch
                                       range:NSMakeRange(0, handleString.length)];
    
    return [[NSString stringWithString:handleString] dataUsingEncoding:NSUTF8StringEncoding];
}

@end
