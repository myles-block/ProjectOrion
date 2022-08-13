//
//  Query Manager.h
//  Orion
//
//  Created by Myles Block on 7/15/22.
//

#import <Foundation/Foundation.h>
#import "Parse/Parse.h"
#import "Product.h"

NS_ASSUME_NONNULL_BEGIN

@interface Query_Manager : NSObject

+ (void) saveProfilePicture:(PFFileObject *)image withCompletion: (PFBooleanResultBlock _Nullable)completion;

+ (PFFileObject *)getPFFileFromImage: (UIImage * _Nullable)image;

+ (void) getImagefromParse:(NSString *)objectID completion:(void(^)(NSURL *returnURL, PFObject *thisCurrentUser))completion;

+ (void) saveProductToBookmark:(Product *)bookmarkedProduct :(NSString *)objectID withCompletion: (PFBooleanResultBlock _Nullable)completion;

+ (void) getBookmarked:(NSString *)objectID completion:(void(^)(NSMutableArray *bookmarkList))completion;

@end

NS_ASSUME_NONNULL_END
