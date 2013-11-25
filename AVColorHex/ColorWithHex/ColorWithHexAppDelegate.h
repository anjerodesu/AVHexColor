//
//  ColorWithHexAppDelegate.h
//  ColorWithHex
//
//  Created by Angelo Villegas on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ColorWithHexViewController;

@interface ColorWithHexAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, strong) IBOutlet UIWindow *window;

@property (nonatomic, strong) IBOutlet ColorWithHexViewController *viewController;

@end
