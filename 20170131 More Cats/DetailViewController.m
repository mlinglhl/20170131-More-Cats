//
//  DetailViewController.m
//  20170131 More Cats
//
//  Created by Minhung Ling on 2017-01-31.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "DetailViewController.h"
#import "Cat.h"
#import <MapKit/MapKit.h>

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *catMapView;
@property (weak, nonatomic) IBOutlet UIImageView *catImageView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.cat.title;
    self.catImageView.image = self.cat.image;
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.flickr.com/services/rest/?method=flickr.photos.geo.getLocation&format=json&nojsoncallback=1&api_key=2cefae6b9ce4007e1dae82b25d665dcf&photo_id=%@", self.cat.catID]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            return;
        }
        NSError *jsonError = nil;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            return;
        }
        NSDictionary *photoDict = [dict objectForKey:@"photo"];
        NSDictionary *locationDict = [photoDict objectForKey:@"location"];
        double latitude = [[locationDict objectForKey:@"latitude"] doubleValue];
        double longitude = [[locationDict objectForKey:@"longitude"] doubleValue];
        self.cat.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
        MKCoordinateSpan span = MKCoordinateSpanMake(.5f, .5f);
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.catMapView.region = MKCoordinateRegionMake(self.cat.coordinate, span);
            [self.catMapView addAnnotation:self.cat];
        }];
    }];
    [dataTask resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
