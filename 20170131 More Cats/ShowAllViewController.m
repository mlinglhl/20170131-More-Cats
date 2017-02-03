//
//  ShowAllViewController.m
//  20170131 More Cats
//
//  Created by Minhung Ling on 2017-01-31.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "ShowAllViewController.h"
#import "CatModel.h"
#import "Cat.h"

@interface ShowAllViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *catMapView;

@end

@implementation ShowAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpMapView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setUpMapView {
    for (Cat *cat in [self.model getCatArray]) {
        [self.catMapView addAnnotation:cat];
    }
}
@end
