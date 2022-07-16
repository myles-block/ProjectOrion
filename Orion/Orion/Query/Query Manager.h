//
//  Query Manager.h
//  Orion
//
//  Created by Myles Block on 7/15/22.
//

#import <Foundation/Foundation.h>
#import "Parse/Parse.h"

NS_ASSUME_NONNULL_BEGIN

@interface Query_Manager : NSObject
+ (void) saveProfilePicture:(PFFileObject *)image withCompletion: (PFBooleanResultBlock _Nullable)completion;
+ (PFFileObject *)getPFFileFromImage: (UIImage * _Nullable)image;
@end

NS_ASSUME_NONNULL_END
