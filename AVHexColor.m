//
//  AVHexColor.m
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

#import "AVHexColor.h"

#pragma clang diagnostic push
#pragma ide diagnostic ignored "OCUnusedMethodInspection"
@implementation AVHexColor

#pragma mark - Category Methods
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

+ (NSString *)hexStringFromColor:(AVColor *)color
{
	NSString *string = [self hexStringFromColor: color withHash: YES];
	return string;
}

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

+ (NSString *)hexStringWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
	AVColor *color = [AVColor colorWithRed: red green: green blue: blue alpha: 1.0f];
	NSString *string = [self hexStringFromColor: color];
	return string;
}

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

	AVColor *color = [AVColor colorWithRed: red green: green blue: blue alpha: 1.0f];
	return color;
}

#pragma mark - Deprecated Methods

// deprecated: Use 'colorWithHex:' instead.
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
// deprecated

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
// deprecated

// deprecated: Use 'hexStringFromColor:' instead.
+ (NSString *)colorWithRGBToHex:(AVColor *)color
{
	// Get the color components of the color
	const CGFloat *components = CGColorGetComponents( [color CGColor] );
	// Multiply it by 255 and display the result using an uppercase hexadecimal specifier (%X) with a character length of 2
	NSString *hexadecimal = [NSString stringWithFormat: @"#%02X%02X%02X" , (int)(255 * components[0]) , (int)(255 * components[1]) , (int)(255 * components[2])];

	return hexadecimal;
}
// deprecated

#pragma mark - Convenience Methods
+ (AVColor *)oliveColor
{
	return [self colorWithHex: 0x808000];
}

+ (AVColor *)azureColor
{
	return [self colorWithHex: 0xF0FFFF];
}

+ (AVColor *)orchidColor
{
	return [self colorWithHex: 0xDA70D6];
}

+ (AVColor *)thistleColor
{
	return [self colorWithHex: 0xD8BFD8];
}

+ (AVColor *)beigeColor
{
	return [self colorWithHex: 0xF5F5DC];
}

+ (AVColor *)bananaColor
{
	return [self colorWithHex: 0xE3CF57];
}

+ (AVColor *)plumColor
{
	return [self colorWithHex: 0xDDA0DD];
}

+ (AVColor *)brickColor
{
	return [self colorWithHex: 0x9C661F];
}

+ (AVColor *)fireBrickColor
{
	return [self colorWithHex: 0xB22222];
}

+ (AVColor *)skyBlueColor
{
	return [self colorWithHex: 0x87CEEB];
}

+ (AVColor *)khakiColor
{
	return [self colorWithHex: 0xF0E68C];
}

+ (AVColor *)wheatColor
{
	return [self colorWithHex: 0xF5DEB3];
}

+ (AVColor *)burlywoodColor
{
	return [self colorWithHex: 0xDEB887];
}

+ (AVColor *)cadetBlueColor
{
	return [self colorWithHex: 0x5F9EA0];
}

+ (AVColor *)carrotColor
{
	return [self colorWithHex: 0xED9121];
}

+ (AVColor *)indigoColor
{
	return [self colorWithHex: 0x4B0082];
}

+ (AVColor *)maroonColor
{
	return [self colorWithHex: 0x800000];
}

+ (AVColor *)ceruleanColor
{
	return [self colorWithHex: 0x007BA7];
}

+ (AVColor *)moccasinColor
{
	return [self colorWithHex: 0xFFE4B5];
}

+ (AVColor *)tanColor
{
	return [self colorWithHex: 0xD2B48C];
}

+ (AVColor *)melonColor
{
	return [self colorWithHex: 0xE3A869];
}

+ (AVColor *)cobaltColor
{
	return [self colorWithHex: 0x3D59AB];
}

+ (AVColor *)crimsonColor
{
	return [self colorWithHex: 0xDC143C];
}

+ (AVColor *)mistyRoseColor
{
	return [self colorWithHex: 0xFFE4E1];
}

+ (AVColor *)pinkColor
{
	return [self colorWithHex: 0xFFC0CB];
}

+ (AVColor *)irisColor
{
	return [self colorWithHex: 0x5A4FCF];
}

+ (AVColor *)chartreuseColor
{
	return [self colorWithHex: 0x7FFF00];
}

+ (AVColor *)navyColor
{
	return [self colorWithHex: 0x000080];
}

+ (AVColor *)mintColor
{
	return [self colorWithHex: 0xBDFCC9];
}

+ (AVColor *)tealColor
{
	return [self colorWithHex: 0x008080];
}

+ (AVColor *)violetColor
{
	return [self colorWithHex: 0xEE82EE];
}

+ (AVColor *)limeColor
{
	return [self colorWithHex: 0x32CD32];
}

#pragma mark Alloy Colors
+ (AVColor *)bronzeColor
{
	return [self colorWithHex: 0xCD7F32];
}

+ (AVColor *)goldColor
{
	return [self colorWithHex: 0xFFD700];
}

+ (AVColor *)silverColor
{
	return [self colorWithHex: 0xC0C0C0];
}

#pragma mark Gem Colors
+ (AVColor *)emeraldColor
{
	return [self colorWithHex: 0x50C878];
}

+ (AVColor *)rubyColor
{
	return [self colorWithHex: 0xE0115F];
}

+ (AVColor *)sapphireColor
{
	return [self colorWithHex: 0x082567];
}

+ (AVColor *)aquamarineColor
{
	return [self colorWithHex: 0x7FFFD4];
}

+ (AVColor *)turquoiseColor
{
	return [self colorWithHex: 0x40E0D0];
}

#pragma mark Dark Colors
+ (AVColor *)darkRedColor
{
	return [self colorWithHex: 0x8B0000];
}

+ (AVColor *)darkGreenColor
{
	return [self colorWithHex: 0x006400];
}

+ (AVColor *)darkBlueColor
{
	return [self colorWithHex: 0x00008B];
}

+ (AVColor *)darkCyanColor
{
	return [self colorWithHex: 0x008B8B];
}

+ (AVColor *)darkYellowColor
{
	return [self colorWithHex: 0xB5A42E];
}

+ (AVColor *)darkMagentaColor
{
	return [self colorWithHex: 0x8B008B];
}

+ (AVColor *)darkOrangeColor
{
	return [self colorWithHex: 0xFF8C00];
}

+ (AVColor *)darkVioletColor
{
	return [self colorWithHex: 0x9400D3];
}

#pragma mark Light Colors
+ (AVColor *)lightRedColor
{
	return [self colorWithHex: 0xF26C4F];
}

+ (AVColor *)lightGreenColor
{
	return [self colorWithHex: 0x90EE90];
}

+ (AVColor *)lightBlueColor
{
	return [self colorWithHex: 0xADD8E6];
}

+ (AVColor *)lightCyanColor
{
	return [self colorWithHex: 0xE0FFFF];
}

+ (AVColor *)lightYellowColor
{
	return [self colorWithHex: 0xFFFFE0];
}

+ (AVColor *)lightMagentaColor
{
	return [self colorWithHex: 0xFF77FF];
}

+ (AVColor *)lightOrangeColor
{
	return [self colorWithHex: 0xE7B98A];
}

+ (AVColor *)lightVioletColor
{
	return [self colorWithHex: 0xB98AE7];
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

#pragma clang diagnostic pop