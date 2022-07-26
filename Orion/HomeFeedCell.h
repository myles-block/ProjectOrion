//
//  HomeFeedCell.h
//  Orion
//
//  Created by Myles Block on 7/20/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeFeedCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *productName;

@end

NS_ASSUME_NONNULL_END
