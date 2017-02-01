//
//  Cat.h
//  20170131 More Cats
//
//  Created by Minhung Ling on 2017-01-31.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface Cat : NSObject <MKAnnotation>

@property (nonatomic, readonly) NSString* catID;
@property (nonatomic, readonly) NSString* owner;
@property (nonatomic, readonly) NSString* secret;
@property (nonatomic, readonly) NSString* server;
@property (nonatomic, readonly) NSNumber* farm;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly) UIImage* image;
@property (nonatomic) CLLocationCoordinate2D coordinate;
- (instancetype)initWithDictionary: (NSDictionary *) dict;
@end
