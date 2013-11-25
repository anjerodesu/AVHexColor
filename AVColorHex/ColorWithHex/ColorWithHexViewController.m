//
//  ColorWithHexViewController.m
//  ColorWithHex
//
//  Created by Angelo Villegas on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ColorWithHexViewController.h"
#import "AVHexColor.h"

@interface ColorWithHexViewController ()

@property (nonatomic, strong) IBOutlet UILabel *label1;
@property (nonatomic, strong) IBOutlet UILabel *label2;
@property (nonatomic, strong) IBOutlet UILabel *label3;
@property (nonatomic, strong) IBOutlet UILabel *label4;
@property (nonatomic, strong) IBOutlet UILabel *labelRandomColor;

@end

@implementation ColorWithHexViewController

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
	
	self.view.backgroundColor = [AVHexColor wheatColor];
	
	_label1.backgroundColor = [AVHexColor colorWithHex: 0xf6c];
	_label1.text = [AVHexColor hexStringFromColor: _label1.backgroundColor];
	
	_label2.backgroundColor = [AVHexColor colorWithHexString: @"#8f6c"];
	_label2.text = [AVHexColor hexStringFromColor: _label2.backgroundColor];
	
	// The first 2 digit (88) is alpha
	// (FF) for opaque and (00) for transparent
	_label3.backgroundColor = [AVHexColor colorWithHex: 0xff66cc];
	_label3.text = [AVHexColor hexStringFromColor: _label3.backgroundColor];
	
	_label4.backgroundColor = [AVHexColor colorWithHexString: @"#88ff66cc"];
	_label4.text = [AVHexColor hexStringFromColor: _label4.backgroundColor];
	
	UIColor *randomColor = [AVHexColor randomColor];
	NSString *randomColorText = [AVHexColor hexStringFromColor: randomColor];
	_labelRandomColor.backgroundColor = randomColor;
	_labelRandomColor.text = randomColorText;
	
	// Deprecated method
	// lblRandomColor.text = [UIColor colorWithRGBToHex: [UIColor randomColor]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

@end
