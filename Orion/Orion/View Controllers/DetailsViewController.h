//
//  DetailsViewController.h
//  Orion
//
//  Created by Myles Block on 7/27/22.
//

#import <UIKit/UIKit.h>
#import "Product.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *productPrice;
@property (weak, nonatomic) IBOutlet UILabel *sku;
@property (strong, nonatomic) IBOutlet UITextView *productDescriptionTextView;

//HomeFeed SEGUE
@property (nonatomic, strong) Product *selectedProduct;


@end

NS_ASSUME_NONNULL_END
