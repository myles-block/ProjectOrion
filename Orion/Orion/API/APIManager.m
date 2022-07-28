//
//  APIManager.m
//  Orion
//
//  Created by Myles Block on 7/21/22.
//

//TODO: WHEREAMIAT ~ working on getProductSpecs...need to add another conversion function into products that adds description to product model...consider refactoring
#import "APIManager.h"
#import "Product.h"

static NSString * const baseURLString = @"https://api.bestbuy.com/beta/products/";
static NSString * const productAPIURLString = @"https://api.bestbuy.com/v1/products";//URL String for Products API

@implementation APIManager

+ (instancetype)shared {
    static APIManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

- (instancetype)init {//Initializer of API Manager file: pulls api_key from plist
        NSString *path = [[NSBundle mainBundle] pathForResource: @"Keys" ofType: @"plist"];
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile: path];
        NSString *key = [dict objectForKey: @"api_Key"];
    self.api_key = key;
    if (self) {
        
    }
    return self;
}

- (void)getHomeFeedTrending:(void(^)(NSArray *products))completion {//Creates trending products request for Home Feed
    NSString *trendingParam = [NSString stringWithFormat:@"%@%@%@", baseURLString, @"trendingViewed?apiKey=", self.api_key];//stringWithFormat appends strings (%@ * amt of params)
    NSURL *url = [NSURL URLWithString:trendingParam];//add API Key back
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:20.0];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
           if (error != nil) {
               NSLog(@"%@", [error localizedDescription]);
           }
           else {
               NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
               
               NSArray *resultsArray = dataDictionary[@"results"];//results array of trending products
               NSMutableArray *trendingProducts = [Product productsWithArray:resultsArray];
               NSLog(@"%@", @"Logged✅✅✅");
               completion(trendingProducts);
           }
       }];
    [task resume];
}

//PAUSED on this setup
- (void)getProductSpecs:(Product *)passedItem {
    //passes into Product
    NSString *productAPILink = [NSString stringWithFormat:@"%@%@%@%@%@%@", productAPIURLString, @"(sku=", passedItem.productSKU, @")?apiKey=",self.api_key, @"&sort=longDescription.asc&show=longDescription,shortDescription,description,manufacturer,color,sku&format=json"];
    NSURL *url = [NSURL URLWithString:productAPIURLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:20.0];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
           if (error != nil) {
               NSLog(@"%@", [error localizedDescription]);
           }
           else {
               NSDictionary *givenRequest = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
               //TODO: Change the code below (and test request)
               NSArray *productInfo = givenRequest[@"products"];//results array of trending products
//               NSMutableArray *trendingProducts = [Product productsWithArray:productInfo];
               NSLog(@"%@", @"LoggedProductSpecs✅✅✅");
           }
       }];
    [task resume];
}

@end
