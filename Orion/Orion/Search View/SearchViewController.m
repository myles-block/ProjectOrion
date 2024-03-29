//
//  SearchViewController.m
//  Orion
//
//  Created by Myles Block on 8/4/22.
//

#import "SearchViewController.h"
#import "SearchTableViewCell.h"
#import "DetailsViewController.h"
#import "APIManager.h"
#import "UIImageview+AFNetworking.h"
#import "Product.h"
#import "DGActivityIndicatorView.h"

@interface SearchViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
@property (strong, nonatomic) IBOutlet UITableView *searchTableView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong, nonatomic) NSMutableArray *data;//array of products
@property (strong, nonatomic) NSArray *filteredData;
@property (strong, nonatomic) DGActivityIndicatorView *activityIndicatorView;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"Search";
    
    //MARK: Activity Indicator Controls
    self.activityIndicatorView = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeBallSpinFadeLoader tintColor:[UIColor blackColor] size:50.0f];//intializer
    self.activityIndicatorView.frame = CGRectMake(0.0f, 0.0f, 50.0f, 50.0f);
//    CGFloat width = self.view.bounds.size.width / 5.0f;
//            CGFloat height = self.view.bounds.size.height / 7.0f;
//    self.activityIndicatorView.frame = CGRectMake(width * (i % 7), height * (int)(i / 7), width, height);
    
    CGPoint center = CGPointMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0);//puts into center
    self.activityIndicatorView.center = center;//sets to center
    
    [self.view addSubview:self.activityIndicatorView];
    
    
    
    self.searchTableView.delegate = self;
    self.searchTableView.dataSource = self;
    self.searchBar.delegate = self;
    
}

- (void) fetchSearch: (NSString *)input {
    [self.activityIndicatorView startAnimating];
    [[APIManager shared] getSearching:(input) completion:^(NSArray *products) {
        if (products) {
            NSLog(@"😎😎😎 Committed Search");
            self.data = (NSMutableArray *) products;//sets array of products to data array
            [self.searchTableView reloadData];
            [self.activityIndicatorView stopAnimating];
        }}];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([[segue identifier] isEqualToString:@"searchSegue"])
    {
        NSIndexPath *index = self.searchTableView.indexPathForSelectedRow;
        Product *dataToPass = self.data[index.row];
        DetailsViewController *detailVC = [segue destinationViewController];
        detailVC.selectedProduct = dataToPass;
    }
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    SearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchCell" forIndexPath:indexPath];
    Product *indexProduct = self.data[indexPath.row];//product in tableview
    cell.resultProductLabel.text = indexProduct.name;//sets product text to cell text
    NSString *posterURLString = indexProduct.productImage;//sets products image to search image
    NSURL *posterURL = [NSURL URLWithString:posterURLString];
    [cell.resultImage setImageWithURL:posterURL];//sets products in image to search image
       return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

//MARK: Search Bar Functions
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self fetchSearch:searchText];//calls API each time text changes
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {//shows cancel button on search bar
    self.searchBar.showsCancelButton = YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    self.searchBar.showsCancelButton = NO;//hides cancel button
    self.searchBar.text = @"";//sets text field to empty
    [self.searchBar resignFirstResponder];
}

@end
