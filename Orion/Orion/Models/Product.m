//
//  Product.m
//  Orion
//
//  Created by Myles Block on 7/20/22.
//

#import "Product.h"

//TODO: Add dicitionary product method
@implementation Product
@dynamic name;
@dynamic productImage;
@dynamic productSKU;
@dynamic productPrice;
@dynamic productDescription;


+ (nonnull NSString *)parseClassName {
    return @"Product";
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
//    Product *new_product = [Product new];
    //sets up intializer for initWithDictionary
    
    
    if (self) {
//        new_product.name = dictionary[@"name"][@"title"];
//        new_product.productImage = dictionary[@"images"][@"standard"];
//        new_product.productSKU = dictionary[@"sku"];
//        new_product.productPrice = dictionary[@"prices"][@"regular"];
        
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
//    [new_product saveInBackground];
    return self;
}

- (instancetype)initWithProductAPIDictionary:(NSDictionary *)dictionary {
    self = [self init];
    
    if(self)  {
        self.name = dictionary[@"name"];
        self.productImage = dictionary[@"image"];
        NSNumber *sku = dictionary[@"sku"];
        self.productSKU = [sku stringValue];
        NSNumber *price = dictionary[@"regularPrice"];
        self.productPrice = [@"$" stringByAppendingString:[price stringValue]];
    }
    return self;
}

- (instancetype)initWithProductSpecs:(NSDictionary *)dictionary :(Product *)product{
    self = product;
    Product *new_product = [Product new];
    
    if(self) {
        //MARK: Back4App Declarations
        new_product.name = self.name;
        new_product.productImage = self.productImage;
        new_product.productSKU = self.productSKU;
        new_product.productPrice = self.productPrice;
        
        self.productDescription = dictionary[@"longDescription"];
        NSNumber *price = dictionary[@"regularPrice"];
        self.productPrice = [@"$" stringByAppendingString:[price stringValue]];
    }
    [new_product saveInBackground];
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

+ (NSMutableArray *)productsWithProductAPIArray: (NSArray *)dictionaries {
    NSMutableArray *products = [NSMutableArray array];
    for (NSDictionary *dictionary in dictionaries) {
        Product *product = [[Product alloc] initWithProductAPIDictionary:dictionary];
        [products addObject:product];
    }
    return products;
}

+ (Product *)productDetailAddition: (NSArray *)dictionaries :(Product *)givenProduct{//triggers when tapped on detail view
    for (NSDictionary *dictionary in dictionaries){
        [[Product alloc] initWithProductSpecs:dictionary :givenProduct];
    }
    return givenProduct;
}

+ (NSMutableArray *)productCreationviaSKU: (NSArray *)dictionaries {
    NSMutableArray *products = [NSMutableArray array];
    for (NSDictionary *dictionary in dictionaries) {
        Product *product = [[Product alloc] initWithProductAPIDictionary:dictionary];
        [products addObject:product];
    }
    return products;
}

//+ (Product *)detailProductAdditions: (Product *)sentProduct {
//    
//}
 





@end
