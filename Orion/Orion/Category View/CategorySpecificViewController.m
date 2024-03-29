//
//  CategorySpecificViewController.m
//  Orion
//
//  Created by Myles Block on 8/1/22.
//

#import "CategorySpecificViewController.h"
#import "DetailsViewController.h"
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
    self.title = [self.selectedCategoryID objectForKey:@"name"];
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([[segue identifier] isEqualToString:@"categorySegue"])
    {
        NSIndexPath *index = self.typeSpecificTableView.indexPathForSelectedRow;
        Product *dataToPass = self.trendingProductsFetch[index.row];
        DetailsViewController *detailVC = [segue destinationViewController];
        detailVC.selectedProduct = dataToPass;
    }
}


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

@end
