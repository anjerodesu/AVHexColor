//
//  AVHexColor.h
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

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE
#define AVColor UIColor
#else
#define AVColor NSColor
#endif

@interface AVHexColor : NSObject

/**
 * Convert hexadecimal value to iOS-based RGB color.
 *
 * @note Only hexadecimal value in full format: @p 0x[aaRRGGBB]. e.g. 0xFFFFFFFF
 *
 * @param hexadecimal A hexadecimal value that consists of an alpha, Red, Green, and Blue.
 * @return The AVColor object. The color information represented by this object is in the device RGB colorspace.
 */
+ (AVColor *)colorWithFullHex:(UInt32)hexadecimal;
/**
 * Convert string hex value to RGB.
 *
 * @note Accepts several hex length:
 *      3 = #RGB
 *      4 = #aRGB
 *      6 = #RRGGBB
 *      8 = #aaRRGGBB
 *
 * @param hexadecimal A hexadecimal value that consists of an alpha, Red, Green, and Blue.
 * @return The AVColor object. The color information represented by this object is in the device RGB colorspace.
 */
+ (AVColor *)colorWithHexString:(NSString *)hexadecimal;

/**
 * Convert AVColor object to NSString hexadecimal color value.
 *
 * @param color The AVColor object.
 * @return A string hexadecimal value with hash tag (#).
 */
+ (NSString *)hexStringFromColor:(AVColor *)color;
/**
 * Convert AVColor object to NSString hexadecimal color value.
 *
 * @note Returns a string hexadecimal value with hash tag (#) as default.
 *
 * @param color The AVColor object
 * @param withHash A boolean value that returns a string value with hash tag (#) if YES.
 * @return A string hexadecimal value with an optional hash tag (#) character.
 */
+ (NSString *)hexStringFromColor:(AVColor *)color withHash:(BOOL)withHash;
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
+ (NSString *)hexStringWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

/**
 * Generate a random color.
 *
 * @return The AVColor object. The color information represented by this object is in the device RGB colorspace.
 */
+ (AVColor *)randomColor;

// Some convenience methods to create colors
/**
 * Returns a color object whose hexadecimal value is 0xFF808000.
 *
 * @return The AVColor object.
 */
+ (AVColor *)oliveColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFF0FFFF.
 *
 * @return The AVColor object.
 */
+ (AVColor *)azureColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFDA70D6.
 *
 * @return The AVColor object.
 */
+ (AVColor *)orchidColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFD8BFD8.
 *
 * @return The AVColor object.
 */
+ (AVColor *)thistleColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFF5F5DC.
 *
 * @return The AVColor object.
 */
+ (AVColor *)beigeColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFE3CF57.
 *
 * @return The AVColor object.
 */
+ (AVColor *)bananaColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFDDA0DD.
 *
 * @return The AVColor object.
 */
+ (AVColor *)plumColor;
/**
 * Returns a color object whose hexadecimal value is 0xFF9C661F.
 *
 * @return The AVColor object.
 */
+ (AVColor *)brickColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFB22222.
 *
 * @return The AVColor object.
 */
+ (AVColor *)fireBrickColor;
/**
 * Returns a color object whose hexadecimal value is 0xFF87CEEB.
 *
 * @return The AVColor object.
 */
+ (AVColor *)skyBlueColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFF0E68C.
 *
 * @return The AVColor object.
 */
+ (AVColor *)khakiColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFF5DEB3.
 *
 * @return The AVColor object.
 */
+ (AVColor *)wheatColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFDEB887.
 *
 * @return The AVColor object.
 */
+ (AVColor *)burlywoodColor;
/**
 * Returns a color object whose hexadecimal value is 0xFF5F9EA0.
 *
 * @return The AVColor object.
 */
+ (AVColor *)cadetBlueColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFED9121.
 *
 * @return The AVColor object.
 */
+ (AVColor *)carrotColor;
/**
 * Returns a color object whose hexadecimal value is 0xFF4B0082.
 *
 * @return The AVColor object.
 */
