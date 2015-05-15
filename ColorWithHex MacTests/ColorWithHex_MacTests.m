//
//  ColorWithHex_MacTests.m
//  ColorWithHex MacTests
//
//  Created by Angelo Villegas on 11/26/13.
//
//

#import <XCTest/XCTest.h>
#import "AVHexColor.h"

@interface ColorWithHex_MacTests : XCTestCase

@end

@implementation ColorWithHex_MacTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - Black hex test
- (void)testBlackRGB
{
	NSColor *color = [AVHexColor colorWithFullHex:0xFF000000];
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
	NSColor *color = [AVHexColor colorWithFullHex:0xFFFF0000];
	XCTAssertNotNil(color, @"Color should not be nil");

	CGFloat red, green, blue, alpha;
	[color getRed:&red green:&green blue:&blue alpha:&alpha];
	XCTAssertEqual(red, (CGFloat)1, @"Red component should be at highest intensity");
	XCTAssertEqual(green, (CGFloat)0, @"Green component should be at lowest intensity");
	XCTAssertEqual(blue, (CGFloat)0, @"Blue component should be at the lowest intensity");
	XCTAssertEqual(alpha, (CGFloat)1, @"Alpha component should be at the highest intensity");
}

#pragma mark - Green hex test
- (void)testGreenRGBEightHexadecimal
{
	NSColor *color = [AVHexColor colorWithFullHex:0xFF00FF00];
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
	NSColor *color = [AVHexColor colorWithFullHex:0xFF0000FF];
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
	NSColor *color = [AVHexColor colorWithFullHex:0xFFFFFFFF];
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
	NSColor *color = [AVHexColor colorWithHexString:@"#000"];
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
	NSColor *color = [AVHexColor colorWithHexString:@"#F000"];
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
	NSColor *color = [AVHexColor colorWithHexString:@"#000000"];
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
	NSColor *color = [AVHexColor colorWithHexString:@"#FF000000"];
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
	NSColor *color = [AVHexColor colorWithHexString:@"#FFF"];
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
	NSColor *color = [AVHexColor colorWithHexString:@"#FFFF"];
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
	NSColor *color = [AVHexColor colorWithHexString:@"#FFFFFF"];
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
	NSColor *color = [AVHexColor colorWithHexString:@"#FFFFFFFF"];
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
	NSColor *color = [AVHexColor colorWithFullHex:0xFFFFF];
	XCTAssertNil(color, @"Color should be nil");
}

- (void)testStringSevenDigitYieldNilColor
{
	NSColor *color = [AVHexColor colorWithHexString:@"#FFFFFFF"];
	XCTAssertNil(color, @"Color should be nil");
}

- (void)testInvalidStringYieldNilColor
{
	NSColor *color = [AVHexColor colorWithHexString:@"#HEYTHISISNOTACOLOR"];
	XCTAssertNil(color, @"Color should be nil.");
}

- (void)testLongStringsYieldNilColor
{
	NSColor *color = [AVHexColor colorWithHexString:@"#000000000"];  // 9 zeros
	XCTAssertNil(color, @"Color should be nil.");
}

@end
