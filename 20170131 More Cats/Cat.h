//
//  Cat.h
//  20170131 More Cats
//
//  Created by Minhung Ling on 2017-01-31.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Cat : NSObject

@property NSString* catID;
@property NSString* owner;
@property NSString* secret;
@property NSString* server;
@property NSNumber* farm;
@property NSString* title;
@property UIImage* image;
- (instancetype)initWithDictionary: (NSDictionary *) dict;
@end
