//
//  TypeSpecificCells.h
//  Orion
//
//  Created by Myles Block on 8/1/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TypeSpecificCells : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *typeSpecificImage;
@property (weak, nonatomic) IBOutlet UILabel *typeSpecificName;
@property (weak, nonatomic) IBOutlet UILabel *typeSpecificPrice;


@end

NS_ASSUME_NONNULL_END
