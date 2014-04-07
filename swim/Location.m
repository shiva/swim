//
//  Location.m
//  swim
//
//  Created by shiva on 2014-04-06.
//  Copyright (c) 2014 shiv. All rights reserved.
//

#import "Location.h"

@implementation Location

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _title = [jsonDictionary objectForKey:@"title"];
        _place = [jsonDictionary objectForKey:@"place"];
        _information = [jsonDictionary objectForKey:@"information"];
        _telephone = [jsonDictionary objectForKey:@"telephone"];
        
        NSNumber *latitude = [jsonDictionary objectForKey:@"latitude"];
        NSNumber *longitude = [jsonDictionary objectForKey:@"longitude"];
        _coordinate = CLLocationCoordinate2DMake([latitude doubleValue], [longitude doubleValue]);
        
        _url = [jsonDictionary objectForKey:@"url"];
        _visited = [jsonDictionary objectForKey:@"visited"];
        
        _address = [jsonDictionary objectForKey:@"address"];
        _region = [jsonDictionary objectForKey:@"region"];
        
        NSArray *array;
        array = [jsonDictionary objectForKey:@"tags"];
        _tags = [[NSMutableArray alloc] init];
        for (NSString *str in array) {
            [_tags addObject:str];
        }
    }
    
    return self;
}

@end