+ (AVColor *)indigoColor;
/**
 * Returns a color object whose hexadecimal value is 0xFF800000.
 *
 * @return The AVColor object.
 */
+ (AVColor *)maroonColor;
/**
 * Returns a color object whose hexadecimal value is 0xFF007BA7.
 *
 * @return The AVColor object.
 */
+ (AVColor *)ceruleanColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFFFE4B5.
 *
 * @return The AVColor object.
 */
+ (AVColor *)moccasinColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFD2B48C.
 *
 * @return The AVColor object.
 */
+ (AVColor *)tanColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFE3A869.
 *
 * @return The AVColor object.
 */
+ (AVColor *)melonColor;
/**
 * Returns a color object whose hexadecimal value is 0xFF3D59AB.
 *
 * @return The AVColor object.
 */
+ (AVColor *)cobaltColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFDC143C.
 *
 * @return The AVColor object.
 */
+ (AVColor *)crimsonColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFFFE4E1.
 *
 * @return The AVColor object.
 */
+ (AVColor *)mistyRoseColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFFFC0CB.
 *
 * @return The AVColor object.
 */
+ (AVColor *)pinkColor;
/**
 * Returns a color object whose hexadecimal value is 0xFF5A4FCF.
 *
 * @return The AVColor object.
 */
+ (AVColor *)irisColor;
/**
 * Returns a color object whose hexadecimal value is 0xFF7FFF00.
 *
 * @return The AVColor object.
 */
+ (AVColor *)chartreuseColor;
/**
 * Returns a color object whose hexadecimal value is 0xFF000080.
 *
 * @return The AVColor object.
 */
+ (AVColor *)navyColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFBDFCC9.
 *
 * @return The AVColor object.
 */
+ (AVColor *)mintColor;
/**
 * Returns a color object whose hexadecimal value is 0xFF008080.
 *
 * @return The AVColor object.
 */
+ (AVColor *)tealColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFEE82EE.
 *
 * @return The AVColor object.
 */
+ (AVColor *)violetColor;
/**
 * Returns a color object whose hexadecimal value is 0xFF32CD32.
 *
 * @return The AVColor object.
 */
+ (AVColor *)limeColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFDAA520.
 *
 * @return The AVColor object.
 */
+ (AVColor *)goldenRodColor __attribute__((deprecated("Corrected spelling. Use '+ goldenrodColor' instead.")));
+ (AVColor *)goldenrodColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFFDF5E6.
 *
 * @return The AVColor object.
 */
+ (AVColor *)oldLaceColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFF0F8FF.
 *
 * @return The AVColor object.
 */
+ (AVColor *)aliceBlueColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFFAEBD7.
 *
 * @return The AVColor object.
 */
+ (AVColor *)antiqueWhiteColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFFFEBCD.
 *
 * @return The AVColor object.
 */
+ (AVColor *)blanchedAlmondColor;
/**
 * Returns a color object whose hexadecimal value is 0xFF6495ED.
 *
 * @return The AVColor object.
 */
+ (AVColor *)cornflowerBlueColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFFFFAF0.
 *
 * @return The AVColor object.
 */
+ (AVColor *)floralWhiteColor;
/**
 * Returns a color object whose hexadecimal value is 0xFF228B22.
 *
 * @return The AVColor object.
 */
+ (AVColor *)forestGreenColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFDCDCDC.
 *
 * @return The AVColor object.
 */
+ (AVColor *)gainsboroColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFADFF2F.
 *
 * @return The AVColor object.
 */
+ (AVColor *)greenYellowColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFF0FFF0.
 *
 * @return The AVColor object.
 */
+ (AVColor *)honeydewColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFFF69B4.
 *
 * @return The AVColor object.
 */
+ (AVColor *)hotPinkColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFCD5C5C.
 *
 * @return The AVColor object.
 */
+ (AVColor *)indianRedColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFFFFFF0.
 *
 * @return The AVColor object.
 */
+ (AVColor *)ivoryColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFE6E6FA.
 *
 * @return The AVColor object.
 */
+ (AVColor *)lavenderColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFFF7F50.
 *
 * @return The AVColor object.
 */
