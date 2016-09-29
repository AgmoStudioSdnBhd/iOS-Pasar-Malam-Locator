//
//  NearbyTableViewCell.m
//  Pasar Malam Locator
//
//  Created by Chui Wei Wai on 08/09/2016.
//  Copyright © 2016 Chui Wei Wai. All rights reserved.
//

#import "NearbyTableViewCell.h"
@import Firebase;
@import FirebaseAuth;


@interface NearbyTableViewCell ()


@end
@implementation NearbyTableViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    return [super initWithFrame:frame];
}

- (IBAction)didTapStarButton:(id)sender {
    if (!_postKey) {
        // We don't know the identifier of this post, so just return.
        return;
    }
    self.postRef = [[[[FIRDatabase database] reference] child:@"posts"] child:_postKey];
    [self incrementStarsForRef:_postRef];
    [_postRef observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSString *uid = snapshot.value[@"uid"];
        FIRDatabaseReference *ref = [[[[[FIRDatabase database] reference]
                                       child:@"user-posts"]
                                      child:uid] child:_postKey];
        [self incrementStarsForRef:ref];
    }];
}

- (void)incrementStarsForRef:(FIRDatabaseReference *)ref {
    // [START post_stars_transaction]
    [ref runTransactionBlock:^FIRTransactionResult * _Nonnull(FIRMutableData * _Nonnull currentData) {
        NSMutableDictionary *post = currentData.value;
        if (!post || [post isEqual:[NSNull null]]) {
            return [FIRTransactionResult successWithValue:currentData];
        }
        
        NSMutableDictionary *stars = [post objectForKey:@"stars"];
        if (!stars) {
            stars = [[NSMutableDictionary alloc] initWithCapacity:1];
        }
        NSString *uid = [FIRAuth auth].currentUser.uid;
        int starCount = [post[@"starCount"] intValue];
        if ([stars objectForKey:uid]) {
            // Unstar the post and remove self from stars
            starCount--;
            [stars removeObjectForKey:uid];
        } else {
            // Star the post and add self to stars
            starCount++;
            stars[uid] = @YES;
        }
        post[@"stars"] = stars;
        post[@"starCount"] = [NSNumber numberWithInt:starCount];
        
        // Set value and report transaction success
        [currentData setValue:post];
        return [FIRTransactionResult successWithValue:currentData];
    } andCompletionBlock:^(NSError * _Nullable error,
                           BOOL committed,
                           FIRDataSnapshot * _Nullable snapshot) {
        // Transaction completed
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
    // [END post_stars_transaction]
}


//- (void)updateDisplay:atIndexPath{
//    
//    FIRDatabaseReference *ref = [[FIRDatabase database] referenceFromURL:@"https://pasar-malam-locator.firebaseio.com"];
//    
////    [ref observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
////        NSDictionary *post = (NSDictionary*)snapshot.value;
////        
////        if(snapshot.value == [NSNull null]) {
////            NSLog(@"No messages");
////        } else {
////            NSArray *messages = snapshot.value;
////            NSString *firstMessage = [messages objectAtIndex:0];
////            NSLog(@"First message is: %@", firstMessage);
////            
////            self.pmName.text = [NSString stringWithFormat:@"%@", firstMessage];
////            self.pmImage.image = [UIImage imageNamed:@"open_icon.png"];
////            self.openImage.image = [UIImage imageNamed:@"open_icon.png"];
////        }
////    }];
//    
//    self.pmImage.image = [UIImage imageNamed:@"open_icon.png"];
//    self.openImage.image = [UIImage imageNamed:@"open_icon.png"];
//
//}

@end
