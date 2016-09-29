//
//  MapViewController.m
//  Pasar Malam Locator
//
//  Created by Chui Wei Wai on 07/09/2016.
//  Copyright © 2016 Chui Wei Wai. All rights reserved.
//

#import "MapViewController.h"
#define METERS_MILE 1609.344
#define METERS_FEET 3.28084


@interface MapViewController () <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *getDirectionButton;
@property (weak, nonatomic) IBOutlet UILabel *pmName;
@property (weak, nonatomic) IBOutlet UILabel *pmDistance;
@property (weak, nonatomic) IBOutlet UILabel *pmOperationHour;
@property (weak, nonatomic) IBOutlet UIButton *psDetailsButton;
@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;

@end

@implementation MapViewController

CLLocationManager *locationManager;
MKPlacemark *selectedPin;

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    locationManager = [[CLLocationManager alloc] init];
//    locationManager.delegate = self;
//    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
//    [locationManager requestLocation];
//    [locationManager requestWhenInUseAuthorization];
    
//    MKPointAnnotation *myAnnotation = [[MKPointAnnotation alloc] init];
//    myAnnotation.coordinate = CLLocationCoordinate2DMake(3.0352314, 101.5493431);
//    myAnnotation.title = @"Pasar Malam";
//    myAnnotation.subtitle = @"Subang Jaya";
//    [self.mapView addAnnotation:myAnnotation];
    
    self.mapView.delegate = self;
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.showsUserLocation = YES;
    self.mapView.zoomEnabled = YES;
    CLLocationCoordinate2D location;

    location.latitude = 3.0737191;
    location.longitude = 101.5911608;
    
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:CLLocationCoordinate2DMake(location.latitude, location.longitude) addressDictionary:nil];
    
    selectedPin = placemark;
    [_mapView removeAnnotations:(_mapView.annotations)];
    MKPointAnnotation *annotation = [MKPointAnnotation new];
    annotation.coordinate = placemark.coordinate;
    [_mapView addAnnotation:annotation];

    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.05, 0.05);
    MKCoordinateRegion region = MKCoordinateRegionMake(placemark.coordinate, span);
    [_mapView setRegion:region animated:true];
    
    _pmName.textColor= [UIColor whiteColor];
    _pmDistance.textColor= [UIColor whiteColor];
    _pmOperationHour.textColor= [UIColor whiteColor];

    _pmName.text = [NSString stringWithFormat: @"%@",placemark.name];
    _pmDistance.text = [NSString stringWithFormat: @"%f", location.latitude];
    _pmOperationHour.text = [NSString stringWithFormat: @"%f", location.longitude];

    NSLog(@"error: %f,%f,%@", location.latitude, location.longitude, placemark.name);


    
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [locationManager requestLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"error: %@", error);
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *location = [locations firstObject];
    MKCoordinateSpan span = MKCoordinateSpanMake(0.05, 0.05);
    MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, span);
    [_mapView setRegion:region animated:true];
}

- (nullable MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        //return nil so map view draws "blue dot" for standard user location
        return nil;
    }
    
    static NSString *reuseId = @"pin";
    
    MKPinAnnotationView *pinView = (MKPinAnnotationView *) [_mapView dequeueReusableAnnotationViewWithIdentifier:reuseId];
    if (pinView == nil) {
        
        MKPinAnnotationView *customPinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseId];
        if (annotation == mapView.userLocation){
            customPinView.image = [UIImage imageNamed:@"userlocator_icon.png"];
        }
        else{
            customPinView.image = [UIImage imageNamed:@"locator_icon.png"];
        }
        customPinView.enabled = YES;
        customPinView.canShowCallout = YES;
        return customPinView;

        //pinView.image = [UIImage imageNamed:@"userlocator_icon.png"];
    } else {
        pinView.annotation = annotation;
    }
    
//    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//    [button setBackgroundImage:[UIImage imageNamed:@"locator_icon.png"]
//                      forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(getDirections) forControlEvents:UIControlEventTouchUpInside];
//    pinView.leftCalloutAccessoryView = button;
//    
    return pinView;
    
    
    
//    static NSString* AnnotationIdentifier = @"Annotation";
//    MKPinAnnotationView *pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationIdentifier];
//    
//    if (!pinView) {
//        
//        MKPinAnnotationView *customPinView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationIdentifier] autorelease];
//        if (annotation == mapView.userLocation){
//            customPinView.image = [UIImage imageNamed:@"myCarImage.png"];
//        }
//        else{
//            customPinView.image = [UIImage imageNamed:@"mySomeOtherImage.png"];
//        }
//        customPinView.animatesDrop = NO;
//        customPinView.canShowCallout = YES;
//        return customPinView;
//        
//    } else {
//        
//        pinView.annotation = annotation;
//    }
//    
//    return pinView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)getDirectionPressed:(id)sender
{
    
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:selectedPin];
    [mapItem openInMapsWithLaunchOptions:(@{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving})];
//    [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"] animated:YES];
}
- (void)getDirections {
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:selectedPin];
    [mapItem openInMapsWithLaunchOptions:(@{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving})];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
