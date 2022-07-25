//
//  APIManager.m
//  Orion
//
//  Created by Myles Block on 7/21/22.
//

//TODO: WHEREAMIAT ~ dataDictionary connect to productsWithArray...need to set Array values to model labels
#import "APIManager.h"
#import "Product.h"

static NSString * const baseURLString = @"https://api.bestbuy.com/beta/products/";

@implementation APIManager

+ (instancetype)shared {
    static APIManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

- (instancetype)init {//Initializer of API Manager file
    
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    
    // TODO: fix code below to pull API Keys from your new Keys.plist file
    
        NSString *path = [[NSBundle mainBundle] pathForResource: @"Keys" ofType: @"plist"];
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile: path];
        NSString *key = [dict objectForKey: @"api_Key"];
    self.api_key = key;
    if (self) {
        
    }
    return self;
}

- (void)getHomeFeedTrending:(void(^)(NSArray *products))completion {
    NSString *trendingParam = [NSString stringWithFormat:@"%@%@%@", baseURLString, @"trendingViewed?apiKey=", self.api_key];//stringWithFormat appends strings (%@ * amt of params)
    NSLog(@"%@", trendingParam);
    NSURL *url = [NSURL URLWithString:trendingParam];//add API Key back
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
           if (error != nil) {
               NSLog(@"%@", [error localizedDescription]);
           }
           else {
               NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
               
               NSArray *resultsArray = dataDictionary[@"results"];//results array of trending products
               NSMutableArray *trendingProducts = [Product productsWithArray:resultsArray];
               NSLog(@"%@", @"CCCHHEEECCKK");
//               NSLog(@"%@", trendingProducts);
               for (Product *products in trendingProducts)//parses through trending products to grab product name
               {
//                   NSLog(@"%@", [products getProductName]);
//                   NSLog(@"%@", products.name);
               }
               completion(trendingProducts);
           }
       }];
    [task resume];
}

@end
