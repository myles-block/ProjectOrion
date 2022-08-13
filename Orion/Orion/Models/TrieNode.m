//
//  TrieNode.m
//  Orion
//
//  Created by Myles Block on 8/11/22.
//

#import "TrieNode.h"

@implementation TrieNode

- (instancetype) init{
    self = [super init];
    
    if(self) {
        self.isLast = NO;
        self.children = [[NSMutableDictionary alloc] init];
    }
    return self;
}

@end
