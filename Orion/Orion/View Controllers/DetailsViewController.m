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
#import "Query Manager.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapForBookmark;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[APIManager shared] getProductSpecs:self.selectedProduct completion:^(Product *product) {
        self.productNameLabel.text = product.name;
        self.productDescriptionTextView.text = product.productDescription;
        self.productDescriptionTextView.editable = NO;
        self.productPrice.text = product.productPrice;
        NSString *posterURLString = product.productImage;
        NSURL *posterURL = [NSURL URLWithString:posterURLString];
        [self.productImage setImageWithURL:posterURL];
        
        self.selectedProduct = product;
        self.tapForBookmark = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
        
        self.tapForBookmark.numberOfTapsRequired = 2;
        [self.view addGestureRecognizer:self.tapForBookmark];
        
            

    }];
    
    // Do any additional setup after loading the view.
}



- (void)handleTapGesture:(UITapGestureRecognizer *)sender{
    if (sender.state == UIGestureRecognizerStateRecognized) {
        [self triggerAlert];
        NSString *currentUserID = PFUser.currentUser.objectId;
        [Query_Manager saveProductToBookmark:self.selectedProduct:currentUserID withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
            if(succeeded){
                NSLog(@"BOOKMARKED!!!");
            }
        }];
        
    }
}

- (void)triggerAlert {//function for alert controller
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Bookmarked!"
                                                                               message:@"This item is bookmarked & ready to view in bookmarked category"
                                                                        preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Got it!"
                                                        style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction * _Nonnull action) {
                                                             // handle cancel response here. Doing nothing will dismiss the view.
                                                      }];
    
    [alert addAction:cancelAction];//puts all of it together
    [self presentViewController:alert animated:YES completion:^{
        // optional code for what happens after the alert controller has finished presenting
    }];
    
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
