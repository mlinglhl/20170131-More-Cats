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
    [self.model.URLProperties removeAllObjects];
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
    if (self.searchTextField.text.length > 0) {
        [self.model.URLProperties setValue:self.searchTextField.text forKey:@"tags"];
     }
    if (self.useMyLocationSwitch.on) {
        CLLocationManager *locationManager = [CLLocationManager new];
        locationManager.delegate = self;
        [locationManager requestLocation];
        CLLocationCoordinate2D coord = locationManager.location.coordinate;
        [self.model.URLProperties setValue:@(coord.latitude).stringValue forKey:@"lat"];
        [self.model.URLProperties setValue:@(coord.longitude).stringValue forKey:@"lon"];
    }
    [self.delegate reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
