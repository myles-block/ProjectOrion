//
//  Query Manager.m
//  Orion
//
//  Created by Myles Block on 7/15/22.
//

#import "Query Manager.h"
#import "Parse/Parse.h"

@implementation Query_Manager

//+ is an class method vs - instance method
+ (void) saveProfilePicture:(PFFileObject *)image withCompletion: (PFBooleanResultBlock _Nullable)completion {
    [[PFUser  currentUser] setObject:image forKey:@"profileImage"];
    [[PFUser currentUser] saveInBackground];
}

+ (PFFileObject *)getPFFileFromImage: (UIImage * _Nullable)image {
    if (!image) {
        return nil;
    }
    NSData *imageData = UIImagePNGRepresentation(image);
    if (!imageData) {
        return nil;
    }
    
    return [PFFileObject fileObjectWithName:@"ProfileImage.png" data:imageData];
}


@end
