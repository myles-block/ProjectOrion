//
//  HomeFeedViewController.m
//  Orion
//
//  Created by Myles Block on 7/11/22.
//

//TODO: Add sections to app for Trending View & Most Popular View & Articles
//TODO: Archive the current method used to pull API data so that it can be moved to manger file (and reconstruct a dictionary to hold data) ~ DONE!!!
//TODO: Hide API keys behind secure wall, so that they cannot be used ~ DONE!!!
//TODO: Add AFNetowrking Pod for image url pull ~ DONE!!!


#import "HomeFeedViewController.h"
#import "DetailsViewController.h"
#import "SettingsViewController.h"
#import "HomeFeedCell.h"
#import "UIImageview+AFNetworking.h"
#import "APIManager.h"
#import "Product.h"
#import "DGActivityIndicatorView.h"

@interface HomeFeedViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *feedTableView;
@property (strong, nonatomic) NSArray *trendingProducts;//entire array of trending products given from API request ~ not in use
@property (strong, nonatomic) NSMutableArray *trendingProductsFetch;
@property (strong, nonatomic) DGActivityIndicatorView *activityIndicatorView;
@end

@implementation HomeFeedViewController
NSArray *data;

- (void)viewDidLoad {
    [super viewDidLoad];
    //MARK: Activity Indicator Controls
    self.activityIndicatorView = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeBallSpinFadeLoader tintColor:[UIColor blackColor] size:50.0f];//intializer
    self.activityIndicatorView.frame = CGRectMake(0.0f, 0.0f, 50.0f, 50.0f);
    CGPoint center = CGPointMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0);//puts into center
    self.activityIndicatorView.center = center;//sets to center
    
    [self.view addSubview:self.activityIndicatorView];
    
    self.feedTableView.dataSource = self;
    self.feedTableView.delegate = self;
    
    [self fetchTrendingProducts];
}


- (void) fetchTrendingProducts {
    [self.activityIndicatorView startAnimating];
    [[APIManager shared] getHomeFeedTrending:^(NSArray *products) {
        if (products) {
            NSLog(@"😎😎😎 Successfully loaded homefeed timeline");
            for (Product *product in products) {
                NSString *text = product.name;
                NSLog(@"%@", text);
            }
            self.trendingProductsFetch = (NSMutableArray *) products;
            [self.feedTableView reloadData];
            [self.activityIndicatorView stopAnimating];
        }}];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    //THIS SEGUE PASSES IN THE SELECTED PRODUCT FROM THE HOME FEED TABLE VIEW
    if([[segue identifier] isEqualToString:@"settingsSegue"])
    {
        SettingsViewController *settingsVC = [segue destinationViewController];
    }
    else if([[segue identifier] isEqualToString:@"detailViewSegue"])
    {
        NSIndexPath *index = self.feedTableView.indexPathForSelectedRow;
        Product *dataToPass = self.trendingProductsFetch[index.row];
        DetailsViewController *detailVC = [segue destinationViewController];
        detailVC.selectedProduct = dataToPass;
    }
}



//MARK: TableView Functions
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    HomeFeedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeFeedCell" forIndexPath:indexPath];
    
    Product *list = self.trendingProductsFetch[indexPath.row];//indexPath parse through each row of trendingProducts and points it to list
    cell.productName.text = list.name;//list grabs the title of product & sets to label
    NSString *posterURLString = list.productImage;
    NSURL *posterURL = [NSURL URLWithString:posterURLString];
    [cell.productImage setImageWithURL:posterURL];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {//Deals with of rows in section
    return self.trendingProductsFetch.count;
}


/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {//Establishes Default Header for Section
    return @"Trending Products";
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {//Establishes number of sections in tableview
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {//Creates custom header for section in table view
    
}
*/


@end
