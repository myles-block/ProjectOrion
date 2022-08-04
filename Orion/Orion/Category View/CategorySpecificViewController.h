//
//  CategorySpecificViewController.h
//  Orion
//
//  Created by Myles Block on 8/1/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CategorySpecificViewController : UIViewController



//FilterView SEGUE
@property (nonatomic, strong) NSDictionary *selectedCategoryID;
//is the id & name of the specific category selection

@end

NS_ASSUME_NONNULL_END
