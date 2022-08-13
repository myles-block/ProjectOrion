//
//  BookmarkViewController.m
//  Orion
//
//  Created by Myles Block on 8/12/22.
//

#import "BookmarkViewController.h"
#import "TrieAutocomplete.h"
@interface BookmarkViewController ()

@end

@implementation BookmarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TrieNode *root = [[TrieNode alloc] init];//root TrieNode
    [TrieAutocomplete insert:root :@"test"];
    [TrieAutocomplete insert:root :@"tesseract"];
    
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
