//
//  ColorWithHexTests.m
//  ColorWithHexTests
//
//  Created by Angelo Villegas on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ColorWithHexTests.h"
#import "AVHexColor.h"


@implementation ColorWithHexTests

#pragma mark - Black hex test
- (void)testBlackRGBThreeHexadecimal
{
	UIColor *color = [AVHexColor colorWithHex:0x000];
	STAssertNotNil(color, @"Color should not be nil");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)0, @"Red componenet should be at lowest intensity");
	STAssertEquals(green, (CGFloat)0, @"Green componenet should be at lowest intensity");
	STAssertEquals(blue, (CGFloat)0, @"Blue componenet should be at lowest intensity");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

- (void)testBlackRGBFourHexadecimal
{
	UIColor *color = [AVHexColor colorWithHex:0xF000];
	STAssertNotNil(color, @"Color should not be nil");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)0, @"Red component should be at lowest intensity");
	STAssertEquals(green, (CGFloat)0, @"Green component should be at lowest intensity");
	STAssertEquals(blue, (CGFloat)0, @"Blue component should be at lowest intensity");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

- (void)testBlackRGBSixHexadecimal
{
	UIColor *color = [AVHexColor colorWithHex:0x000000];
	STAssertNotNil(color, @"Color should not be nil");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)0, @"Red component should be at lowest intensity");
	STAssertEquals(green, (CGFloat)0, @"Green component should be at lowest intensity");
	STAssertEquals(blue, (CGFloat)0, @"Blue component should be at lowest intensity");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

- (void)testBlackRGBEightHexadecimal
{
	UIColor *color = [AVHexColor colorWithHex:0xFF000000];
	STAssertNotNil(color, @"Color should not be nil");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)0, @"Red component should be at lowest intensity");
	STAssertEquals(green, (CGFloat)0, @"Green component should be at lowest intensity");
	STAssertEquals(blue, (CGFloat)0, @"Blue component should be at lowest intensity");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

#pragma mark - Red hex test
- (void)testRedRGBThreeHexadecimal
{
	UIColor *color = [AVHexColor colorWithHex:0xF00];
	STAssertNotNil(color, @"Color should not be nil");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)1, @"Red component should be at highest intensity");
	STAssertEquals(green, (CGFloat)0, @"Green component should be at lowest intensity");
	STAssertEquals(blue, (CGFloat)0, @"Blue component should be at the lowest intensity");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at the highest intensity");
}

- (void)testRedRGBFourHexadecimal
{
	UIColor *color = [AVHexColor colorWithHex:0xFF00];
	STAssertNotNil(color, @"Color should not be nil");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)1, @"Red component should be at highest intensity");
	STAssertEquals(green, (CGFloat)0, @"Green component should be at lowest intensity");
	STAssertEquals(blue, (CGFloat)0, @"Blue component should be at the lowest intensity");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at the highest intensity");
}

- (void)testRedRGBSixHexadecimal
{
	UIColor *color = [AVHexColor colorWithHex:0xFF0000];
	STAssertNotNil(color, @"Color should not be nil");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)1, @"Red component should be at highest intensity");
	STAssertEquals(green, (CGFloat)0, @"Green component should be at lowest intensity");
	STAssertEquals(blue, (CGFloat)0, @"Blue component should be at the lowest intensity");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at the highest intensity");
}

- (void)testRedRGBEightHexadecimal
{
	UIColor *color = [AVHexColor colorWithHex:0xFFFF0000];
	STAssertNotNil(color, @"Color should not be nil");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)1, @"Red component should be at highest intensity");
	STAssertEquals(green, (CGFloat)0, @"Green component should be at lowest intensity");
	STAssertEquals(blue, (CGFloat)0, @"Blue component should be at the lowest intensity");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at the highest intensity");
}

#pragma mark - Green hex test
- (void)testGreenRGBThreeHexadecimal
{
	UIColor *color = [AVHexColor colorWithHex:0x0F0];
	STAssertNotNil(color, @"Color should not be nil");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)0, @"Red component should be at lowest intensity");
	STAssertEquals(green, (CGFloat)1, @"Green component should be at highest intensity");
	STAssertEquals(blue, (CGFloat)0, @"Blue component should be at lowest intensity");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

- (void)testGreenRGBFourHexadecimal
{
	UIColor *color = [AVHexColor colorWithHex:0x0F0];
	STAssertNotNil(color, @"Color should not be nil");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)0, @"Red component should be at lowest intensity");
	STAssertEquals(green, (CGFloat)1, @"Green component should be at highest intensity");
	STAssertEquals(blue, (CGFloat)0, @"Blue component should be at lowest intensity");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

