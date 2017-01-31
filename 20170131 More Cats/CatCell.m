//
//  CatCell.m
//  20170131 More Cats
//
//  Created by Minhung Ling on 2017-01-31.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "CatCell.h"
#import "Cat.h"

@interface CatCell ()
@property (weak, nonatomic) IBOutlet UILabel *catLabel;
@property (weak, nonatomic) IBOutlet UIImageView *catImageView;

@end

@implementation CatCell

-(void)setCat:(Cat *)cat {
    _cat = cat;
    self.catLabel.text = cat.title;
    self.catImageView.image = cat.image;
}
@end
