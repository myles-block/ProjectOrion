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
    
    self.category_list = @[
    @{@"name": @"Adapters & Cables", @"id": @"abcat0811007"},
    @{@"name": @"Appliances", @"id": @"abcat0900000"},
    @{@"name": @"Appliance Parts & Accessories", @"id": @"abcat0916000"},
    @{@"name": @"Blu-ray & DVD Players", @"id": @"abcat0102000"},
    @{@"name": @"Cell Phones", @"id" : @"abcat0800000"},
    @{@"name": @"Cell Phone Accessories", @"id": @"abcat0811002"},
    @{@"name": @"Cell Phone Cases", @"id" : @"abcat0811006"},
    @{@"name": @"Computer Accessories & Peripherals", @"id": @"abcat0515000"},
    @{@"name": @"Computer Keyboards", @"id": @"abcat0513004"},
    @{@"name": @"Headphones", @"id": @"abcat0204000"},
    @{@"name": @"Home Audio Accessories", @"id": @"abcat0208000"},
    @{@"name": @"Laptops", @"id": @"abcat0502000"},
    @{@"name": @"Laptop Accessories", @"id": @"abcat0515025"},
    @{@"name": @"Monitors", @"id": @"abcat0509000"},
    @{@"name": @"Movies & Music", @"id": @"abcat0600000"},
    @{@"name": @"Office", @"id": @"abcat0805000"},
    @{@"name": @"Printers, Ink & Toner", @"id": @"abcat0511001"},
    @{@"name": @"Speakers", @"id": @"abcat0204000"},
    @{@"name": @"Tax Preparation Software", @"id": @"abcat0508016"},
    @{@"name": @"TV & Home Theater", @"id": @"abcat0100000"},
    @{@"name": @"Video Games", @"id": @"abcat0700000"},
    @{@"name": @"Wireless & Bluetooth Mice", @"id": @"abcat0513001"}
    ];
    
//    NSLog(@"%@", self.category_list);
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
//        if(CGColorGetNumberOfComponents(cellColor.CGColor) == 4){
//            float redComponent = CGColorGetComponents(cellColor.CGColor)[0] * 255;
//            float greenComponent = CGColorGetComponents(cellColor.CGColor)[1] * 255;
//            float blueComponent = CGColorGetComponents(cellColor.CGColor)[2] * 255;
//            cell.categoryLabel.text = [NSString stringWithFormat:@"%.0f, %.0f, %.0f", redComponent, greenComponent, blueComponent];
//        }
//    return cell;
    
//        NSString *category_name = self.keys[indexPath.row];
//        NSLog(@"%@", self.keys);
//        NSLog(@"%@", category_name);
//        cell.categoryLabel.text = category_name;
    
    NSDictionary *category_dict = self.category_list[indexPath.row];
    NSString *category_name = [category_dict objectForKey:@"name"];
    NSLog(@"%@", category_name);
    cell.categoryLabel.text = [category_dict objectForKey: @"name"];
    NSLog(@"%@", [category_dict objectForKey:@"name"]);
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    int totalColors = 100;
    return self.category_list.count;
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
