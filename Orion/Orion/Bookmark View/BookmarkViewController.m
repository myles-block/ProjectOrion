//
//  BookmarkViewController.m
//  Orion
//
//  Created by Myles Block on 8/12/22.
//

#import "BookmarkViewController.h"
#import "TrieAutocomplete.h"
#import "APIManager.h"
#import "Query Manager.h"
#import "Product.h"
#import "UIImageview+AFNetworking.h"
#import "BookmarkCollectionViewCell.h"
#import <QuartzCore/QuartzCore.h>


@interface BookmarkViewController ()<UICollectionViewDataSource>
@property (strong, nonatomic) NSArray *arrayOfBookmarkedProducts;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@end

@implementation BookmarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"Bookmarked";
    
//        TrieNode *root = [[TrieNode alloc] init];//root TrieNode
//        [TrieAutocomplete insert:root :@"test"];//isWord?
//        [TrieAutocomplete insert:root :@"tesseract"];
//        [TrieAutocomplete insert:root :@"testable"];
//

    self.bookmarkCollectionView.dataSource = self;
    [self fetchBookmarked];
    self.refreshControl = [[UIRefreshControl alloc] init];//connects refreshcontrol to self
    [self.refreshControl addTarget:self action: @selector(fetchBookmarked) forControlEvents:UIControlEventValueChanged];//when beginning of refresh control is triggered it reruns fetchMovies
    self.bookmarkCollectionView.refreshControl = self.refreshControl;//end of refreshControl
    
    NSString *currentUserID = PFUser.currentUser.objectId;
    [Query_Manager getBookmarked:currentUserID completion:^(NSArray * _Nonnull bookmarkList) {
        if(bookmarkList)
        {
            self.arrayOfBookmarkedProducts = bookmarkList;
            [self.bookmarkCollectionView reloadData];
        }
    }];
//    TrieNode *root = [[TrieNode alloc] init];//root TrieNode
//    [TrieAutocomplete insert:root :@"test"];
//    [TrieAutocomplete insert:root :@"tesseract"];
    
    // Do any additional setup after loading the view.
}

- (void) fetchBookmarked {
    NSString *currentUserID = PFUser.currentUser.objectId;
    [Query_Manager getBookmarked:currentUserID completion:^(NSArray * _Nonnull bookmarkList) {
        if(bookmarkList)
        {
            self.arrayOfBookmarkedProducts = bookmarkList;
            [self.bookmarkCollectionView reloadData];
            [self.refreshControl endRefreshing];
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    BookmarkCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BookmarkCollectionViewCell" forIndexPath:indexPath];
    PFObject *product = self.arrayOfBookmarkedProducts[indexPath.row];
    cell.bookmarkCollectionProductLabel.text = product[@"name"];
    
    NSString *posterURLString = product[@"productImage"];
    NSURL *posterURL = [NSURL URLWithString:posterURLString];
    [cell.bookmarkCollectionImage setImageWithURL:posterURL];
    
    //UI Design
    cell.layer.borderWidth=1.0f;
    cell.layer.borderColor=[UIColor blackColor].CGColor;
    
//    cell.bookmarkCollectionProductLabel.text = product.name;
//    NSString *posterURLString = product.productImage;
//    NSURL *posterURL = [NSURL URLWithString:posterURLString];
//    [cell.bookmarkCollectionImage setImageWithURL:posterURL];
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arrayOfBookmarkedProducts.count;
}

@end
