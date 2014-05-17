//
//  AVHexColor.h
//  ColorWithHex
//
//  Created by Angelo Villegas on 3/24/11.
//  Copyright (c) 2011 Angelo Villegas. All rights reserved.
//	http://www.studiovillegas.com/
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

#import <Foundation/Foundation.h>

#pragma clang diagnostic push
#pragma ide diagnostic ignored "OCUnusedMethodInspection"

#if TARGET_OS_IPHONE
#define AVColor UIColor
#else
#define AVColor NSColor
#endif

@interface AVHexColor : NSObject

/*
 * Convert hexadecimal value to RGB
 *
 * Accepts several hex length:
 * 		1 = 0xB
 * 		2 = 0xGB
 *		3 = 0xRGB
 *		4 = 0xaRGB
 *		6 = 0xRRGGBB
 *		8 = 0xaaRRGGBB
 */
+ (AVColor *)colorWithHex:(UInt32)hexadecimal;

/*
 * Convert string hex value to RGB
 *
 * Accepts several hex length:
 *		3 = #RGB
 *		4 = #aRGB
 *		6 = #RRGGBB
 *		8 = #aaRRGGBB
 */
+ (AVColor *)colorWithHexString:(NSString *)hexadecimal;

/*
 * Convert hexadecimal value to RGB
 * format:
 *		0x = Hexadecimal specifier (# for strings)
 *		ff = alpha, ff = red, ff = green, ff = blue
 */
+ (AVColor *)colorWithAlphaHex:(UInt32)hexadecimal __attribute__((deprecated("Use 'colorWithHex:' instead")));
+ (AVColor *)colorWithAlphaHexString:(NSString *)hexadecimal __attribute__((deprecated("Use 'colorWithHexString:' instead.")));

// Return the hexadecimal value of the RGB color specified.
+ (NSString *)colorWithRGBToHex:(AVColor *)color __attribute__((deprecated("Use 'hexStringFromColor:' instead.")));
+ (NSString *)hexStringFromColor:(AVColor *)color;
+ (NSString *)hexStringFromColor:(AVColor *)color withHash:(BOOL)withHash;
+ (NSString *)hexStringWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

// Generates a color randomly
+ (AVColor *)randomColor;

// Some convenience methods to create colors
+ (AVColor *)oliveColor;				// 808000
+ (AVColor *)azureColor;				// F0FFFF
+ (AVColor *)orchidColor;				// DA70D6
+ (AVColor *)thistleColor;				// D8BFD8
+ (AVColor *)beigeColor;				// F5F5DC
+ (AVColor *)bananaColor;				// E3CF57
+ (AVColor *)plumColor;					// DDA0DD
+ (AVColor *)brickColor;				// 9C661F
+ (AVColor *)fireBrickColor;			// B22222
+ (AVColor *)skyBlueColor;				// 87CEEB
+ (AVColor *)khakiColor;				// F0E68C
+ (AVColor *)wheatColor;				// F5DEB3
+ (AVColor *)burlywoodColor;			// DEB887
+ (AVColor *)cadetBlueColor;			// 5F9EA0
+ (AVColor *)carrotColor;				// ED9121
+ (AVColor *)indigoColor;				// 4B0082
+ (AVColor *)maroonColor;				// 800000
+ (AVColor *)ceruleanColor;				// 007BA7
+ (AVColor *)moccasinColor;				// FFE4B5
+ (AVColor *)tanColor;					// D2B48C
+ (AVColor *)melonColor;				// E3A869
+ (AVColor *)cobaltColor;				// 3D59AB
+ (AVColor *)crimsonColor;				// DC143C
+ (AVColor *)mistyRoseColor;			// FFE4E1
+ (AVColor *)pinkColor;					// FFC0CB
+ (AVColor *)irisColor;					// 5A4FCF
+ (AVColor *)chartreuseColor;			// 7FFF00
+ (AVColor *)navyColor;					// 000080
+ (AVColor *)mintColor;					// BDFCC9
+ (AVColor *)tealColor;					// 008080
+ (AVColor *)violetColor;				// EE82EE
+ (AVColor *)limeColor;					// 32CD32
// Alloy Colors
+ (AVColor *)bronzeColor;				// CD7F32
+ (AVColor *)goldColor;					// FFD700
+ (AVColor *)silverColor;				// C0C0C0
// Gem Colors
+ (AVColor *)emeraldColor;				// 50C878
+ (AVColor *)rubyColor;					// E0115F
+ (AVColor *)sapphireColor;				// 082567
+ (AVColor *)aquamarineColor;			// 7FFFD4
+ (AVColor *)turquoiseColor;			// 40E0D0
// Dark Colors
+ (AVColor *)darkRedColor;				// 8B0000
+ (AVColor *)darkGreenColor;			// 006400
+ (AVColor *)darkBlueColor;				// 00008B
+ (AVColor *)darkCyanColor;				// 008B8B
+ (AVColor *)darkYellowColor;			// B5A42E
+ (AVColor *)darkMagentaColor;			// 8B008B
+ (AVColor *)darkOrangeColor;			// FF8C00
+ (AVColor *)darkVioletColor;			// 9400D3
// Light Colors
+ (AVColor *)lightRedColor;				// F26C4F
+ (AVColor *)lightGreenColor;			// 90EE90
+ (AVColor *)lightBlueColor;			// ADD8E6
+ (AVColor *)lightCyanColor;			// E0FFFF
+ (AVColor *)lightYellowColor;			// FFFFE0
+ (AVColor *)lightMagentaColor;			// FF77FF
+ (AVColor *)lightOrangeColor;			// E7B98A
+ (AVColor *)lightVioletColor;			// B98AE7

// ObjC (manual hex conversion to RGB)
+ (AVColor *)colorWithHexa:(NSString *)hexadecimal;

@end
#pragma clang diagnostic pop