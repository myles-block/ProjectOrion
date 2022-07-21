//
//  HomeFeedViewController.m
//  Orion
//
//  Created by Myles Block on 7/11/22.
//

//TODO: Add AFNetowrking Pod for image url pull
//TODO: Archive the current method used to pull API data so that it can be moved to manger file (and reconstruct a dictionary to hold data)
//TODO: Hide API keys behind secure wall, so that they cannot be used

#import "HomeFeedViewController.h"
#import "HomeFeedCell.h"

@interface HomeFeedViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *feedTableView;
@property (strong, nonatomic) NSArray *trendingProducts;//entire array of trending products given from API request

@end

@implementation HomeFeedViewController
NSArray *data;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
//    data = @[@"New York, NY", @"Los Angeles, CA", @"Chicago, IL", @"Houston, TX",
//                 @"Philadelphia, PA", @"Phoenix, AZ", @"San Diego, CA", @"San Antonio, TX",
//                 @"Dallas, TX", @"Detroit, MI", @"San Jose, CA", @"Indianapolis, IN",
//                 @"Jacksonville, FL", @"San Francisco, CA", @"Columbus, OH", @"Austin, TX",
//                 @"Memphis, TN", @"Baltimore, MD", @"Charlotte, ND", @"Fort Worth, TX"];
    self.feedTableView.dataSource = self;
    self.feedTableView.delegate = self;
    
    //URL Request (should get moved to API manager in a bit
    NSURL *url = [NSURL URLWithString:@"https://api.bestbuy.com/beta/products/trendingViewed?"];//add API Key back
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
           if (error != nil) {
               NSLog(@"%@", [error localizedDescription]);
           }
           else {
               NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
               
               self.trendingProducts = dataDictionary[@"results"];//sets trendingProducts to entire results of request
               for (NSDictionary *products in self.trendingProducts)//parses through trending products to grab product name
               {
                   NSLog(@"%@", products[@"names"][@"title"]);
               }
//               NSLog(@"%@", dataDictionary);
               // TODO: Store the products in a property to use elsewhere
               [self.feedTableView reloadData];//Reloads view
               
           }
       }];
    [task resume];
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
    HomeFeedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeFeedCell" forIndexPath:indexPath];
//        NSArray *cityState = [data[indexPath.row] componentsSeparatedByString:@", "];
//        cell.productName.text = cityState.firstObject;
    
    NSDictionary *list = self.trendingProducts[indexPath.row];//indexPath parse through each row of trendingProducts and points it to list
    cell.productName.text = list[@"names"][@"title"];//list grabs the title of product & sets to label
//    NSString *posterURLString = movie[@"poster_path"];
//    [cell.productImage setImageWithURL:posterURL];
    
    //TODO: Add AFNetworking Pod
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.trendingProducts.count;
//    return data.count;
}
@end
