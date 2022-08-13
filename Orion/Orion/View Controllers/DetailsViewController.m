//
//  DetailsViewController.m
//  Orion
//
//  Created by Myles Block on 7/27/22.
//

#import "DetailsViewController.h"
#import "APIManager.h"
#import "Product.h"
#import "UIImageview+AFNetworking.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[APIManager shared] getProductSpecs:self.selectedProduct completion:^(Product *product) {
        self.productNameLabel.text = product.name;
        self.productDescription.text = product.productDescription;
        self.productPrice.text = product.productPrice;
        NSString *posterURLString = product.productImage;
        NSURL *posterURL = [NSURL URLWithString:posterURLString];
        [self.productImage setImageWithURL:posterURL];
    }];
    
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

@end
