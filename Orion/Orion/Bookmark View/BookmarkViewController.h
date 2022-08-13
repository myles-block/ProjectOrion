//
//  BookmarkViewController.h
//  Orion
//
//  Created by Myles Block on 8/12/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BookmarkViewController : UIViewController
@property (strong, nonatomic) IBOutlet UICollectionView *bookmarkCollectionView;

@property (strong, nonatomic) NSArray *bookmarkedSKUList;
@end

NS_ASSUME_NONNULL_END
