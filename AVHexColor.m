//
//  AVHexColor.m
//  ColorWithHex
//
//  Created by Angelo Villegas on 3/24/11.
//  Copyright (c) 2011 Angelo Villegas. All rights reserved.
//	https://angelovillegas.com/
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

#import "AVHexColor.h"

@interface AVHexColor ()

@end

@implementation AVHexColor

#pragma mark - Category Methods

+ (AVColor *)colorWithFullHex:(UInt32)hexadecimal {
	CGFloat red, green, blue, alpha = 1.0f;
	NSString *hexString = [NSString stringWithFormat:@"%X", (unsigned int) hexadecimal];

	if (hexString.length == 8) {
		// bitwise AND operation
		// hexadecimal's first 2 values
		alpha = (CGFloat) ((hexadecimal >> 24) & 0xFF) / 255.0f;
		// hexadecimal's third and fourth values
		red = (CGFloat) ((hexadecimal >> 16) & 0xFF) / 255.0f;
		// hexadecimal's fifth and sixth values
		green = (CGFloat) ((hexadecimal >> 8) & 0xFF) / 255.0f;
		// hexadecimal's seventh and eighth
		blue = (CGFloat) (hexadecimal & 0xFF) / 255.0f;
	} else {
		return nil;
	}

	AVColor *color = [AVColor colorWithRed:red green:green blue:blue alpha:alpha];
	return color;
}

+ (AVColor *)colorWithHexString:(NSString *)hexadecimal {

	// convert Objective-C NSString to C string
	const char *cString = [hexadecimal cStringUsingEncoding:NSASCIIStringEncoding];

	// Strip optional #
	if (cString[0] == '#') cString++;

	// Validate is hex string
	for (const char *charPtr = cString; *charPtr != 0; charPtr++) {
		char ch = *charPtr;
		BOOL isHexDigit = (ch >= '0' && ch <= '9') || (ch >= 'a' && ch <= 'f') || (ch >= 'A' && ch <= 'F');
		if (!isHexDigit) return nil;
		if (charPtr - cString > 8) return nil; // aaRRGGBB is largest string we accept.
	}

	// Make canonical hex string
	char canonicalARGB[8 + 1];  // null terminated
	canonicalARGB[8] = 0;
	switch (strlen(cString)) {
		case 3:
			canonicalARGB[0] = canonicalARGB[1] = 'F'; // Alpha
			for (int i = 0; i < 6; i++) {
				canonicalARGB[i + 2] = cString[i / 2];
			}
			break;
		case 4:
			for (int i = 0; i < 8; i++) {
				canonicalARGB[i] = cString[i / 2];
			}
			break;
		case 6:
			canonicalARGB[0] = canonicalARGB[1] = 'F'; // Alpha
			strcpy(canonicalARGB + 2, cString);
			break;
		case 8:
			strcpy(canonicalARGB, cString);
			break;
		default:
			return nil;
	}

	long long int hex = strtoll(canonicalARGB, NULL, 16);

	CGFloat alpha = (CGFloat) ((hex & 0xFF000000) >> 24) / 255.f;
	CGFloat red = (CGFloat) ((hex & 0x00FF0000) >> 16) / 255.f;
	CGFloat green = (CGFloat) ((hex & 0x0000FF00) >> 8) / 255.f;
	CGFloat blue = (CGFloat) ((hex & 0x000000FF) >> 0) / 255.f;

	AVColor *color = [AVColor colorWithRed:red green:green blue:blue alpha:alpha];
	return color;
}

+ (NSString *)hexStringFromColor:(AVColor *)color {
	NSString *string = [self hexStringFromColor:color withHash:YES];
	return string;
}

+ (NSString *)hexStringFromColor:(AVColor *)color withHash:(BOOL)withHash {
	// get the color components of the color
	const NSUInteger totalComponents = CGColorGetNumberOfComponents([color CGColor]);
	const CGFloat *components = CGColorGetComponents([color CGColor]);
	NSString *hexadecimal = nil;
	NSString *hash = withHash ? @"#" : @"";

	// some cases, totalComponents will only have 2 components
	// such as black, white, gray, etc..
	// multiply it by 255 and display the result using an uppercase
	// hexadecimal specifier (%X) with a character length of 2
	switch (totalComponents) {
		case 4 :
			hexadecimal = [NSString stringWithFormat:@"%@%02X%02X%02X", hash, (int) (255 * components[0]), (int) (255 * components[1]), (int) (255 * components[2])];
			break;

		case 2 :
			hexadecimal = [NSString stringWithFormat:@"%@%02X%02X%02X", hash, (int) (255 * components[0]), (int) (255 * components[0]), (int) (255 * components[0])];
			break;

		default:
			break;
	}

	return hexadecimal;
}

