//
//  CatModel.h
//  20170131 More Cats
//
//  Created by Minhung Ling on 2017-01-31.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CatModel : NSObject <UICollectionViewDataSource>

- (void) createCatWithDictionary: (NSDictionary *) dict;

@end
