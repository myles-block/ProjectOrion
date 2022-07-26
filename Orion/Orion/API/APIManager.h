//
//  APIManager.h
//  Orion
//
//  Created by Myles Block on 7/21/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface APIManager : NSObject

@property (nonatomic) NSString *api_key;
+ (instancetype)shared;
- (void)getHomeFeedTrending:(void(^)(NSArray *products))completion;

@end

NS_ASSUME_NONNULL_END
