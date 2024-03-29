//
//  Product.h
//  Orion
//
//  Created by Myles Block on 7/20/22.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import <UIKit/UIKit.h>//needed for CGFloat

NS_ASSUME_NONNULL_BEGIN

@interface Product : PFObject<PFSubclassing>
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *productImage;
@property (nonatomic, strong) NSString *productSKU;
@property (nonatomic, strong) NSString *productPrice;
@property (nonatomic, strong) NSString *productDescription;

//@property CGFloat *productPrice;

//@property BOOL *productAPICheck;//checks if intialized from productAPI

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;//intializer for home feed product dictionary (implementation in .m file)

- (instancetype)initWithProductAPIDictionary:(NSDictionary *)dictionary;

+ (NSMutableArray *)productsWithArray:(NSArray *)dictionaries;//parses through results and calls intializer function

+ (NSMutableArray *)productsWithProductAPIArray: (NSArray *)dictionaries;//parses through product array and calls intializer function

+ (Product *)productDetailAddition: (NSArray *)dictionaries :(Product *)givenProduct;

+ (NSMutableArray *)productCreationviaSKU: (NSArray *)dictionaries;

+ (PFObject *)productToPFObject: (Product *)givenProduct;

@end

NS_ASSUME_NONNULL_END
