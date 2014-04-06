//
//  LocationLoader.m
//  swim
//
//  Created by shiva on 2014-04-06.
//  Copyright (c) 2014 shiv. All rights reserved.
//

#import "LocationLoader.h"
#import "Location.h"

@implementation LocationLoader

- (NSArray *) locationsFromJSONFile:(NSURL *)url
{
    NSURLRequest    *request;
    NSURLResponse   *response;
    NSData          *data;
    
    // send request and fetch the data
    request = [NSURLRequest requestWithURL:url
                               cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                           timeoutInterval:20.0];
    
    data = [NSURLConnection sendSynchronousRequest:request
                                 returningResponse:&response error:nil];
    
    
    // process JSON result
    NSDictionary    *jsonDictionary;
    NSArray         *array;
    NSMutableArray  *locations = [[NSMutableArray alloc] init];
    
    jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                     options:0
                                                       error:nil];
    array = [jsonDictionary objectForKey:@"locations"];
    
    for (NSDictionary *dict in array) {
        Location *location = [[Location alloc] initWithJSONDictionary:dict];
        [locations addObject:location];
    }
    
    return locations;
}

@end