- (void)testGreenRGBSixHexadecimal
{
	UIColor *color = [AVHexColor colorWithHex:0x0F0];
	STAssertNotNil(color, @"Color should not be nil");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)0, @"Red component should be at lowest intensity");
	STAssertEquals(green, (CGFloat)1, @"Green component should be at highest intensity");
	STAssertEquals(blue, (CGFloat)0, @"Blue component should be at lowest intensity");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

- (void)testGreenRGBEightHexadecimal
{
	UIColor *color = [AVHexColor colorWithHex:0x0F0];
	STAssertNotNil(color, @"Color should not be nil");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)0, @"Red component should be at lowest intensity");
	STAssertEquals(green, (CGFloat)1, @"Green component should be at highest intensity");
	STAssertEquals(blue, (CGFloat)0, @"Blue component should be at lowest intensity");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

#pragma mark - Blue hex test
- (void)testBlueRGBThreeHexadecimal
{
	UIColor *color = [AVHexColor colorWithHex:0x00F];
	STAssertNotNil(color, @"Color should not be nil");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)0, @"Red component should be at lowest intensity");
	STAssertEquals(green, (CGFloat)0, @"Green component should be at lowest intensity");
	STAssertEquals(blue, (CGFloat)1, @"Blue component should be at highest intensity");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

- (void)testBlueRGBFourHexadecimal
{
	UIColor *color = [AVHexColor colorWithHex:0x00F];
	STAssertNotNil(color, @"Color should not be nil");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)0, @"Red component should be at lowest intensity");
	STAssertEquals(green, (CGFloat)0, @"Green component should be at lowest intensity");
	STAssertEquals(blue, (CGFloat)1, @"Blue component should be at highest intensity");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

- (void)testBlueRGBSixHexadecimal
{
	UIColor *color = [AVHexColor colorWithHex:0x00F];
	STAssertNotNil(color, @"Color should not be nil");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)0, @"Red component should be at lowest intensity");
	STAssertEquals(green, (CGFloat)0, @"Green component should be at lowest intensity");
	STAssertEquals(blue, (CGFloat)1, @"Blue component should be at highest intensity");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

- (void)testBlueRGBEightHexadecimal
{
	UIColor *color = [AVHexColor colorWithHex:0x00F];
	STAssertNotNil(color, @"Color should not be nil");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)0, @"Red component should be at lowest intensity");
	STAssertEquals(green, (CGFloat)0, @"Green component should be at lowest intensity");
	STAssertEquals(blue, (CGFloat)1, @"Blue component should be at highest intensity");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

#pragma mark - White hex test
- (void)testWhiteRGBThreeHexadecimal
{
	UIColor *color = [AVHexColor colorWithHex:0xFFF];
	STAssertNotNil(color, @"Color should not be nil");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)1, @"Red component should be at highest intensity");
	STAssertEquals(green, (CGFloat)1, @"Green component should be at highest intensity");
	STAssertEquals(blue, (CGFloat)1, @"Blue component should be at highest intensity");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

- (void)testWhiteRGBFourHexadecimal
{
	UIColor *color = [AVHexColor colorWithHex:0xFFFF];
	STAssertNotNil(color, @"Color should not be nil");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)1, @"Red component should be at highest intensity");
	STAssertEquals(green, (CGFloat)1, @"Green component should be at highest intensity");
	STAssertEquals(blue, (CGFloat)1, @"Blue component should be at highest intensity");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

- (void)testWhiteRGBSixHexadecimal
{
	UIColor *color = [AVHexColor colorWithHex:0xFFFFFF];
	STAssertNotNil(color, @"Color should not be nil");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)1, @"Red component should be at highest intensity");
	STAssertEquals(green, (CGFloat)1, @"Green component should be at highest intensity");
	STAssertEquals(blue, (CGFloat)1, @"Blue component should be at highest intensity");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

- (void)testWhiteRGBEightHexadecimal
{
	UIColor *color = [AVHexColor colorWithHex:0xFFFFFFFF];
	STAssertNotNil(color, @"Color should not be nil");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)1, @"Red component should be at highest intensity");
	STAssertEquals(green, (CGFloat)1, @"Green component should be at highest intensity");
	STAssertEquals(blue, (CGFloat)1, @"Blue component should be at highest intensity");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

