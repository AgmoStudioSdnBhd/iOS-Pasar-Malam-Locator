//
//  NearbyTableViewCell.h
//  Pasar Malam Locator
//
//  Created by Chui Wei Wai on 08/09/2016.
//  Copyright © 2016 Chui Wei Wai. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;
@interface NearbyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *pmImage;
@property (weak, nonatomic) IBOutlet UILabel *pmName;
@property (weak, nonatomic) IBOutlet UILabel *pmDistance;
@property (weak, nonatomic) IBOutlet UILabel *pmOperationHour;
@property (weak, nonatomic) IBOutlet UIImageView *openImage;

@property (strong, nonatomic) FIRDatabaseReference *postRef;
@property(weak, nonatomic) NSString *postKey;

- (void)updateDisplay:atIndexPath;

@end
