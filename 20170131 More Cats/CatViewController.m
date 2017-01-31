//
//  CatViewController.m
//  20170131 More Cats
//
//  Created by Minhung Ling on 2017-01-31.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "CatViewController.h"
#import "CatModel.h"
#import "DetailViewController.h"

@interface CatViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *catCollectionView;
@property (nonatomic) CatModel *model;
@end

@implementation CatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [CatModel new];
    self.catCollectionView.dataSource = self.model;
        NSURL *url = [NSURL URLWithString:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=4ecacf0cd6441400e02e57ec12f0bb68&tags=cat&has_geo=1"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error) {
                return;
            }
            NSError *jsonError = nil;
            NSDictionary *caTionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            if (jsonError) {
                return;
            }
            NSDictionary *atKeyPhotos = [caTionary objectForKey:@"photos"];
            NSArray *catArray = [atKeyPhotos objectForKey:@"photo"];
            for (NSDictionary *dict in catArray) {
                [self.model createCatWithDictionary: dict];
            }
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.catCollectionView reloadData];
            }];
        }];
        [dataTask resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DetailViewController"]) {
        DetailViewController *dvc = segue.destinationViewController;
        NSIndexPath *indexPath = [self.catCollectionView indexPathsForSelectedItems][0];
        dvc.cat = [self.model catAtIndexPath:indexPath];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
