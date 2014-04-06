//
//  ViewController.m
//  swim
//
//  Created by shiva on 2014-03-29.
//  Copyright (c) 2014 shiv. All rights reserved.
//

#import "ViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface ViewController ()

@end

@implementation ViewController {
    GMSMapView *mapView_;
    BOOL firstLocationUpdate_;
}

- (void)viewDidLoad
{
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:49.24
                                                            longitude:-122.98
                                                                 zoom:12];
    
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.mapType = kGMSTypeNormal;
    mapView_.settings.compassButton = YES;
    mapView_.settings.myLocationButton = YES;
    mapView_.settings.indoorPicker = NO;
    
    // Listen to mylocation property
    [mapView_   addObserver : self
                 forKeyPath : @"mylocation"
                    options : NSKeyValueObservingOptionNew
                    context : NULL];
    
    self.view = mapView_;
    
    // ask location data after it is added to gui
    dispatch_async(dispatch_get_main_queue(), ^{
        mapView_.myLocationEnabled = YES;
    });
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    CLLocation *location = [change objectForKey:NSKeyValueChangeNewKey];

    if (!firstLocationUpdate_) {
        firstLocationUpdate_ = YES;
        mapView_.camera = [GMSCameraPosition cameraWithTarget:location.coordinate zoom:12];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
