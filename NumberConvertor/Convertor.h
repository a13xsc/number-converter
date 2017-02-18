//
//  Convertor.h
//  NumberConvertor
//
//  Created by Alex Craciun on 23/10/15.
//  Copyright © 2015 Alex Craciun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Convertor : NSObject

- (NSInteger)romanToArab:(NSString *)objcinput;

- (NSString *)arabToRoman:(NSInteger)x;

- (int)checkInput:(id)input;

@end
