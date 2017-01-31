//
//  SearchViewController.h
//  20170131 More Cats
//
//  Created by Minhung Ling on 2017-01-31.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "SearchViewControllerDelegate.h"

@interface SearchViewController : UIViewController <CLLocationManagerDelegate>
@property id<SearchViewControllerDelegate> delegate;
@end
