//
//  Query Manager.m
//  Orion
//
//  Created by Myles Block on 7/15/22.
//

#import "Query Manager.h"
#import "Parse/Parse.h"
#import "Product.h"
#import "UIImageview+AFNetworking.h"

@implementation Query_Manager
//saveProductToBookmark is bit weird, had to save by product SKU

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

+ (void) getImagefromParse:(NSString *)objectID completion:(void(^)(NSURL *returnURL, PFObject *thisCurrentUser))completion{
    PFQuery *query = [PFQuery queryWithClassName:@"_User"];
    [query whereKey:@"objectId" equalTo:objectID];
    [query findObjectsInBackgroundWithBlock:^(NSArray *users, NSError *error) {
        if (users != nil) {
            // do something with the array of object returned by the call
            PFObject *thisUser = [users firstObject];
            NSString *url = ((PFFileObject *)(thisUser[@"profileImage"])).url;
            NSURL *imageUrl = [NSURL URLWithString:url];
            completion(imageUrl, thisUser);

        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
    
}

+ (void) saveProductToBookmark:(Product *)bookmarkedProduct :(NSString *)objectID withCompletion: (PFBooleanResultBlock _Nullable)completion {
    PFQuery *query = [PFQuery queryWithClassName:@"_User"];
    [query whereKey:@"objectId" equalTo:objectID];
    [query findObjectsInBackgroundWithBlock:^(NSArray *users, NSError *error) {
        if (users != nil) {
            // do something with the array of object returned by the call
            PFObject *thisUser = [users firstObject];
            NSArray *userChecks = (thisUser[@"bookmarkedTech"]);
            BOOL isTheObjectThere = [userChecks containsObject:bookmarkedProduct.productSKU];
            if(isTheObjectThere == NO)
            {
                [[PFUser currentUser] addObject:bookmarkedProduct.productSKU forKey:@"bookmarkedTech"];
                [[PFUser currentUser] saveInBackground];
            }

        }
        else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
    
}

+ (void) getBookmarked:(NSString *)objectID completion:(void(^)(NSMutableArray *bookmarkList))completion{
    PFQuery *query = [PFQuery queryWithClassName:@"_User"];
    [query whereKey:@"objectId" equalTo:objectID];
    [query findObjectsInBackgroundWithBlock:^(NSArray *users, NSError *error) {
        if (users != nil) {
            // do something with the array of object returned by the call
            PFObject *thisUser = [users firstObject];
            NSMutableArray *bookmarkList = (thisUser[@"bookmarkedTech"]);
            completion(bookmarkList);

        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
    
}



@end
