//
//  SearchViewController.m
//  20170131 More Cats
//
//  Created by Minhung Ling on 2017-01-31.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UISwitch *useMyLocationSwitch;
@property (nonatomic) CLLocationManager *manager;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.manager = [CLLocationManager new];
    self.manager.delegate = self;
    [self.manager requestLocation];
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    //These are required or the program crashes.
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    //These are required or the program crashes.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveSearch:(UIButton *)sender {
    CLLocation *myLocation = self.manager.location;
    CLLocationCoordinate2D myCoordinate = myLocation.coordinate;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)useLocationSwitch:(UISwitch *)sender {
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
