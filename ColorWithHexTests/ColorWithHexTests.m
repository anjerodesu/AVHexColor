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
- (void)testBlackRGB
{
	UIColor *color = [AVHexColor colorWithFullHex:0xFF000000];
	XCTAssertNotNil(color, @"Color should not be nil");

	CGFloat red, green, blue, alpha;
	[color getRed:&red green:&green blue:&blue alpha:&alpha];
	XCTAssertEqual(red, (CGFloat)0, @"Red component should be at lowest intensity");
	XCTAssertEqual(green, (CGFloat)0, @"Green component should be at lowest intensity");
	XCTAssertEqual(blue, (CGFloat)0, @"Blue component should be at lowest intensity");
	XCTAssertEqual(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

#pragma mark - Red hex test
- (void)testRedRGB
{
	UIColor *color = [AVHexColor colorWithFullHex:0xFFFF0000];
	XCTAssertNotNil(color, @"Color should not be nil");

	CGFloat red, green, blue, alpha;
	[color getRed:&red green:&green blue:&blue alpha:&alpha];
	XCTAssertEqual(red, (CGFloat)1, @"Red component should be at highest intensity");
	XCTAssertEqual(green, (CGFloat)0, @"Green component should be at lowest intensity");
	XCTAssertEqual(blue, (CGFloat)0, @"Blue component should be at the lowest intensity");
	XCTAssertEqual(alpha, (CGFloat)1, @"Alpha component should be at the highest intensity");
}

#pragma mark - Green hex test
- (void)testGreenRGB
{
	UIColor *color = [AVHexColor colorWithFullHex:0xFF00FF00];
	XCTAssertNotNil(color, @"Color should not be nil");

	CGFloat red, green, blue, alpha;
	[color getRed:&red green:&green blue:&blue alpha:&alpha];
	XCTAssertEqual(red, (CGFloat)0, @"Red component should be at lowest intensity");
	XCTAssertEqual(green, (CGFloat)1, @"Green component should be at highest intensity");
	XCTAssertEqual(blue, (CGFloat)0, @"Blue component should be at lowest intensity");
	XCTAssertEqual(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

#pragma mark - Blue hex test
- (void)testBlueRGB
{
	UIColor *color = [AVHexColor colorWithFullHex:0xFF0000FF];
	XCTAssertNotNil(color, @"Color should not be nil");

	CGFloat red, green, blue, alpha;
	[color getRed:&red green:&green blue:&blue alpha:&alpha];
	XCTAssertEqual(red, (CGFloat)0, @"Red component should be at lowest intensity");
	XCTAssertEqual(green, (CGFloat)0, @"Green component should be at lowest intensity");
	XCTAssertEqual(blue, (CGFloat)1, @"Blue component should be at highest intensity");
	XCTAssertEqual(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

#pragma mark - White hex test
- (void)testWhiteRGB
{
	UIColor *color = [AVHexColor colorWithFullHex:0xFFFFFFFF];
	XCTAssertNotNil(color, @"Color should not be nil");

	CGFloat red, green, blue, alpha;
	[color getRed:&red green:&green blue:&blue alpha:&alpha];
	XCTAssertEqual(red, (CGFloat)1, @"Red component should be at highest intensity");
	XCTAssertEqual(green, (CGFloat)1, @"Green component should be at highest intensity");
	XCTAssertEqual(blue, (CGFloat)1, @"Blue component should be at highest intensity");
	XCTAssertEqual(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

#pragma mark - Black string test
- (void)testBlackRGBThreeDigitString
{
	UIColor *color = [AVHexColor colorWithHexString:@"#000"];
	XCTAssertNotNil(color, @"Color should not be nil.");

	CGFloat red, green, blue, alpha;
	[color getRed:&red green:&green blue:&blue alpha:&alpha];
	XCTAssertEqual(red, (CGFloat)0, @"Red component should be at lowest intensity.");
	XCTAssertEqual(green, (CGFloat)0, @"Green component should be at lowest intensity.");
	XCTAssertEqual(blue, (CGFloat)0, @"Blue component should be at lowest intensity.");
	XCTAssertEqual(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

- (void)testBlackRGBAFourDigitString
{
	UIColor *color = [AVHexColor colorWithHexString:@"#F000"];
	XCTAssertNotNil(color, @"Color should not be nil.");

	CGFloat red, green, blue, alpha;
	[color getRed:&red green:&green blue:&blue alpha:&alpha];
	XCTAssertEqual(red, (CGFloat)0, @"Red component should be at lowest intensity.");
	XCTAssertEqual(green, (CGFloat)0, @"Green component should be at lowest intensity.");
	XCTAssertEqual(blue, (CGFloat)0, @"Blue component should be at lowest intensity.");
	XCTAssertEqual(alpha, (CGFloat)1, @"Alpha component should be at highest intensity.");
}

- (void)testBlackRGBSixDigitString
{
	UIColor *color = [AVHexColor colorWithHexString:@"#000000"];
	XCTAssertNotNil(color, @"Color should not be nil.");

	CGFloat red, green, blue, alpha;
	[color getRed:&red green:&green blue:&blue alpha:&alpha];
	XCTAssertEqual(red, (CGFloat)0, @"Red component should be at lowest intensity.");
	XCTAssertEqual(green, (CGFloat)0, @"Green component should be at lowest intensity.");
	XCTAssertEqual(blue, (CGFloat)0, @"Blue component should be at lowest intensity.");
	XCTAssertEqual(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

- (void)testBlackRGBAEightString
{
	UIColor *color = [AVHexColor colorWithHexString:@"#FF000000"];
	XCTAssertNotNil(color, @"Color should not be nil.");

	CGFloat red, green, blue, alpha;
	[color getRed:&red green:&green blue:&blue alpha:&alpha];
	XCTAssertEqual(red, (CGFloat)0, @"Red component should be at lowest intensity.");
	XCTAssertEqual(green, (CGFloat)0, @"Green component should be at lowest intensity.");
	XCTAssertEqual(blue, (CGFloat)0, @"Blue component should be at lowest intensity.");
	XCTAssertEqual(alpha, (CGFloat)1, @"Alpha component should be at highest intensity.");
}

#pragma mark - White string test
- (void)testWhiteRGBThreeDigitString
{
	UIColor *color = [AVHexColor colorWithHexString:@"#FFF"];
	XCTAssertNotNil(color, @"Color should not be nil.");

	CGFloat red, green, blue, alpha;
	[color getRed:&red green:&green blue:&blue alpha:&alpha];
	XCTAssertEqual(red, (CGFloat)1, @"Red component should be at highest intensity.");
	XCTAssertEqual(green, (CGFloat)1, @"Green component should be at highest intensity.");
	XCTAssertEqual(blue, (CGFloat)1, @"Blue component should be at highest intensity.");
	XCTAssertEqual(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

- (void)testWhiteRGBAFourDigitString
{
	UIColor *color = [AVHexColor colorWithHexString:@"#FFFF"];
	XCTAssertNotNil(color, @"Color should not be nil.");

	CGFloat red, green, blue, alpha;
	[color getRed:&red green:&green blue:&blue alpha:&alpha];
	XCTAssertEqual(red, (CGFloat)1, @"Red component should be at highest intensity.");
	XCTAssertEqual(green, (CGFloat)1, @"Green component should be at highest intensity.");
	XCTAssertEqual(blue, (CGFloat)1, @"Blue component should be at highest intensity.");
	XCTAssertEqual(alpha, (CGFloat)1, @"Alpha component should be at highest intensity.");
}

- (void)testWhiteRGBSixDigitString
{
	UIColor *color = [AVHexColor colorWithHexString:@"#FFFFFF"];
	XCTAssertNotNil(color, @"Color should not be nil.");

	CGFloat red, green, blue, alpha;
	[color getRed:&red green:&green blue:&blue alpha:&alpha];
	XCTAssertEqual(red, (CGFloat)1, @"Red component should be at highest intensity.");
	XCTAssertEqual(green, (CGFloat)1, @"Green component should be at highest intensity.");
	XCTAssertEqual(blue, (CGFloat)1, @"Blue component should be at highest intensity.");
	XCTAssertEqual(alpha, (CGFloat)1, @"Alpha component should be at highest intensity");
}

- (void)testWhiteRGBAEightString
{
	UIColor *color = [AVHexColor colorWithHexString:@"#FFFFFFFF"];
	XCTAssertNotNil(color, @"Color should not be nil.");

	CGFloat red, green, blue, alpha;
	[color getRed:&red green:&green blue:&blue alpha:&alpha];
	XCTAssertEqual(red, (CGFloat)1, @"Red component should be at highest intensity.");
	XCTAssertEqual(green, (CGFloat)1, @"Green component should be at highest intensity.");
	XCTAssertEqual(blue, (CGFloat)1, @"Blue component should be at highest intensity.");
	XCTAssertEqual(alpha, (CGFloat)1, @"Alpha component should be at highest intensity.");
}

#pragma mark - Color validity
- (void)testHexadecimalFiveDigitYieldNilColor
{
	UIColor *color = [AVHexColor colorWithFullHex:0xFFFFF]; // 5 Fs
	XCTAssertNil(color, @"Color should be nil");
}

- (void)testStringSevenDigitYieldNilColor
{
	UIColor *color = [AVHexColor colorWithHexString:@"#FFFFFFF"]; // 7 Fs
	XCTAssertNil(color, @"Color should be nil");
}

- (void)testInvalidStringYieldNilColor
{
	UIColor *color = [AVHexColor colorWithHexString:@"#HEYTHISISNOTACOLOR"]; // Random string
	XCTAssertNil(color, @"Color should be nil.");
}

- (void)testLongStringsYieldNilColor
{
	UIColor *color = [AVHexColor colorWithHexString:@"#000000000"];  // 9 zeros
	XCTAssertNil(color, @"Color should be nil.");
}

@end
