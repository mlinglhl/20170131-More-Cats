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
@end

@implementation CatModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _catArray = [NSMutableArray new];
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

@end
