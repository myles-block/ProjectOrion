//
//  Product.h
//  Orion
//
//  Created by Myles Block on 7/20/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Product : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *productImage;
@property (nonatomic, strong) NSString *productSKU;



- (instancetype)initWithDictionary:(NSDictionary *)dictionary;//intializer for home feed product dictionary (implementation in .m file)

+ (NSMutableArray *)productsWithArray:(NSArray *)dictionaries;//parses through results and calls intializer function


@end

NS_ASSUME_NONNULL_END
