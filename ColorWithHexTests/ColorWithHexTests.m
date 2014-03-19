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

@end
