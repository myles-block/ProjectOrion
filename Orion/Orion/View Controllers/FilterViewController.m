//
//  FilterViewController.m
//  Orion
//
//  Created by Myles Block on 7/27/22.
//

#import "FilterViewController.h"
#import "CategorySpecificViewController.h"
#import "CategoryCollectionViewCell.h"

//TODO: Decide how to get categories to save within array of dictionaries or go with workaround...

@interface FilterViewController ()<UICollectionViewDataSource>
@property (strong, nonatomic) NSArray *category_list;
@end

@implementation FilterViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.filterCollectionView.dataSource = self;
    // Do any additional setup after loading the view.
    
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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSArray *indexPaths = self.filterCollectionView.indexPathsForSelectedItems;
    NSIndexPath *index = indexPaths[0];
    NSDictionary *dataToPass = self.category_list[index.row];
    NSLog(@"%@", dataToPass);
    CategorySpecificViewController *detailVC = [segue destinationViewController];
    detailVC.selectedCategoryID = dataToPass;
}



- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CategoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CategoryCollectionViewCell" forIndexPath:indexPath];
    NSDictionary *category_dict = self.category_list[indexPath.row];//dicitonary embedded in each category list
    cell.categoryLabel.text = [category_dict objectForKey: @"name"];
//    NSLog(@"%@", [category_dict objectForKey:@"name"]);
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.category_list.count;
}
@end
