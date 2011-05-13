//
//  UIColor+ColorWithHex.h
//  ColorWithHex
//
//  Created by Angelo Villegas on 3/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIColor (ColorWithHex)

+ (UIColor *)colorWithHex:(UInt32)hexadecimal;
+ (UIColor *)colorWithHexString:(NSString *)hexadecimal;
+ (UIColor *)colorWithAlphaHex:(UInt32)hexadecimal;
+ (UIColor *)colorWithAlphaHexString:(NSString *)hexadecimal;
+ (UIColor *)randomColor;
// ObjC (manual hex conversion to RGB)
+ (UIColor *)colorWithHexa:(NSString *)hexadecimal;

@end