//
//  DetailViewController.h
//  20170131 More Cats
//
//  Created by Minhung Ling on 2017-01-31.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@class Cat;

@interface DetailViewController : UIViewController <MKMapViewDelegate>
@property Cat *cat;
@end
