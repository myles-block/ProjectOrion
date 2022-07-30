//
//  FilterViewController.m
//  Orion
//
//  Created by Myles Block on 7/27/22.
//

#import "FilterViewController.h"
#import "CategoryCollectionViewCell.h"

//TODO: Decide how to get categories to save within array of dictionaries or go with workaround...

@interface FilterViewController ()<UICollectionViewDataSource>
@property (strong, nonatomic) NSArray *keys;
@property (strong, nonatomic) NSArray *category_list;
@end

@implementation FilterViewController

static NSDictionary* categories = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.filterCollectionView.dataSource = self;
    // Do any additional setup after loading the view.
    
    
    
    //Dictionary of Categories:
    
    if (!categories) {
        categories = @{@"Cell Phones": @"abcat0800000",
                       @"Cell Phone Accessories": @"abcat0811002",
                       @"Cell Phone Cases": @"abcat0811006",
                       @"Adapters & Cables": @"abcat0811007",
                       @"Movies & Music": @"abcat0600000",
                       @"Video Games": @"abcat0700000"};
        
    }
    
    self.keys = [categories allKeys];//sets all the keys to an array
    
//    self.category_list =
}

- (UIColor*)colorForIndexPath:(NSIndexPath *) indexPath{
    int totalColors = 100;
    if(indexPath.row >= totalColors){
        return UIColor.blackColor;    // return black if we get an unexpected row index
    }
    
    CGFloat hueValue = (CGFloat)(indexPath.row)/(CGFloat)(totalColors);
    return [UIColor colorWithHue:hueValue saturation:1.0 brightness:1.0 alpha:1.0];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CategoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CategoryCollectionViewCell" forIndexPath:indexPath];
//        UIColor *cellColor = [self colorForIndexPath:indexPath];
//        cell.backgroundColor = cellColor;
//
//        if(CGColorGetNumberOfComponents(cellColor.CGColor) == 4){
//            float redComponent = CGColorGetComponents(cellColor.CGColor)[0] * 255;
//            float greenComponent = CGColorGetComponents(cellColor.CGColor)[1] * 255;
//            float blueComponent = CGColorGetComponents(cellColor.CGColor)[2] * 255;
//            cell.categoryLabel.text = [NSString stringWithFormat:@"%.0f, %.0f, %.0f", redComponent, greenComponent, blueComponent];
//        }
    
        NSString *category_name = self.keys[indexPath.row];
        NSLog(@"%@", self.keys);
        cell.categoryLabel.text = category_name;
        return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    int totalColors = 100;
    return categories.count;
}

/*
- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    <#code#>
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
    <#code#>
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    <#code#>
}

- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    <#code#>
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    <#code#>
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    <#code#>
}

- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    <#code#>
}

- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
    <#code#>
}

- (void)setNeedsFocusUpdate {
    <#code#>
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
    <#code#>
}

- (void)updateFocusIfNeeded {
    <#code#>
}
*/
@end
