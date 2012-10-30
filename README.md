UIColor+ColorWithHex
===============================

UIColor+ColorWithHex was inspired by the lack of hexadecimal colour integration of iOS.

Methods
-------------------------------

+ + (UIColor *)colorWithHex:(UInt32)hexadecimal;
+ + (UIColor *)colorWithHexString:(NSString *)hexadecimal;
+ + (UIColor *)colorWithAlphaHex:(UInt32)hexadecimal;
+ + (UIColor *)colorWithAlphaHexString:(NSString *)hexadecimal;
+ + (NSString *)hexStringFromColor: (UIColor *)color;
+ + (UIColor *)randomColor;
+ + (UIColor *)colorWithHexa:(NSString *)hexadecimal;

Install
-------------------------------
Just copy the UIColor+ColorWithHex.h and UIColor+ColorWithHex.m files to your project and #import the header file (UIColor+ColorWithHex.h)

License
-------------------------------
Copyright © Angelo Villegas

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.