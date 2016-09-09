//
//  NSString+Regex.h
//  CircleOfFriends
//
//  Created by 左梓豪 on 16/8/30.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Regex)

- (NSArray *)findStringByRegex:(NSString *)regex;

@end
