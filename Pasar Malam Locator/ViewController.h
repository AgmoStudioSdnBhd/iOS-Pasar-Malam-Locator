//
//  ViewController.h
//  Pasar Malam Locator
//
//  Created by Chui Wei Wai on 06/09/2016.
//  Copyright © 2016 Chui Wei Wai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
//#import <CarbonKit/CarbonTapSwipeNavigation.h>
#import "CarbonTabSwipeNavigation.h"


//@protocol HandleMapSearch <NSObject>
//- (void)dropPinZoomIn:(MKPlacemark *)placemark;
//@end
@interface ViewController : UIViewController <CarbonTabSwipeNavigationDelegate> //, HandleMapSearch>


@end

