//
//  CatModel.m
//  20170131 More Cats
//
//  Created by Minhung Ling on 2017-01-31.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "CatModel.h"
#import "CatCell.h"
#import "Cat.h"

@interface CatModel ()
@property NSMutableArray *catArray;
@property NSArray *propertyKeys;
@end

@implementation CatModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _URLProperties = [NSMutableDictionary new];
        _propertyKeys = @[
                          @"tags",
                          @"lat",
                          @"lon",
                          ];
    }
    return self;
}

- (void) createCatWithDictionary:(NSDictionary *)dict {
    Cat *cat = [[Cat alloc] initWithDictionary:dict];
    [self.catArray addObject:cat];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.catArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CatCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CatCell" forIndexPath:indexPath];
    cell.cat = self.catArray[indexPath.item];
    return cell;
}

- (Cat *)catAtIndexPath:(NSIndexPath *)indexPath {
    return self.catArray[indexPath.item];
}

- (NSURL*) generateURL {
    self.catArray = [NSMutableArray new];
    NSMutableString *urlString = [[NSMutableString alloc] initWithString:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=4ecacf0cd6441400e02e57ec12f0bb68&has_geo=1"];
    for (NSString *key in self.propertyKeys) {
        if ([self.URLProperties.allKeys containsObject:key]) {
            NSString *string = [[self.URLProperties objectForKey:key] stringByReplacingOccurrencesOfString:@" " withString:@""];
            [urlString appendString:[NSString stringWithFormat:@"&%@=%@", key, string]];
        }
    }
    return [NSURL URLWithString:urlString];
}
@end
