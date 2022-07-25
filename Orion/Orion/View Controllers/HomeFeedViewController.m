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
#import "HomeFeedCell.h"
#import "UIImageview+AFNetworking.h"
#import "APIManager.h"
#import "Product.h"

@interface HomeFeedViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *feedTableView;
@property (strong, nonatomic) NSArray *trendingProducts;//entire array of trending products given from API request
@property (strong, nonatomic) NSMutableArray *trendingProductsFetch;
@end

@implementation HomeFeedViewController
NSArray *data;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.feedTableView.dataSource = self;
    self.feedTableView.delegate = self;
    
    [self fetchTrendingProducts];
}


- (void) fetchTrendingProducts {
    [[APIManager shared] getHomeFeedTrending:^(NSArray *products) {
        if (products) {
            NSLog(@"😎😎😎 Successfully loaded homefeed timeline");
            for (Product *product in products) {
                NSString *text = product.name;
                NSLog(@"%@", text);
            }
            self.trendingProductsFetch = (NSMutableArray *) products;
            [self.feedTableView reloadData];
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
