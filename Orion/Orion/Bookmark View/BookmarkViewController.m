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


@interface BookmarkViewController ()<UICollectionViewDataSource>
@property (strong, nonatomic) NSMutableArray *arrayOfBookmarkedProducts;
@end

@implementation BookmarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"Bookmarked";
    self.bookmarkCollectionView.dataSource = self;
    
    NSString *currentUserID = PFUser.currentUser.objectId;
    [Query_Manager getBookmarked:currentUserID completion:^(NSMutableArray * _Nonnull bookmarkList) {
        if(bookmarkList)
        {
            self.bookmarkedSKUList = bookmarkList;
            NSMutableArray *myArray = [[NSMutableArray alloc] init];
            for(NSString *item in self.bookmarkedSKUList)
            {
                [[APIManager shared] getProductfromSKU:item completion:^(NSArray *products) {
                    if (products)
                    {
            //            self.arrayOfBookmarkedProducts = (NSMutableArray *) products;
                        [myArray addObject:[products firstObject]];
//                        [self.arrayOfBookmarkedProducts addObject:[products firstObject]];
                        [self.bookmarkCollectionView reloadData];
                    }
                    
                }];
            }
            self.arrayOfBookmarkedProducts = (NSMutableArray *)myArray;
        }
    }];
//    TrieNode *root = [[TrieNode alloc] init];//root TrieNode
//    [TrieAutocomplete insert:root :@"test"];
//    [TrieAutocomplete insert:root :@"tesseract"];
    
    // Do any additional setup after loading the view.
}

- (void) fetchBookmarked: (NSString *)item {
    [[APIManager shared] getProductfromSKU:item completion:^(NSArray *products) {
        if (products)
        {
//            self.arrayOfBookmarkedProducts = (NSMutableArray *) products;
            [self.arrayOfBookmarkedProducts addObject:[products firstObject]];
            [self.bookmarkCollectionView reloadData];
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
    Product *product = self.arrayOfBookmarkedProducts[indexPath.row];
    cell.bookmarkCollectionProductLabel.text = product.name;
    NSString *posterURLString = product.productImage;
    NSURL *posterURL = [NSURL URLWithString:posterURLString];
    [cell.bookmarkCollectionImage setImageWithURL:posterURL];
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arrayOfBookmarkedProducts.count;
}

@end
