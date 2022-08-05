//
//  SearchTableViewCell.h
//  Orion
//
//  Created by Myles Block on 8/4/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *resultImage;
@property (strong, nonatomic) IBOutlet UILabel *resultProductLabel;


@end

NS_ASSUME_NONNULL_END
