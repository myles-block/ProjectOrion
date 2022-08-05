//
//  SearchViewController.m
//  Orion
//
//  Created by Myles Block on 8/4/22.
//

#import "SearchViewController.h"
#import "SearchTableViewCell.h"

@interface SearchViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
@property (strong, nonatomic) IBOutlet UITableView *searchTableView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong, nonatomic) NSArray *data;
@property (strong, nonatomic) NSArray *filteredData;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Search";
    
    
    self.searchTableView.delegate = self;
    self.searchTableView.dataSource = self;
    self.searchBar.delegate = self;
    
    //TestCode!
    self.data = @[@"New York, NY", @"Los Angeles, CA", @"Chicago, IL", @"Houston, TX",
                      @"Philadelphia, PA", @"Phoenix, AZ", @"San Diego, CA", @"San Antonio, TX",
                      @"Dallas, TX", @"Detroit, MI", @"San Jose, CA", @"Indianapolis, IN",
                      @"Jacksonville, FL", @"San Francisco, CA", @"Columbus, OH", @"Austin, TX",
                      @"Memphis, TN", @"Baltimore, MD", @"Charlotte, ND", @"Fort Worth, TX"];

        self.filteredData = self.data;
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    SearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchCell" forIndexPath:indexPath];
       cell.resultProductLabel.text = self.filteredData[indexPath.row];
       
       return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.filteredData.count;
}


//MARK: Search Bar Functions
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    if (searchText.length != 0) {
        
        NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(NSString *evaluatedObject, NSDictionary *bindings) {
            return [evaluatedObject containsString:searchText];
        }];
        self.filteredData = [self.data filteredArrayUsingPredicate:predicate];
        
        NSLog(@"%@", self.filteredData);
        
    }
    else {
        self.filteredData = self.data;
    }
    
    [self.searchTableView reloadData];
 
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {//shows cancel button on search bar
    self.searchBar.showsCancelButton = YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    self.searchBar.showsCancelButton = NO;//hides cancel button
    self.searchBar.text = @"";//sets text field to empty
    [self.searchBar resignFirstResponder];
}


//- (void)encodeWithCoder:(nonnull NSCoder *)coder {
//    <#code#>
//}
//
//- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
//    <#code#>
//}
//
//- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}
//
//- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
//    <#code#>
//}
//
//- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}
//
//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
//    <#code#>
//}
//
//- (void)setNeedsFocusUpdate {
//    <#code#>
//}
//
//- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
//    <#code#>
//}
//
//- (void)updateFocusIfNeeded {
//    <#code#>
//}

@end
