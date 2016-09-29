//
//  NearbyTableViewController.h
//  Pasar Malam Locator
//
//  Created by Chui Wei Wai on 08/09/2016.
//  Copyright © 2016 Chui Wei Wai. All rights reserved.
//

#import <UIKit/UIKit.h>
@import FirebaseDatabaseUI;
@import Firebase;

@interface NearbyTableViewController : UIViewController <UITabBarDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UITableView * currentTableView;
@property (strong, nonatomic) FIRDatabaseReference *ref;
// [END define_database_reference]
@property (strong, nonatomic) FirebaseTableViewDataSource *dataSource;
@property (strong, nonatomic) NSString *postKey;



@end
