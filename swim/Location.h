//
//  Location.h
//  swim
//
//  Created by shiva on 2014-04-06.
//  Copyright (c) 2014 shiv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *title;
@property (readonly) NSString *place;
@property (readonly) NSNumber *latitude;
@property (readonly) NSNumber *longitude;
@property (readonly) NSString *information;
@property (readonly) NSString *telephone;
@property (readonly) NSString *url;
@property (readonly) NSNumber *visited;

@end
