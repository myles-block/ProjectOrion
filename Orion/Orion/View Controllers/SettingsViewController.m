//
//  SettingsViewController.m
//  Orion
//
//  Created by Myles Block on 7/12/22.
//

#import "SettingsViewController.h"
#import "SceneDelegate.h"
#import "LoginViewController.h"
#import "Parse/Parse.h"
#import "Query Manager.h"
#import "UIImageview+AFNetworking.h"

@interface SettingsViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *profileName;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectedProfilePhotoImageView.clipsToBounds = YES;
    self.selectedProfilePhotoImageView.layer.cornerRadius = 125;
    
    NSString *currentUserID = PFUser.currentUser.objectId;
    [Query_Manager getImagefromParse:currentUserID completion:^(NSURL * _Nonnull returnURL, PFObject * _Nonnull thisCurrentUser) {
        if(returnURL)
        {
            [self.selectedProfilePhotoImageView setImageWithURL:returnURL];
            self.profileName.text = thisCurrentUser[@"username"];
        }
    }];
    
    // Do any additional setup after loading the view.
}



//MARK: BUTTON FUNCTIONS

- (IBAction)backButton:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)didTapSetProfilePicture:(id)sender {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];//creates new UIImagePickerController
    imagePickerVC.delegate = self;//delegates
    imagePickerVC.allowsEditing = YES;//allows editing

    // The Xcode simulator does not support taking pictures, so let's first check that the camera is indeed supported on the device before trying to present it.
//    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {//checks if camera is supported
//        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
//    }
//    else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;//sets sourceType for controller to photo library
//    }

    [self presentViewController:imagePickerVC animated:YES completion:nil];//presents image picker
}

- (IBAction)didTapLogout:(id)sender {
    
    SceneDelegate *mySceneDelegate = (SceneDelegate * )UIApplication.sharedApplication.connectedScenes.allObjects.firstObject.delegate;

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    mySceneDelegate.window.rootViewController = loginViewController;//^^all this code moves the storyboard back to the login screen
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error){}];//clears out the user's information & sets it to nil
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {

    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
//    UIImage *editedImage = info[UIImagePickerControllerEditedImage];

    // Do something with the images (based on your use case)
    originalImage = [self resizeImage:originalImage withSize:CGSizeMake(580, 580)];

    [Query_Manager saveProfilePicture:[Query_Manager getPFFileFromImage:originalImage] withCompletion:^(BOOL succeeded, NSError * _Nullable error) {//pulls from query manager functions
        if(succeeded){
            NSLog(@"Pushed chosen photo to back-end: 📸📸📸📸📸📸📸📸");
        }
    }];
    
    [self.selectedProfilePhotoImageView setImage:originalImage];
//    [PFUser currentUser]
//    [self.selectedPhotoImageView setImage:originalImage];
//    self.imgForPost = originalImage;

    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];

    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;

    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return newImage;
}

@end
