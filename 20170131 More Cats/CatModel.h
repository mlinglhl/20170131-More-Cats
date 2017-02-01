//
//  CatModel.h
//  20170131 More Cats
//
//  Created by Minhung Ling on 2017-01-31.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Cat;

@interface CatModel : NSObject <UICollectionViewDataSource>
@property (strong) NSMutableDictionary *URLProperties;
- (void) createCatWithDictionary: (NSDictionary *) dict;
- (Cat*) catAtIndexPath:(NSIndexPath*) indexPath;
- (NSURL*) generateURL;
@end
