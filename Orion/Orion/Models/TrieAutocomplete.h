//
//  TrieAutocomplete.h
//  Orion
//
//  Created by Myles Block on 8/11/22.
//

#import <Foundation/Foundation.h>
#import "TrieNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface TrieAutocomplete : NSObject

@property (nonatomic, strong) TrieNode *root;//root node
+ (void)insert: (TrieNode *)base :(NSString *)key;
- (instancetype) init;



@end

NS_ASSUME_NONNULL_END