+ (NSString *)hexStringWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
	AVColor *color = [AVColor colorWithRed:red green:green blue:blue alpha:1.0f];
	NSString *string = [self hexStringFromColor:color];
	return string;
}

+ (AVColor *)randomColor {
	static BOOL generated = NO;

	// if the randomColor hasn't been generated yet,
	// reset the time to generate another sequence
	if (!generated) {
		generated = YES;
		srandom((unsigned int) time(NULL));
	}

	// generate a random number and divide it using the
	// maximum possible number random() can be generated
	CGFloat red = (CGFloat) random() / (CGFloat) RAND_MAX;
	CGFloat green = (CGFloat) random() / (CGFloat) RAND_MAX;
	CGFloat blue = (CGFloat) random() / (CGFloat) RAND_MAX;

	AVColor *color = [AVColor colorWithRed:red green:green blue:blue alpha:1.0f];
	return color;
}

#pragma mark - Convenience Methods

+ (AVColor *)oliveColor {
	return [self colorWithFullHex:0xFF808000];
}

+ (AVColor *)azureColor {
	return [self colorWithFullHex:0xFFF0FFFF];
}

+ (AVColor *)orchidColor {
	return [self colorWithFullHex:0xFFDA70D6];
}

+ (AVColor *)thistleColor {
	return [self colorWithFullHex:0xFFD8BFD8];
}

+ (AVColor *)beigeColor {
	return [self colorWithFullHex:0xFFF5F5DC];
}

+ (AVColor *)bananaColor {
	return [self colorWithFullHex:0xFFE3CF57];
}

+ (AVColor *)plumColor {
	return [self colorWithFullHex:0xFFDDA0DD];
}

+ (AVColor *)brickColor {
	return [self colorWithFullHex:0xFF9C661F];
}

+ (AVColor *)fireBrickColor {
	return [self colorWithFullHex:0xFFB22222];
}

+ (AVColor *)skyBlueColor {
	return [self colorWithFullHex:0xFF87CEEB];
}

+ (AVColor *)khakiColor {
	return [self colorWithFullHex:0xFFF0E68C];
}

+ (AVColor *)wheatColor {
	return [self colorWithFullHex:0xFFF5DEB3];
}

+ (AVColor *)burlywoodColor {
	return [self colorWithFullHex:0xFFDEB887];
}

+ (AVColor *)cadetBlueColor {
	return [self colorWithFullHex:0xFF5F9EA0];
}

+ (AVColor *)carrotColor {
	return [self colorWithFullHex:0xFFED9121];
}

+ (AVColor *)indigoColor {
	return [self colorWithFullHex:0xFF4B0082];
}

+ (AVColor *)maroonColor {
	return [self colorWithFullHex:0xFF800000];
}

+ (AVColor *)ceruleanColor {
	return [self colorWithFullHex:0xFF007BA7];
}

+ (AVColor *)moccasinColor {
	return [self colorWithFullHex:0xFFFFE4B5];
}

+ (AVColor *)tanColor {
	return [self colorWithFullHex:0xFFD2B48C];
}

+ (AVColor *)melonColor {
	return [self colorWithFullHex:0xFFE3A869];
}

+ (AVColor *)cobaltColor {
	return [self colorWithFullHex:0xFF3D59AB];
}

+ (AVColor *)crimsonColor {
	return [self colorWithFullHex:0xFFDC143C];
}

+ (AVColor *)mistyRoseColor {
	return [self colorWithFullHex:0xFFFFE4E1];
}

+ (AVColor *)pinkColor {
	return [self colorWithFullHex:0xFFFFC0CB];
}

+ (AVColor *)irisColor {
	return [self colorWithFullHex:0xFF5A4FCF];
}

+ (AVColor *)chartreuseColor {
	return [self colorWithFullHex:0xFF7FFF00];
}

+ (AVColor *)navyColor {
	return [self colorWithFullHex:0xFF000080];
}

+ (AVColor *)mintColor {
	return [self colorWithFullHex:0xFFBDFCC9];
}

+ (AVColor *)tealColor {
	return [self colorWithFullHex:0xFF008080];
}

+ (AVColor *)violetColor {
	return [self colorWithFullHex:0xFFEE82EE];
}

+ (AVColor *)limeColor {
	return [self colorWithFullHex:0xFF32CD32];
}

+ (AVColor *)goldenRodColor { // deprecated
	// REMINDER remove in next major release
	return [self goldenrodColor];
}

+ (AVColor *)goldenrodColor {
	return [self colorWithFullHex:0xFFDAA520];
}

+ (AVColor *)oldLaceColor {
	return [self colorWithFullHex:0xFFFDF5E6];
}

