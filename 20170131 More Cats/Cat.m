//
//  Cat.m
//  20170131 More Cats
//
//  Created by Minhung Ling on 2017-01-31.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "Cat.h"

@implementation Cat

- (instancetype)initWithDictionary: (NSDictionary *) dict
{
    self = [super init];
    if (self) {
        _catID = [dict objectForKey:@"id"];
        _owner = [dict objectForKey:@"owner"];
        _secret = [dict objectForKey:@"secret"];
        _server = [dict objectForKey:@"server"];
        _farm = [dict objectForKey:@"farm"];
        _title = [dict objectForKey:@"title"];
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://farm%d.staticflickr.com/%@/%@_%@.jpg", self.farm.intValue, self.server, self.catID, self.secret]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        _image = [UIImage imageWithData:data];
    }
    return self;
}
@end
