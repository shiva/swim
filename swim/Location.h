//
//  Location.h
//  swim
//
//  Created by shiva on 2014-04-06.
//  Copyright (c) 2014 shiv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Location : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *title;
@property (readonly) NSString *place;
@property (readonly) NSString *information;
@property (readonly) NSString *telephone;
@property (readonly) NSString *url;
@property (readonly) NSNumber *visited;
@property (readonly) NSString *address;
@property (readonly) NSString *region;

@property (readonly) NSMutableArray         *tags;
@property (readonly) CLLocationCoordinate2D coordinate;


@end
