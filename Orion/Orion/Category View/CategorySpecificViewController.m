//
//  CategorySpecificViewController.m
//  Orion
//
//  Created by Myles Block on 8/1/22.
//

#import "CategorySpecificViewController.h"
#import "TypeSpecificCells.h"
#import "UIImageview+AFNetworking.h"
#import "APIManager.h"
#import "Product.h"

@interface CategorySpecificViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *typeSpecificTableView;
@property (strong, nonatomic) NSMutableArray *trendingProductsFetch;
@end

@implementation CategorySpecificViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.typeSpecificTableView.dataSource = self;
    self.typeSpecificTableView.delegate = self;
    [self fetchCategoryTrendingProducts];
    
    
    // Do any additional setup after loading the view.
}

- (void) fetchCategoryTrendingProducts {
//    NSDictionary *test = @{@"name": @"Adapters & Cables", @"id": @"abcat0811007"};
    
    [[APIManager shared] getCategorySpecificTrending:(NSDictionary *)self.selectedCategoryID completion:^(NSArray *category_products) {
        if (category_products) {
            NSLog(@"😎😎😎 Successfully loaded Category Filter timeline");
            for (Product *product in category_products) {
                NSString *text = product.name;
                NSLog(@"%@", text);
            }
            self.trendingProductsFetch = (NSMutableArray *) category_products;
            [self.typeSpecificTableView reloadData];
        }}];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    TypeSpecificCells *cell = [tableView dequeueReusableCellWithIdentifier:@"TypeSpecificCells" forIndexPath:indexPath];
    Product *list = self.trendingProductsFetch[indexPath.row];
    cell.typeSpecificName.text = list.name;
//    cell.typeSpecificPrice.text = list.productPrice;
    
    NSString *posterURLString = list.productImage;
    NSURL *posterURL = [NSURL URLWithString:posterURLString];
    [cell.typeSpecificImage setImageWithURL:posterURL];
    
    return cell;
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.trendingProductsFetch.count;
}

//- (void)encodeWithCoder:(nonnull NSCoder *)coder {
//    <#code#>
//}
//
//- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
//    <#code#>
//}
//
//- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}
//
//- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
//    <#code#>
//}
//
//- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}
//
//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
//    <#code#>
//}
//
//- (void)setNeedsFocusUpdate {
//    <#code#>
//}
//
//- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
//    <#code#>
//}
//
//- (void)updateFocusIfNeeded {
//    <#code#>
//}

@end
