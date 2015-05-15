//
//  AVHexColor.m
//  ColorWithHex
//
//  Created by Angelo Villegas on 3/24/11.
//  Copyright (c) 2011 Angelo Villegas. All rights reserved.
//	http://angelovillegas.com/
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

// ObjC (manual hex conversion to RGB)
+ (AVColor *)colorWithHexa:(NSString *)hexadecimal;

@end

@implementation AVHexColor

#pragma mark - Category Methods

/**
 * Convert hexadecimal value to iOS-based RGB color.
 *
 * @note Only hexadecimal value in full format: @p 0x[aaRRGGBB].
 *
 * @param hexadecimal A hexadecimal value that consists of an alpha, Red, Green, and Blue.
 * @return The AVColor object. The color information represented by this object is in the device RGB colorspace.
 */
+ (AVColor *)colorWithFullHex:(UInt32)hexadecimal
{
    CGFloat red, green, blue, alpha = 1.0f;
    NSString *hexString = [NSString stringWithFormat: @"%X" , (unsigned int)hexadecimal];

    if ( hexString.length == 8 )
    {
        // bitwise AND operation
        // hexadecimal's first 2 values
        alpha = (CGFloat)(( hexadecimal >> 24 ) & 0xFF ) / 255.0f;
        // hexadecimal's third and fourth values
        red = (CGFloat)(( hexadecimal >> 16 ) & 0xFF ) / 255.0f;
        // hexadecimal's fifth and sixth values
        green = (CGFloat)(( hexadecimal >> 8 ) & 0xFF ) / 255.0f;
        // hexadecimal's seventh and eighth
        blue = (CGFloat)( hexadecimal & 0xFF ) / 255.0f;
    }
    else
    {
        return nil;
    }

    AVColor *color = [AVColor colorWithRed:red green:green blue:blue alpha:alpha];
    return color;
}

/**
 * Convert hexadecimal value to iOS-based RGB color.
 *
 * @note Accepts several hex length:
 *
 *      1 = 0xB
 *
 *      2 = 0xGB
 *
 *      3 = 0xRGB
 *
 *      4 = 0xaRGB
 *
 *      6 = 0xRRGGBB
 *
 *      8 = 0xaaRRGGBB
 *
 * @param hexadecimal A hexadecimal value that consists of an alpha, Red, Green, and Blue.
 * @return The AVColor object. The color information represented by this object is in the device RGB colorspace.
 */
// deprecated: Use 'colorWithFullHex:' instead.
+ (AVColor *)colorWithHex:(UInt32)hexadecimal
{
	CGFloat red, green, blue, alpha = 1.0f;
	NSString *hexString = [NSString stringWithFormat: @"%03X" , (unsigned int)hexadecimal];

	if ( hexString.length == 3 )
	{
		// bitwise AND operation
		// hexadecimal's first 2 values
		red = (CGFloat)(( hexadecimal >> 8 ) & 0xF ) / 15.0f;
		// hexadecimal's third and fourth values
		green = (CGFloat)(( hexadecimal >> 4 ) & 0xF ) / 15.0f;
		// hexadecimal's fifth and sixth values
		blue = (CGFloat)( hexadecimal & 0xF ) / 15.0f;
	}
	else if ( hexString.length == 4 )
	{
		// bitwise AND operation
		// hexadecimal's first 2 values
		alpha = (CGFloat)(( hexadecimal >> 12 ) & 0xF ) / 15.0f;
		// hexadecimal's third and fourth values
		red = (CGFloat)(( hexadecimal >> 8 ) & 0xF ) / 15.0f;
		// hexadecimal's fifth and sixth values
		green = (CGFloat)(( hexadecimal >> 4 ) & 0xF ) / 15.0f;
		// hexadecimal's seventh and eighth
		blue = (CGFloat)( hexadecimal & 0xF ) / 15.0f;
	}
	else if ( hexString.length == 6 )
	{
		// bitwise AND operation
		// hexadecimal's first 2 values
		red = (CGFloat)(( hexadecimal >> 16 ) & 0xFF ) / 255.0f;
		// hexadecimal's third and fourth values
		green = (CGFloat)(( hexadecimal >> 8 ) & 0xFF ) / 255.0f;
		// hexadecimal's fifth and sixth values
		blue = (CGFloat)( hexadecimal & 0xFF ) / 255.0f;
	}
	else if ( hexString.length == 8 )
	{
		// bitwise AND operation
		// hexadecimal's first 2 values
		alpha = (CGFloat)(( hexadecimal >> 24 ) & 0xFF ) / 255.0f;
		// hexadecimal's third and fourth values
		red = (CGFloat)(( hexadecimal >> 16 ) & 0xFF ) / 255.0f;
		// hexadecimal's fifth and sixth values
		green = (CGFloat)(( hexadecimal >> 8 ) & 0xFF ) / 255.0f;
		// hexadecimal's seventh and eighth
		blue = (CGFloat)( hexadecimal & 0xFF ) / 255.0f;
	}
	else
	{
		return nil;
	}

	AVColor *color = [AVColor colorWithRed:red green:green blue:blue alpha:alpha];
	return color;
}

