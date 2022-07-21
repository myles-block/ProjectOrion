//
//  Product.m
//  Orion
//
//  Created by Myles Block on 7/20/22.
//

#import "Product.h"

@implementation Product

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    //sets up intializer for initWithDictionary

    if (self) {
        self.name = dictionary[@"name"];
        self.productImage = dictionary[@"profile_image_url_https"];
        //...
    // Initialize any other properties
    }
    return self;
}

@end