#pragma mark - Black string test
- (void)testBlackRGBThreeDigitString
{
	UIColor *color = [AVHexColor colorWithHexString:@"#000"];
	STAssertNotNil(color, @"Color should not be nil.");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)0, @"Red component should be at lowest intensity.");
	STAssertEquals(green, (CGFloat)0, @"Green component should be at lowest intensity.");
	STAssertEquals(blue, (CGFloat)0, @"Blue component should be at lowest intensity.");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

- (void)testBlackRGBAFourDigitString
{
	UIColor *color = [AVHexColor colorWithHexString:@"#F000"];
	STAssertNotNil(color, @"Color should not be nil.");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)0, @"Red component should be at lowest intensity.");
	STAssertEquals(green, (CGFloat)0, @"Green component should be at lowest intensity.");
	STAssertEquals(blue, (CGFloat)0, @"Blue component should be at lowest intensity.");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity.");
}

- (void)testBlackRGBSixDigitString
{
	UIColor *color = [AVHexColor colorWithHexString:@"#000000"];
	STAssertNotNil(color, @"Color should not be nil.");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)0, @"Red component should be at lowest intensity.");
	STAssertEquals(green, (CGFloat)0, @"Green component should be at lowest intensity.");
	STAssertEquals(blue, (CGFloat)0, @"Blue component should be at lowest intensity.");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

- (void)testBlackRGBAEightString
{
	UIColor *color = [AVHexColor colorWithHexString:@"#FF000000"];
	STAssertNotNil(color, @"Color should not be nil.");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)0, @"Red component should be at lowest intensity.");
	STAssertEquals(green, (CGFloat)0, @"Green component should be at lowest intensity.");
	STAssertEquals(blue, (CGFloat)0, @"Blue component should be at lowest intensity.");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity.");
}

#pragma mark - White string test
- (void)testWhiteRGBThreeDigitString
{
	UIColor *color = [AVHexColor colorWithHexString:@"#FFF"];
	STAssertNotNil(color, @"Color should not be nil.");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)1, @"Red component should be at highest intensity.");
	STAssertEquals(green, (CGFloat)1, @"Green component should be at highest intensity.");
	STAssertEquals(blue, (CGFloat)1, @"Blue component should be at highest intensity.");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

- (void)testWhiteRGBAFourDigitString
{
	UIColor *color = [AVHexColor colorWithHexString:@"#FFFF"];
	STAssertNotNil(color, @"Color should not be nil.");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)1, @"Red component should be at highest intensity.");
	STAssertEquals(green, (CGFloat)1, @"Green component should be at highest intensity.");
	STAssertEquals(blue, (CGFloat)1, @"Blue component should be at highest intensity.");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity.");
}

- (void)testWhiteRGBSixDigitString
{
	UIColor *color = [AVHexColor colorWithHexString:@"#FFFFFF"];
	STAssertNotNil(color, @"Color should not be nil.");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)1, @"Red component should be at highest intensity.");
	STAssertEquals(green, (CGFloat)1, @"Green component should be at highest intensity.");
	STAssertEquals(blue, (CGFloat)1, @"Blue component should be at highest intensity.");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

- (void)testWhiteRGBAEightString
{
	UIColor *color = [AVHexColor colorWithHexString:@"#FFFFFFFF"];
	STAssertNotNil(color, @"Color should not be nil.");

	CGFloat red, green, blue, alpha;
	STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Statement should be true");
	STAssertEquals(red, (CGFloat)1, @"Red component should be at highest intensity.");
	STAssertEquals(green, (CGFloat)1, @"Green component should be at highest intensity.");
	STAssertEquals(blue, (CGFloat)1, @"Blue component should be at highest intensity.");
	STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity.");
}

#pragma mark - Color validity
- (void)testHexadecimalSevenDigitYieldNilColor
{
	UIColor *color = [AVHexColor colorWithHex:0xFFFFF]; // 5 Fs
	STAssertNil(color, @"Color should be nil");
}

- (void)testStringSevenDigitYieldNilColor
{
	UIColor *color = [AVHexColor colorWithHexString:@"#FFFFFFF"]; // 7 Fs
	STAssertNil(color, @"Color should be nil");
}

- (void)testInvalidStringYieldNilColor
{
	UIColor *color = [AVHexColor colorWithHexString:@"#HEYTHISISNOTACOLOR"]; // Random string
	STAssertNil(color, @"Color should be nil.");
}

- (void)testLongStringsYieldNilColor
{
	UIColor *color = [AVHexColor colorWithHexString:@"#000000000"];  // 9 zeros
	STAssertNil(color, @"Color should be nil.");
}

@end
