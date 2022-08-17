//
//  TrieNode.h
//  Orion
//
//  Created by Myles Block on 8/11/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TrieNode : NSObject

@property (nonatomic, assign) BOOL isLast;
@property (nonatomic, strong) NSDictionary *children;//represents all the letters of the alphabet
@property (nonatomic, strong) NSString *finalWord;


@end

NS_ASSUME_NONNULL_END
