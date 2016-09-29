//
//  ViewController.m
//  Pasar Malam Locator
//
//  Created by Chui Wei Wai on 06/09/2016.
//  Copyright © 2016 Chui Wei Wai. All rights reserved.
//

#import "ViewController.h"
#import "MapViewController.h"


@interface ViewController () 
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIView *swipeNavigationView;
@property (strong, nonatomic) CarbonTabSwipeNavigation *carbonTabSwipeNavigation;

@end

@implementation ViewController
UISearchController *resultSearchController;

- (void)viewDidLoad {
    [super viewDidLoad];
        
    NSArray *items = @[@"Posts", @"Map", @"Nearby"];
    
    CarbonTabSwipeNavigation *carbonTabSwipeNavigation =
    [[CarbonTabSwipeNavigation alloc] initWithItems:items delegate:self];
    [carbonTabSwipeNavigation insertIntoRootViewController:self andTargetView:self.swipeNavigationView];
    

//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//    LocationSearchTableViewController *locationSearchTable = [storyboard instantiateViewControllerWithIdentifier:@"LocationSearchTableViewController"];
//    resultSearchController = [[UISearchController alloc] initWithSearchResultsController:locationSearchTable];
//    resultSearchController.searchResultsUpdater = locationSearchTable;
//    
//    UISearchBar *searchBar = resultSearchController.searchBar;
//    [searchBar sizeToFit];
//    searchBar.placeholder = @"Search";
//    self.navigationItem.titleView = resultSearchController.searchBar;
//    
//    resultSearchController.hidesNavigationBarDuringPresentation = NO;
//    resultSearchController.dimsBackgroundDuringPresentation = YES;
//    self.definesPresentationContext = YES;
//    
//    locationSearchTable.mapView =nil;
//    locationSearchTable.handleMapSearchDelegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)carbonTabSwipeNavigation:(CarbonTabSwipeNavigation *)carbonTabSwipeNavigation
                         viewControllerAtIndex:(NSUInteger)index {
    // return viewController at index
    
    if (index == 0)
    {
        return [self.storyboard instantiateViewControllerWithIdentifier:@"PostListViewController"];
        
    }else if (index ==1)
    {
        return [self.storyboard instantiateViewControllerWithIdentifier:@"MapViewController"];
    }
    else
    {
        return [self.storyboard instantiateViewControllerWithIdentifier:@"NearbyTableViewController"];
    }
    
    return [UIViewController new];
}

@end
