//
//  TrieAutocomplete.m
//  Orion
//
//  Created by Myles Block on 8/11/22.
//

#import "TrieAutocomplete.h"
#import "TrieNode.h"

@implementation TrieAutocomplete

- (instancetype) init {
    self = [super init];
    
    if(self) {
        self.root = [[TrieNode alloc] init];
    }
    return self;
}

+ (void)insert: (TrieNode *)base :(NSString *)key {
    for (int i = 0; i < [key length]; i++){
        NSString *theCharacter = [NSString stringWithFormat:@"%c", [key characterAtIndex:i]];
        //[key containsString:theCharacter] == NO
        if ([base.children objectForKey:theCharacter] == Nil)
        {
            TrieNode *new_node = [[TrieNode alloc] init];
            [base.children setValue: new_node forKey:theCharacter];//sets key to character and adds node as def
        }
        base = base.children[theCharacter];//shifts to inner letter
        if(i == [key length] - 1)
        {
            base.isLast = YES;
            base.finalWord = key;
        }
        
    }
}


//+ (void)traversal: (TrieNode *)base :(NSString *)key  {
//    if(base.isLast){
//        NSLog(@"%@", )
//    }
//}

//+ (BOOL)search: (TrieNode *)base :(NSString *)key {
//    if((base.isLast == YES) && ([key length] == 10)){
//        return YES;
//    }
//    NSString *first = [NSString stringWithFormat:@"%c", [key characterAtIndex:0]];
//
//}
@end
