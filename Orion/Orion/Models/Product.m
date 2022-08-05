//
//  Product.m
//  Orion
//
//  Created by Myles Block on 7/20/22.
//

#import "Product.h"

static bool productAPICheck = false;
//TODO: Add dicitionary product method
@implementation Product

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    //sets up intializer for initWithDictionary
    
    
    if (self) {
        self.name = dictionary[@"names"][@"title"];
        self.productImage = dictionary[@"images"][@"standard"];
        self.productSKU = dictionary[@"sku"];
        self.productPrice = dictionary[@"prices"][@"regular"];
    }
    
//    if(productAPICheck == false)//initializes based on which API is being used
//    {
//        if (self) {
//            self.name = dictionary[@"names"][@"title"];
//            self.productImage = dictionary[@"images"][@"standard"];
//            self.productSKU = dictionary[@"sku"];
//            self.productPrice = dictionary[@"prices"][@"regular"];
//    }
//    else
//    {
//        if (self) {
//            self.name = dictionary[@"name"];
//            self.productImage = dictionary[@"image"];
//            self.productSKU = dictionary[@"sku"];
//            self.productPrice = dictionary[@"regularPrice"];
//    }
//    }
    
        //...
    // Initialize any other properties
    return self;
}

- (instancetype)initWithProductAPIDictionary:(NSDictionary *)dictionary {
    self = [self init];
    
    if(self)  {
        self.name = dictionary[@"name"];
        self.productImage = dictionary[@"image"];
        self.productSKU = dictionary[@"sku"];
        self.productPrice = dictionary[@"regularPrice"];
    }
    return self;
}


+ (NSMutableArray *)productsWithArray:(NSArray *)dictionaries {
    NSMutableArray *products = [NSMutableArray array];
    for (NSDictionary *dictionary in dictionaries) {
        productAPICheck = false;
        Product *product = [[Product alloc] initWithDictionary:dictionary];
        [products addObject:product];
    }
    return products;
}

+ (NSMutableArray *)productsWithProductAPIArray: (NSArray *)dictionaries {
    NSMutableArray *products = [NSMutableArray array];
    for (NSDictionary *dictionary in dictionaries) {
        productAPICheck = true;
        Product *product = [[Product alloc] initWithProductAPIDictionary:dictionary];
        [products addObject:product];
    }
    return products;
}
 



@end