+ (AVColor *)coralColor;
// Alloy Colors
/**
 * Returns a color object whose hexadecimal value is 0xFFCD7F32.
 *
 * @return The AVColor object.
 */
+ (AVColor *)bronzeColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFFFD700.
 *
 * @return The AVColor object.
 */
+ (AVColor *)goldColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFC0C0C0.
 *
 * @return The AVColor object.
 */
+ (AVColor *)silverColor;
/**
 * Returns a color object whose hexadecimal value is 0xFF4682B4.
 *
 * @return The AVColor object.
 */
+ (AVColor *)steelBlueColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFFF9912.
 *
 * @return The AVColor object.
 */
+ (AVColor *)cadmiumYellowColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFFF6103.
 *
 * @return The AVColor object.
 */
+ (AVColor *)cadmiumOrangeColor;
// Gem Colors
/**
 * Returns a color object whose hexadecimal value is 0xFF50C878.
 *
 * @return The AVColor object.
 */
+ (AVColor *)emeraldColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFE0115F.
 *
 * @return The AVColor object.
 */
+ (AVColor *)rubyColor;
/**
 * Returns a color object whose hexadecimal value is 0xFF082567.
 *
 * @return The AVColor object.
 */
+ (AVColor *)sapphireColor;
/**
 * Returns a color object whose hexadecimal value is 0xFF7FFFD4.
 *
 * @return The AVColor object.
 */
+ (AVColor *)aquamarineColor;
/**
 * Returns a color object whose hexadecimal value is 0xFF40E0D0.
 *
 * @return The AVColor object.
 */
+ (AVColor *)turquoiseColor;
// Dark Colors
/**
 * Returns a color object whose hexadecimal value is 0xFF8B0000.
 *
 * @return The AVColor object.
 */
+ (AVColor *)darkRedColor;
/**
 * Returns a color object whose hexadecimal value is 0xFF006400.
 *
 * @return The AVColor object.
 */
+ (AVColor *)darkGreenColor;
/**
 * Returns a color object whose hexadecimal value is 0xFF00008B.
 *
 * @return The AVColor object.
 */
+ (AVColor *)darkBlueColor;
/**
 * Returns a color object whose hexadecimal value is 0xFF008B8B.
 *
 * @return The AVColor object.
 */
+ (AVColor *)darkCyanColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFB5A42E.
 *
 * @return The AVColor object.
 */
+ (AVColor *)darkYellowColor;
/**
 * Returns a color object whose hexadecimal value is 0xFF8B008B.
 *
 * @return The AVColor object.
 */
+ (AVColor *)darkMagentaColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFFF8C00.
 *
 * @return The AVColor object.
 */
+ (AVColor *)darkOrangeColor;
/**
 * Returns a color object whose hexadecimal value is 0xFF9400D3.
 *
 * @return The AVColor object.
 */
+ (AVColor *)darkVioletColor;
// Light Colors
/**
 * Returns a color object whose hexadecimal value is 0xFFF26C4F.
 *
 * @return The AVColor object.
 */
+ (AVColor *)lightRedColor;
/**
 * Returns a color object whose hexadecimal value is 0xFF90EE90.
 *
 * @return The AVColor object.
 */
+ (AVColor *)lightGreenColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFADD8E6.
 *
 * @return The AVColor object.
 */
+ (AVColor *)lightBlueColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFE0FFFF.
 *
 * @return The AVColor object.
 */
+ (AVColor *)lightCyanColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFFFFFE0.
 *
 * @return The AVColor object.
 */
+ (AVColor *)lightYellowColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFFF77FF.
 *
 * @return The AVColor object.
 */
+ (AVColor *)lightMagentaColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFE7B98A.
 *
 * @return The AVColor object.
 */
+ (AVColor *)lightOrangeColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFB98AE7.
 *
 * @return The AVColor object.
 */
+ (AVColor *)lightVioletColor;
/**
 * Returns a color object whose hexadecimal value is 0xFFF08080.
 *
 * @return The AVColor object.
 */
+ (AVColor *)lightCoralColor;

@end
