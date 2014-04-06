//
//  LocationLoader.h
//  swim
//
//  Created by shiva on 2014-04-06.
//  Copyright (c) 2014 shiv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationLoader : NSObject

- (NSArray *) locationsFromJSONFile:(NSURL *)url;

@end
