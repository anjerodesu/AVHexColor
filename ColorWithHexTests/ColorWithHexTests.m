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

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testBlackRGBThreeDigitString
{
    UIColor *color = [AVHexColor colorWithHexString:@"#000"];
    STAssertNotNil(color, @"Color should not be nil.");

    CGFloat red, green, blue;
    STAssertTrue([color getRed:&red green:&green blue:&blue alpha:nil], @"Color components should be readable.");

    STAssertEquals(red, (CGFloat)0, @"Red component should be at lowest intensity.");
    STAssertEquals(green, (CGFloat)0, @"Green component should be at lowest intensity.");
    STAssertEquals(blue, (CGFloat)0, @"Blue component should be at lowest intensity.");
}

- (void)testBlackRGBAFourDigitString
{
    UIColor *color = [AVHexColor colorWithHexString:@"#F000"];
    STAssertNotNil(color, @"Color should not be nil.");

    CGFloat red, green, blue, alpha;
    STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Color components should be readable.");

    STAssertEquals(red, (CGFloat)0, @"Red component should be at lowest intensity.");
    STAssertEquals(green, (CGFloat)0, @"Green component should be at lowest intensity.");
    STAssertEquals(blue, (CGFloat)0, @"Blue component should be at lowest intensity.");
    STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity.");
}

- (void)testBlackRGBSixDigitString
{
    UIColor *color = [AVHexColor colorWithHexString:@"#000000"];
    STAssertNotNil(color, @"Color should not be nil.");

    CGFloat red, green, blue;
    STAssertTrue([color getRed:&red green:&green blue:&blue alpha:nil], @"Color components should be readable.");

    STAssertEquals(red, (CGFloat)0, @"Red component should be at lowest intensity.");
    STAssertEquals(green, (CGFloat)0, @"Green component should be at lowest intensity.");
    STAssertEquals(blue, (CGFloat)0, @"Blue component should be at lowest intensity.");
}

- (void)testBlackRGBAEightString
{
    UIColor *color = [AVHexColor colorWithHexString:@"#FF000000"];
    STAssertNotNil(color, @"Color should not be nil.");

    CGFloat red, green, blue, alpha;
    STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Color components should be readable.");

    STAssertEquals(red, (CGFloat)0, @"Red component should be at lowest intensity.");
    STAssertEquals(green, (CGFloat)0, @"Green component should be at lowest intensity.");
    STAssertEquals(blue, (CGFloat)0, @"Blue component should be at lowest intensity.");
    STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity.");
}

- (void)testWhiteRGBThreeDigitString
{
    UIColor *color = [AVHexColor colorWithHexString:@"#FFF"];
    STAssertNotNil(color, @"Color should not be nil.");

    CGFloat red, green, blue;
    STAssertTrue([color getRed:&red green:&green blue:&blue alpha:nil], @"Color components should be readable.");

    STAssertEquals(red, (CGFloat)1, @"Red component should be at highest intensity.");
    STAssertEquals(green, (CGFloat)1, @"Green component should be at highest intensity.");
    STAssertEquals(blue, (CGFloat)1, @"Blue component should be at highest intensity.");
}

- (void)testWhiteRGBAFourDigitString
{
    UIColor *color = [AVHexColor colorWithHexString:@"#FFFF"];
    STAssertNotNil(color, @"Color should not be nil.");

    CGFloat red, green, blue, alpha;
    STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Color components should be readable.");

    STAssertEquals(red, (CGFloat)1, @"Red component should be at highest intensity.");
    STAssertEquals(green, (CGFloat)1, @"Green component should be at highest intensity.");
    STAssertEquals(blue, (CGFloat)1, @"Blue component should be at highest intensity.");
    STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity.");
}

- (void)testWhiteRGBSixDigitString
{
    UIColor *color = [AVHexColor colorWithHexString:@"#FFFFFF"];
    STAssertNotNil(color, @"Color should not be nil.");

    CGFloat red, green, blue;
    STAssertTrue([color getRed:&red green:&green blue:&blue alpha:nil], @"Color components should be readable.");

    STAssertEquals(red, (CGFloat)1, @"Red component should be at highest intensity.");
    STAssertEquals(green, (CGFloat)1, @"Green component should be at highest intensity.");
    STAssertEquals(blue, (CGFloat)1, @"Blue component should be at highest intensity.");
}

- (void)testWhiteRGBAEightString
{
    UIColor *color = [AVHexColor colorWithHexString:@"#FFFFFFFF"];
    STAssertNotNil(color, @"Color should not be nil.");

    CGFloat red, green, blue, alpha;
    STAssertTrue([color getRed:&red green:&green blue:&blue alpha:&alpha], @"Color components should be readable.");

    STAssertEquals(red, (CGFloat)1, @"Red component should be at highest intensity.");
    STAssertEquals(green, (CGFloat)1, @"Green component should be at highest intensity.");
    STAssertEquals(blue, (CGFloat)1, @"Blue component should be at highest intensity.");
    STAssertEquals(alpha, (CGFloat)1, @"Alpha component should be at highest intensity.");
}

- (void)testInvalidStringYieldNilColor
{
    UIColor *color = [AVHexColor colorWithHexString:@"#HEYTHISISNOTACOLOR"];
    STAssertNil(color, @"Color should not be nil.");
}

@end
