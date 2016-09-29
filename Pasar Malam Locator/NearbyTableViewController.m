//
//  NearbyTableViewController.m
//  Pasar Malam Locator
//
//  Created by Chui Wei Wai on 08/09/2016.
//  Copyright © 2016 Chui Wei Wai. All rights reserved.
//

#import "NearbyTableViewController.h"
#import "NearbyTableViewCell.h"
#import "DetailsViewController.h"
#import "PasarMalam.h"
#import "DataSource.h"

//@import FirebaseAuth;


@import Firebase;


@interface NearbyTableViewController (){

}
@end

@implementation NearbyTableViewController{
    NSArray *tableData;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ref = [[FIRDatabase database] reference];

    self.dataSource = [[DataSource alloc] initWithQuery:[self getQuery]
                                                 modelClass:[PasarMalam class]
                                                   nibNamed:@"NearbyTableViewCell"
                                        cellReuseIdentifier:@"NearbyTableViewCell"
                                                       view:self.currentTableView];
    
    [self.dataSource
     populateCellWithBlock:^void(NearbyTableViewCell *__nonnull cell,
                                 PasarMalam *__nonnull post) {
         cell.pmImage.image = [UIImage imageNamed:@"open_icon.png"];
         cell.pmName.text = post.author;
         cell.pmDistance.text = post.title;
         cell.pmOperationHour.text = post.body;
     }];
    
    self.currentTableView.dataSource = self.dataSource;
    self.currentTableView.delegate = self;

    //tableData = [NSArray arrayWithObjects:@"Pasar Malam 1", @"Pasar Malam 2", nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return [tableData count];
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *simpleTableIdentifier = @"NearbyTableViewCell";
//    NearbyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NearbyTableViewCell" forIndexPath:indexPath];
//    
//    if (cell == nil) {
//        cell = [[NearbyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
//    }
//    
//    [cell updateDisplay:[tableData objectAtIndex:indexPath.row]];
//    
//    return cell;
//
//}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"DetailsViewController" sender:indexPath];
    //    [NearbyTableViewCell.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"] animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.currentTableView reloadData];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

//- (NSString *) getUid {
//    return [FIRAuth auth].currentUser.uid;
//}

- (FIRDatabaseQuery *) getQuery {
    FIRDatabaseQuery *recentPostsQuery = [[self.ref child:@"posts"] queryLimitedToFirst:100];
    // [END recent_posts_query]
    return recentPostsQuery;
    //return self.ref;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *path = sender;
    DetailsViewController *detail = segue.destinationViewController;
    FirebaseTableViewDataSource *source = self.dataSource;
    FIRDataSnapshot *snapshot = [source objectAtIndex:path.row];
    detail.postKey = snapshot.key;
}
@end
