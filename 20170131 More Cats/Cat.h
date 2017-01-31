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

@property (nonatomic, nullable) NSString* catID;
@property (nonatomic, nullable) NSString* owner;
@property (nonatomic, nullable) NSString* secret;
@property (nonatomic, nullable) NSString* server;
@property (nonatomic, nullable) NSNumber* farm;
@property (nonatomic, readonly, copy, nullable) NSString *title;
@property (nonatomic, nullable) UIImage* image;
@property (nonatomic) CLLocationCoordinate2D coordinate;
- (nonnull instancetype)initWithDictionary: (nonnull NSDictionary *) dict;
@end
