//
//  MapViewController.h
//  Pasar Malam Locator
//
//  Created by Chui Wei Wai on 07/09/2016.
//  Copyright © 2016 Chui Wei Wai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@import MapKit;
@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@end
