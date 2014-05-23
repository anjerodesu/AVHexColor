AVHexColor
===============================
[![Build Status](https://travis-ci.org/anjerodesu/AVHexColor.png?branch=master)](https://travis-ci.org/anjerodesu/AVHexColor)
![Badge w/ Version](https://cocoapod-badges.herokuapp.com/v/HexColors/1.2.0/badge.png)  
![ios/osx](https://cocoapod-badges.herokuapp.com/p/HexColors/badge.png)

`AVHexColor` was inspired by the lack of hexadecimal colour integration of iOS. `AVHexColor` is a class with hex support for both `NSColor` and `UIColor`. Supports both prefixed with "#" and without for string-based hex colours.

Methods
-------------------------------
+ + (AVColor *)colorWithHex:(UInt32)hexadecimal;
+ + (AVColor *)colorWithHexString:(NSString *)hexadecimal;

And a lot of convenience methods...

Examples
-------------------------------
#### iOS
``` objective-c
// hex
UIColor *colorWithHex = [AVHexColor colorWithHex: 0xF00];
// string
UIColor *colorWithHex = [AVHexColor colorWithHexString: @"#8f6c"];
```

#### OS X
``` objective-c
// hex
NSColor *colorWithHex = [AVHexColor colorWithHex: 0xF00];
// string
NSColor *colorWithHex = [AVHexColor colorWithHexString: @"#8f6c"];
```

Install
-------------------------------
### Recommended

#### Podfile

via [CocoaPods](http://cocoapods.org)

```ruby
platform :ios
pod 'AVHexColor', '~> 1.2.0'
```

### Alternatives

1. Using git subtree
	- `git subtree add --prefix=AVHexColor --squash https://github.com/anjerodesu/AVHexColor.git master`
2. Using git submodule
	- `git submodule add https://github.com/anjerodesu/AVHexColor.git AVHexColor`
3. [Download](https://github.com/anjerodesu/AVHexColor/archive/master.zip "Download Zip")
	- Copy the `AVHexColor.h` and `AVHexColor.m` files and `#import` the *header file* (`AVHexColor.h`) to your project

License
-------------------------------
ColorWithHex is available under the MIT license. See the [LICENSE](https://github.com/anjerodesu/AVColorWithHex/blob/master/LICENCE "License File") file for more info.
