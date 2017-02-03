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
#import "SearchViewController.h"
#import "ShowAllViewController.h"

@interface CatViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *catCollectionView;
@property (nonatomic) CatModel *model;
@end

@implementation CatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [CatModel new];
    [self performSegueWithIdentifier:@"SearchViewController" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    self.catCollectionView.dataSource = self.model;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DetailViewController"]) {
        DetailViewController *dvc = segue.destinationViewController;
        NSIndexPath *indexPath = [self.catCollectionView indexPathsForSelectedItems][0];
        dvc.cat = [self.model catAtIndexPath:indexPath];
    }
    if ([segue.identifier isEqualToString:@"SearchViewController"]) {
        SearchViewController *svc = segue.destinationViewController;
        svc.delegate = self;
        svc.model = self.model;
    }
    if ([segue.identifier isEqualToString:@"ShowAllViewController"]) {
        ShowAllViewController *savc = segue.destinationViewController;
        savc.model = self.model;
    }
}

- (void) reloadData {
    [self.catCollectionView reloadData];
    NSURL *url = [self.model generateURL];
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

@end
