//
//  Product.m
//  Orion
//
//  Created by Myles Block on 7/20/22.
//

#import "Product.h"

//TODO: Add dicitionary product method
@implementation Product

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    //sets up intializer for initWithDictionary

    if (self) {
        self.name = dictionary[@"names"][@"title"];
        self.productImage = dictionary[@"images"][@"standard"];
        //...
    // Initialize any other properties
    }
    return self;
}


+ (NSMutableArray *)productsWithArray:(NSArray *)dictionaries {
    NSMutableArray *products = [NSMutableArray array];
    for (NSDictionary *dictionary in dictionaries) {
        Product *product = [[Product alloc] initWithDictionary:dictionary];
        [products addObject:product];
    }
    return products;
}

- (NSString *) getProductName {
    return self.name;
}
@end
