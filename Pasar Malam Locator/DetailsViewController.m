//
//  DetailsViewController.m
//  Pasar Malam Locator
//
//  Created by Chui Wei Wai on 07/09/2016.
//  Copyright © 2016 Chui Wei Wai. All rights reserved.
//

#import "DetailsViewController.h"
#import "MapViewController.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UITextView *description;
@property (weak, nonatomic) IBOutlet UILabel *pmName;
@property (weak, nonatomic) IBOutlet UIButton *getDirectionButton;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
