//
//  AppDelegate.m
//  ColorWithHex Mac
//
//  Created by Angelo Villegas on 11/26/13.
//
//

#import "AppDelegate.h"
#import "MasterHexViewController.h"

@interface AppDelegate()

@property (strong, nonatomic) IBOutlet MasterHexViewController *masterHexViewController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	// Insert code here to initialize your application
	
	self.masterHexViewController = [[MasterHexViewController alloc] initWithNibName: @"MasterHexViewController" bundle: nil];
	
	[self.window.contentView addSubview: self.masterHexViewController.view];
	self.masterHexViewController.view.frame = ( (NSView *)self.window.contentView ).bounds;
}

@end