+ (AVColor *)aliceBlueColor {
	return [self colorWithFullHex:0xFFF0F8FF];
}

+ (AVColor *)antiqueWhiteColor {
	return [self colorWithFullHex:0xFFFAEBD7];
}

+ (AVColor *)blanchedAlmondColor {
	return [self colorWithFullHex:0xFFFFEBCD];
}

+ (AVColor *)cornflowerBlueColor {
	return [self colorWithFullHex:0xFF6495ED];
}

+ (AVColor *)floralWhiteColor {
	return [self colorWithFullHex:0xFFFFFAF0];
}

+ (AVColor *)forestGreenColor {
	return [self colorWithFullHex:0xFF228B22];
}

+ (AVColor *)gainsboroColor {
	return [self colorWithFullHex:0xFFDCDCDC];
}

+ (AVColor *)greenYellowColor {
	return [self colorWithFullHex:0xFFCD7F32];
}

+ (AVColor *)honeydewColor {
	return [self colorWithFullHex:0xFFF0FFF0];
}

+ (AVColor *)hotPinkColor {
	return [self colorWithFullHex:0xFFFF69B4];
}

+ (AVColor *)indianRedColor {
	return [self colorWithFullHex:0xFFCD5C5C];
}

+ (AVColor *)ivoryColor {
	return [self colorWithFullHex:0xFFFFFFF0];
}

+ (AVColor *)lavenderColor {
	return [self colorWithFullHex:0xFFE6E6FA];
}

+ (AVColor *)coralColor {
	return [self colorWithFullHex:0xFFFF7F50];
}


#pragma mark Alloy Colors

+ (AVColor *)bronzeColor {
	return [self colorWithFullHex:0xFFCD7F32];
}

+ (AVColor *)goldColor {
	return [self colorWithFullHex:0xFFFFD700];
}

+ (AVColor *)silverColor {
	return [self colorWithFullHex:0xFFC0C0C0];
}

+ (AVColor *)steelBlueColor {
	return [self colorWithFullHex:0xFF4682B4];
}

+ (AVColor *)cadmiumYellowColor {
	return [self colorWithFullHex:0xFFFF9912];
}

+ (AVColor *)cadmiumOrangeColor {
	return [self colorWithFullHex:0xFFFF6103];
}

#pragma mark Gem Colors

+ (AVColor *)emeraldColor {
	return [self colorWithFullHex:0xFF50C878];
}

+ (AVColor *)rubyColor {
	return [self colorWithFullHex:0xFFE0115F];
}

+ (AVColor *)sapphireColor {
	return [self colorWithFullHex:0xFF082567];
}

+ (AVColor *)aquamarineColor {
	return [self colorWithFullHex:0xFF7FFFD4];
}

+ (AVColor *)turquoiseColor {
	return [self colorWithFullHex:0xFF40E0D0];
}

#pragma mark Dark Colors

+ (AVColor *)darkRedColor {
	return [self colorWithFullHex:0xFF8B0000];
}

+ (AVColor *)darkGreenColor {
	return [self colorWithFullHex:0xFF006400];
}

+ (AVColor *)darkBlueColor {
	return [self colorWithFullHex:0xFF00008B];
}

+ (AVColor *)darkCyanColor {
	return [self colorWithFullHex:0xFF008B8B];
}

+ (AVColor *)darkYellowColor {
	return [self colorWithFullHex:0xFFB5A42E];
}

+ (AVColor *)darkMagentaColor {
	return [self colorWithFullHex:0xFF8B008B];
}

+ (AVColor *)darkOrangeColor {
	return [self colorWithFullHex:0xFFFF8C00];
}

+ (AVColor *)darkVioletColor {
	return [self colorWithFullHex:0xFF9400D3];
}

#pragma mark Light Colors

+ (AVColor *)lightRedColor {
	return [self colorWithFullHex:0xFFF26C4F];
}

+ (AVColor *)lightGreenColor {
	return [self colorWithFullHex:0xFF90EE90];
}

+ (AVColor *)lightBlueColor {
	return [self colorWithFullHex:0xFFADD8E6];
}

+ (AVColor *)lightCyanColor {
	return [self colorWithFullHex:0xFFE0FFFF];
}

+ (AVColor *)lightYellowColor {
	return [self colorWithFullHex:0xFFFFFFE0];
}

+ (AVColor *)lightMagentaColor {
	return [self colorWithFullHex:0xFFFF77FF];
}

+ (AVColor *)lightOrangeColor {
	return [self colorWithFullHex:0xFFE7B98A];
}

+ (AVColor *)lightVioletColor {
	return [self colorWithFullHex:0xFFB98AE7];
}

+ (AVColor *)lightCoralColor {
	return [self colorWithFullHex:0xFFF08080];
}


@end