/**
 * Convert string hex value to RGB.
 *
 * @note Accepts several hex length:
 *
 *      3 = #RGB
 *
 *      4 = #aRGB
 *
 *      6 = #RRGGBB
 *
 *      8 = #aaRRGGBB
 *
 * @param hexadecimal A hexadecimal value that consists of an alpha, Red, Green, and Blue.
 * @return The AVColor object. The color information represented by this object is in the device RGB colorspace.
 */
+ (AVColor *)colorWithHexString:(NSString *)hexadecimal
{
	
	// convert Objective-C NSString to C string
	const char *cString = [hexadecimal cStringUsingEncoding: NSASCIIStringEncoding];
	
	// Strip optional #
	if (cString[0] == '#') cString++;
	
	// Validate is hex string
	for (const char *charPtr = cString; *charPtr != 0; charPtr++)
	{
		char ch = *charPtr;
		BOOL isHexDigit = (ch >= '0' && ch <= '9') || (ch >= 'a' && ch <= 'f') || (ch >= 'A' && ch <= 'F');
		if ( !isHexDigit ) return nil;
        if ( charPtr - cString > 8 ) return nil; // aaRRGGBB is largest string we accept.
	}
	
	// Make canonical hex string
	char canonicalARGB[8 + 1];  // null terminated
	canonicalARGB[8] = 0;
	switch (strlen(cString))
	{
		case 3:
			canonicalARGB[0] = canonicalARGB[1] = 'F'; // Alpha
			for (int i = 0; i < 6; i++)
			{
				canonicalARGB[i + 2] = cString[i / 2];
			}
			break;
		case 4:
			for (int i = 0; i < 8; i++)
			{
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
	
	long long int hex = strtoll(canonicalARGB, NULL , 16 );
	
	CGFloat alpha = (CGFloat)((hex & 0xFF000000) >> 24) / 255.f;
	CGFloat red = (CGFloat)((hex & 0x00FF0000) >> 16) / 255.f;
	CGFloat green = (CGFloat)((hex & 0x0000FF00) >> 8) / 255.f;
	CGFloat blue = (CGFloat)((hex & 0x000000FF) >> 0) / 255.f;
	
	AVColor *color = [AVColor colorWithRed:red green:green blue:blue alpha:alpha];
	return color;
}

/**
 * Convert AVColor object to NSString hexadecimal color value.
 *
 * @param color The AVColor object.
 * @return A string hexadecimal value with hash tag (#).
 */
+ (NSString *)hexStringFromColor:(AVColor *)color
{
	NSString *string = [self hexStringFromColor: color withHash: YES];
	return string;
}

/**
 * Convert AVColor object to NSString hexadecimal color value.
 *
 * @note Returns a string hexadecimal value with hash tag (#) as default.
 *
 * @param color The AVColor object
 * @param withHash A boolean value that returns a string value with hash tag (#) if YES.
 * @return A string hexadecimal value with an optional hash tag (#) character.
 */
+ (NSString *)hexStringFromColor:(AVColor *)color withHash:(BOOL)withHash
{
	// get the color components of the color
	const NSUInteger totalComponents = CGColorGetNumberOfComponents( [color CGColor] );
	const CGFloat *components = CGColorGetComponents( [color CGColor] );
	NSString *hexadecimal = nil;
	NSString *hash = withHash? @"#" : @"";

	// some cases, totalComponents will only have 2 components
	// such as black, white, gray, etc..
	// multiply it by 255 and display the result using an uppercase
	// hexadecimal specifier (%X) with a character length of 2
	switch ( totalComponents )
	{
		case 4 :
			hexadecimal = [NSString stringWithFormat: @"%@%02X%02X%02X" , hash , (int)(255 * components[0]) , (int)(255 * components[1]) , (int)(255 * components[2])];
			break;

		case 2 :
			hexadecimal = [NSString stringWithFormat: @"%@%02X%02X%02X" , hash , (int)(255 * components[0]) , (int)(255 * components[0]) , (int)(255 * components[0])];
			break;

		default:
			break;
	}

	return hexadecimal;
}

/**
 * Convert RGB value to NSString hexadecimal colour value.
 *
 * @note Returns a string hexadecimal value with hash tag (#) as default.
 *
 * @param red The red component of the color object, specified as a value from 0.0 to 1.0.
 * @param green The green component of the color object, specified as a value from 0.0 to 1.0.
 * @param blue The blue component of the color object, specified as a value from 0.0 to 1.0.
 * @return A string hexadecimal value with an optional hash tag (#) character.
 */
+ (NSString *)hexStringWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
	AVColor *color = [AVColor colorWithRed: red green: green blue: blue alpha: 1.0f];
	NSString *string = [self hexStringFromColor: color];
	return string;
}

/**
 * Generate a random color.
 *
 * @return The AVColor object. The color information represented by this object is in the device RGB colorspace.
 */
+ (AVColor *)randomColor
{
	static BOOL generated = NO;

	// if the randomColor hasn't been generated yet,
	// reset the time to generate another sequence
	if ( !generated )
	{
		generated = YES;
		srandom( (unsigned int)time( NULL ) );
	}

	// generate a random number and divide it using the
	// maximum possible number random() can be generated
	CGFloat red = (CGFloat)random() / (CGFloat)RAND_MAX;
	CGFloat green = (CGFloat)random() / (CGFloat)RAND_MAX;
	CGFloat blue = (CGFloat)random() / (CGFloat)RAND_MAX;

	AVColor *color = [AVColor colorWithRed:red green:green blue:blue alpha:1.0f];
	return color;
}

#pragma mark - Deprecated Methods

/**
 * Convert hexadecimal value to RGB.
 *
 * @note Only hexadecimal value in full format: @p 0x[aaRRGGBB].
 */
// deprecated: Use 'colorWithFullHex:' instead.
+ (AVColor *)colorWithAlphaHex:(UInt32)hexadecimal
{
	CGFloat red, green, blue, alpha;

	// bitwise AND operation
	// hexadecimal's first 2 values
	alpha = (CGFloat)(( hexadecimal & 0xFF000000 ) >> 24 );
	// hexadecimal's first 2 values
	red = (CGFloat)(( hexadecimal & 0x00FF0000 ) >> 16 );
	// hexadecimal's 2 middle values
	green = (CGFloat)(( hexadecimal & 0x0000FF00 ) >> 8 );
	// hexadecimal's last 2 values
	blue = (CGFloat)( hexadecimal & 0x000000FF );

	AVColor *color = [AVColor colorWithRed: red / 255.0f green: green / 255.0f blue: blue / 255.0f alpha: alpha / 255.0f];
    return color;
}

/**
 * Convert string hex value to RGB.
 *
 * @param hexadecimal A hexadecimal value that consists of a Red, Green, and Blue.
 * @return The AVColor object. The color information represented by this object is in the device RGB colorspace.
 */
// deprecated: Use 'colorWithHexString:' instead.
+ (AVColor *)colorWithAlphaHexString:(NSString *)hexadecimal
{
	const char *cString = [hexadecimal cStringUsingEncoding: NSASCIIStringEncoding];
	long long int hex;

	if ( cString[0] == '#' )
	{
		hex = strtoll( cString + 1 , NULL , 16 );
	}
	else
	{
		hex = strtoll( cString , NULL , 16 );
	}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
	AVColor *color = [self colorWithAlphaHex: (unsigned int)hex];
#pragma clang diagnostic pop
	return color;
}

/**
 * Convert AVColor object to NSString hexadecimal color value.
 *
 * @param color The AVColor object.
 * @return A string hexadecimal value with hash tag (#) as default.
 */
// deprecated: Use 'hexStringFromColor:' instead.
+ (NSString *)colorWithRGBToHex:(AVColor *)color
{
	// Get the color components of the color
	const CGFloat *components = CGColorGetComponents( [color CGColor] );
	// Multiply it by 255 and display the result using an uppercase hexadecimal specifier (%X) with a character length of 2
	NSString *hexadecimal = [NSString stringWithFormat: @"#%02X%02X%02X" , (int)(255 * components[0]) , (int)(255 * components[1]) , (int)(255 * components[2])];

	return hexadecimal;
}

#pragma mark - Convenience Methods
/**
 * Returns a color object whose hexadecimal value is @p 0xFF808000.
 *
 * @return The AVColor object.
 */
+ (AVColor *)oliveColor
{
	return [self colorWithFullHex: 0xFF808000];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFF0FFFF.
 *
 * @return The AVColor object.
 */
+ (AVColor *)azureColor
{
	return [self colorWithFullHex: 0xFFF0FFFF];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFDA70D6.
 *
 * @return The AVColor object.
 */
+ (AVColor *)orchidColor
{
	return [self colorWithFullHex: 0xFFDA70D6];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFD8BFD8.
 *
 * @return The AVColor object.
 */
+ (AVColor *)thistleColor
{
	return [self colorWithFullHex: 0xFFD8BFD8];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFF5F5DC.
 *
 * @return The AVColor object.
 */
+ (AVColor *)beigeColor
{
	return [self colorWithFullHex: 0xFFF5F5DC];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFE3CF57.
 *
 * @return The AVColor object.
 */
+ (AVColor *)bananaColor
{
	return [self colorWithFullHex: 0xFFE3CF57];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFDDA0DD.
 *
 * @return The AVColor object.
 */
+ (AVColor *)plumColor
{
	return [self colorWithFullHex: 0xFFDDA0DD];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFF9C661F.
 *
 * @return The AVColor object.
 */
+ (AVColor *)brickColor
{
	return [self colorWithFullHex: 0xFF9C661F];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFB22222.
 *
 * @return The AVColor object.
 */
+ (AVColor *)fireBrickColor
{
	return [self colorWithFullHex: 0xFFB22222];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFF87CEEB.
 *
 * @return The AVColor object.
 */
+ (AVColor *)skyBlueColor
{
	return [self colorWithFullHex: 0xFF87CEEB];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFF0E68C.
 *
 * @return The AVColor object.
 */
+ (AVColor *)khakiColor
{
	return [self colorWithFullHex: 0xFFF0E68C];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFF5DEB3.
 *
 * @return The AVColor object.
 */
+ (AVColor *)wheatColor
{
	return [self colorWithFullHex: 0xFFF5DEB3];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFDEB887.
 *
 * @return The AVColor object.
 */
+ (AVColor *)burlywoodColor
{
	return [self colorWithFullHex: 0xFFDEB887];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFF5F9EA0.
 *
 * @return The AVColor object.
 */
+ (AVColor *)cadetBlueColor
{
	return [self colorWithFullHex: 0xFF5F9EA0];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFED9121.
 *
 * @return The AVColor object.
 */
+ (AVColor *)carrotColor
{
	return [self colorWithFullHex: 0xFFED9121];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFF4B0082.
 *
 * @return The AVColor object.
 */
+ (AVColor *)indigoColor
{
	return [self colorWithFullHex: 0xFF4B0082];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFF800000.
 *
 * @return The AVColor object.
 */
+ (AVColor *)maroonColor
{
	return [self colorWithFullHex: 0xFF800000];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFF007BA7.
 *
 * @return The AVColor object.
 */
+ (AVColor *)ceruleanColor
{
	return [self colorWithFullHex: 0xFF007BA7];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFFFE4B5.
 *
 * @return The AVColor object.
 */
+ (AVColor *)moccasinColor
{
	return [self colorWithFullHex: 0xFFFFE4B5];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFD2B48C.
 *
 * @return The AVColor object.
 */
+ (AVColor *)tanColor
{
	return [self colorWithFullHex: 0xFFD2B48C];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFE3A869.
 *
 * @return The AVColor object.
 */
+ (AVColor *)melonColor
{
	return [self colorWithFullHex: 0xFFE3A869];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFF3D59AB.
 *
 * @return The AVColor object.
 */
+ (AVColor *)cobaltColor
{
	return [self colorWithFullHex: 0xFF3D59AB];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFDC143C.
 *
 * @return The AVColor object.
 */
+ (AVColor *)crimsonColor
{
	return [self colorWithFullHex: 0xFFDC143C];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFFFE4E1.
 *
 * @return The AVColor object.
 */
+ (AVColor *)mistyRoseColor
{
	return [self colorWithFullHex: 0xFFFFE4E1];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFFFC0CB.
 *
 * @return The AVColor object.
 */
+ (AVColor *)pinkColor
{
	return [self colorWithFullHex: 0xFFFFC0CB];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFF5A4FCF.
 *
 * @return The AVColor object.
 */
+ (AVColor *)irisColor
{
	return [self colorWithFullHex: 0xFF5A4FCF];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFF7FFF00.
 *
 * @return The AVColor object.
 */
+ (AVColor *)chartreuseColor
{
	return [self colorWithFullHex: 0xFF7FFF00];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFF000080.
 *
 * @return The AVColor object.
 */
+ (AVColor *)navyColor
{
	return [self colorWithFullHex: 0xFF000080];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFBDFCC9.
 *
 * @return The AVColor object.
 */
+ (AVColor *)mintColor
{
	return [self colorWithFullHex: 0xFFBDFCC9];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFF008080.
 *
 * @return The AVColor object.
 */
+ (AVColor *)tealColor
{
	return [self colorWithFullHex: 0xFF008080];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFEE82EE.
 *
 * @return The AVColor object.
 */
+ (AVColor *)violetColor
{
	return [self colorWithFullHex: 0xFFEE82EE];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFF32CD32.
 *
 * @return The AVColor object.
 */
+ (AVColor *)limeColor
{
	return [self colorWithFullHex: 0xFF32CD32];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFDAA520.
 *
 * @return The AVColor object.
 */
+ (AVColor *)goldenRodColor
{
	return [self colorWithFullHex: 0xFFDAA520];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFFDF5E6.
 *
 * @return The AVColor object.
 */
+ (AVColor *)oldLaceColor
{
	return [self colorWithFullHex: 0xFFFDF5E6];
}

#pragma mark Alloy Colors
/**
 * Returns a color object whose hexadecimal value is @p 0xFFCD7F32.
 *
 * @return The AVColor object.
 */
+ (AVColor *)bronzeColor
{
	return [self colorWithFullHex: 0xFFCD7F32];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFFFD700.
 *
 * @return The AVColor object.
 */
+ (AVColor *)goldColor
{
	return [self colorWithFullHex: 0xFFFFD700];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFC0C0C0.
 *
 * @return The AVColor object.
 */
+ (AVColor *)silverColor
{
	return [self colorWithFullHex: 0xFFC0C0C0];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFF4682B4.
 *
 * @return The AVColor object.
 */
+ (AVColor *)steelBlueColor
{
	return [self colorWithFullHex: 0xFF4682B4];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFFF9912.
 *
 * @return The AVColor object.
 */
+ (AVColor *)cadmiumYellowColor
{
	return [self colorWithFullHex: 0xFFFF9912];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFFF6103.
 *
 * @return The AVColor object.
 */
+ (AVColor *)cadmiumOrangeColor
{
	return [self colorWithFullHex: 0xFFFF6103];
}

#pragma mark Gem Colors
/**
 * Returns a color object whose hexadecimal value is @p 0xFF50C878.
 *
 * @return The AVColor object.
 */
+ (AVColor *)emeraldColor
{
	return [self colorWithFullHex: 0xFF50C878];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFE0115F.
 *
 * @return The AVColor object.
 */
+ (AVColor *)rubyColor
{
	return [self colorWithFullHex: 0xFFE0115F];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFF082567.
 *
 * @return The AVColor object.
 */
+ (AVColor *)sapphireColor
{
	return [self colorWithFullHex: 0xFF082567];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFF7FFFD4.
 *
 * @return The AVColor object.
 */
+ (AVColor *)aquamarineColor
{
	return [self colorWithFullHex: 0xFF7FFFD4];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFF40E0D0.
 *
 * @return The AVColor object.
 */
+ (AVColor *)turquoiseColor
{
	return [self colorWithFullHex: 0xFF40E0D0];
}

#pragma mark Dark Colors
/**
 * Returns a color object whose hexadecimal value is @p 0xFF8B0000.
 *
 * @return The AVColor object.
 */
+ (AVColor *)darkRedColor
{
	return [self colorWithFullHex: 0xFF8B0000];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFF006400.
 *
 * @return The AVColor object.
 */
+ (AVColor *)darkGreenColor
{
	return [self colorWithFullHex: 0xFF006400];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFF00008B.
 *
 * @return The AVColor object.
 */
+ (AVColor *)darkBlueColor
{
	return [self colorWithFullHex: 0xFF00008B];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFF008B8B.
 *
 * @return The AVColor object.
 */
+ (AVColor *)darkCyanColor
{
	return [self colorWithFullHex: 0xFF008B8B];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFB5A42E.
 *
 * @return The AVColor object.
 */
+ (AVColor *)darkYellowColor
{
	return [self colorWithFullHex: 0xFFB5A42E];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFF8B008B.
 *
 * @return The AVColor object.
 */
+ (AVColor *)darkMagentaColor
{
	return [self colorWithFullHex: 0xFF8B008B];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFFF8C00.
 *
 * @return The AVColor object.
 */
+ (AVColor *)darkOrangeColor
{
	return [self colorWithFullHex: 0xFFFF8C00];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFF9400D3.
 *
 * @return The AVColor object.
 */
+ (AVColor *)darkVioletColor
{
	return [self colorWithFullHex: 0xFF9400D3];
}

#pragma mark Light Colors
/**
 * Returns a color object whose hexadecimal value is @p 0xFFF26C4F.
 *
 * @return The AVColor object.
 */
+ (AVColor *)lightRedColor
{
	return [self colorWithFullHex: 0xFFF26C4F];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFF90EE90.
 *
 * @return The AVColor object.
 */
+ (AVColor *)lightGreenColor
{
	return [self colorWithFullHex: 0xFF90EE90];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFADD8E6.
 *
 * @return The AVColor object.
 */
+ (AVColor *)lightBlueColor
{
	return [self colorWithFullHex: 0xFFADD8E6];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFE0FFFF.
 *
 * @return The AVColor object.
 */
+ (AVColor *)lightCyanColor
{
	return [self colorWithFullHex: 0xFFE0FFFF];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFFFFFE0.
 *
 * @return The AVColor object.
 */
+ (AVColor *)lightYellowColor
{
	return [self colorWithFullHex: 0xFFFFFFE0];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFFF77FF.
 *
 * @return The AVColor object.
 */
+ (AVColor *)lightMagentaColor
{
	return [self colorWithFullHex: 0xFFFF77FF];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFE7B98A.
 *
 * @return The AVColor object.
 */
+ (AVColor *)lightOrangeColor
{
	return [self colorWithFullHex: 0xFFE7B98A];
}

/**
 * Returns a color object whose hexadecimal value is @p 0xFFB98AE7.
 *
 * @return The AVColor object.
 */
+ (AVColor *)lightVioletColor
{
	return [self colorWithFullHex: 0xFFB98AE7];
}

#pragma mark -
// you can delete this method. It only shows how to calculate and convert RGB color to Hexadecimal manually
// converting using Hex to RGB formula (Manual)
+ (AVColor *)colorWithHexa:(NSString *)hexadecimal
{
	// make sure that the hexadecimal value is in uppercase letters
	hexadecimal = [hexadecimal uppercaseString];
	NSUInteger a;
	
	/*
	 If hexadecimal has a hash tag (#), remove it.
	 This purpose is solely for copy-pasting the whole hexadecimal
	 value that mostly consist of a hash-tag + the 6 characters
	 (e.i. #000000). Making sure that our little piece of software
	 will still accept the format with or without the hash tag.
	 */
	if ( [[hexadecimal substringWithRange: NSMakeRange( 0 , 1 )] isEqualToString: @"#"] )
	{
		a = 1;
	}
	else
	{
		a = 0;
	}
	
	/*
	 In hexadecimal, all numbers beyond 9 will be converted to single
	 character (Base16 digits should be converted beyond the digit 9)
	 Conversion:
	 10 = A	11 = B	12 = C	13 = D	14 = E	15 = F
	 */
	NSDictionary *hexConstants = @{ @"A" : @"10" , @"B" : @"11" , @"C" : @"12" , @"D" : @"13" , @"E" : @"14" , @"F" : @"15" };
	NSMutableArray *hexArray = [[NSMutableArray alloc] init];
	NSMutableArray *hexConverted = [[NSMutableArray alloc] init];
	
	// Separate all the characters
	for ( NSUInteger x = a ; x < [hexadecimal length] ; x++ )
	{
		[hexArray insertObject: [hexadecimal substringWithRange: NSMakeRange( x , 1)] atIndex: x - 1];
	}
	
	// Convert the characters to their respective Base16 format
	for ( NSString *hexa in hexArray )
	{
		if ( [hexConstants valueForKey: hexa] )
		{
			[hexConverted addObject: [hexConstants valueForKey: hexa]];
		}
		else
		{
			[hexConverted addObject: hexa];
		}
	}
	
	CGFloat red = 0.0;
	CGFloat green = 0.0;
	CGFloat blue = 0.0;
	
	/*
	 Calculation of Hex to RGB :	# x y x' y' x" y"
	 x  * 16 = (x ) + y  = R
	 x' * 16 = (x') + y' = G
	 x" * 16 = (x") + y" = B
	 */
	for ( NSUInteger x = 0 ; x < [hexConverted count] ; x++ )
	{
		switch ( x )
		{
			case 0 :
			{
				const int value = [hexConverted[x] intValue];
				red = value * 16 + [hexConverted[x + 1] integerValue];
				break;
			}
			case 2 :
			{
				const int value = [hexConverted[x] intValue];
				green = value * 16 + [hexConverted[x + 1] integerValue];
				break;
			}
			case 4 :
			{
				const int value = [hexConverted[x] intValue];
				blue = value * 16 + [hexConverted[x + 1] integerValue];
				break;
			}
			default:
				break;
		}
	}
	
	AVColor *color = [AVColor colorWithRed: red / 255.0f green: green / 255.0f blue: blue / 255.0f alpha: 1.0f];
	return color;
}

@end