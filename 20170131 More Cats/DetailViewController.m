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
    MKCoordinateSpan span = MKCoordinateSpanMake(.5f, .5f);
    self.catMapView.region = MKCoordinateRegionMake(self.cat.coordinate, span);
    [self.catMapView addAnnotation:self.cat];
}

@end
