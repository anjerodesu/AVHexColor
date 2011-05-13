//
//  ColorWithHexViewController.m
//  ColorWithHex
//
//  Created by Angelo Villegas on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ColorWithHexViewController.h"
#import "UIColor+ColorWithHex.h"

@implementation ColorWithHexViewController

@synthesize lblColorWithHex;
@synthesize lblColorWithHexString;
@synthesize lblColorWithAlphaHex;
@synthesize lblColorWithAlphaHexString;
@synthesize lblRandomColor;

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[[self view] setBackgroundColor: [UIColor whiteColor]];
	
	[lblColorWithHex setBackgroundColor: [UIColor colorWithHex: 0xff0000]];
	[lblColorWithHex setText: @"ColorWithHex : 0xFF0000"];
	
	[lblColorWithHexString setBackgroundColor: [UIColor colorWithHexString: @"#00ff00"]];
	[lblColorWithHexString setText: @"ColorWithHexString : @\"#00FF00\""];
	
	// The first 2 digit (88) is alpha
	// (FF) for opaque and (00) for transparent
	[lblColorWithAlphaHex setBackgroundColor: [UIColor colorWithAlphaHex: 0x880000ff]];
	[lblColorWithAlphaHex setText: @"ColorWithAlphaHex : 0x880000FF"];
	
	[lblColorWithAlphaHexString setBackgroundColor: [UIColor colorWithAlphaHexString: @"#88000000"]];
	[lblColorWithAlphaHexString setText: @"ColorWithAlphaHexString : @\"#88000000\""];
	
	UIColor *randomColor = [UIColor randomColor];
	[lblRandomColor setBackgroundColor: randomColor];
	[lblRandomColor setText: [@"Color (Random) : " stringByAppendingString: [UIColor colorWithRGBToHex: randomColor]]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
