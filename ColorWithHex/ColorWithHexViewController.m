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

	[self testExecTime];
	
	self.view.backgroundColor = [AVHexColor wheatColor];
	
	_label1.backgroundColor = [AVHexColor colorWithHex: 0xF00];
	_label1.text = [NSString stringWithFormat: @"label1: %@", [AVHexColor hexStringFromColor: _label1.backgroundColor]];
	
	_label2.backgroundColor = [AVHexColor colorWithHexString: @"#8f6c"];
	_label2.text = [NSString stringWithFormat: @"label2: %@", [AVHexColor hexStringFromColor: _label2.backgroundColor]];
	
	_label3.backgroundColor = [AVHexColor colorWithHex: 0x80F6];
	_label3.text = [NSString stringWithFormat: @"label3: %@", [AVHexColor hexStringFromColor: _label3.backgroundColor]];
	
	_label4.backgroundColor = [AVHexColor colorWithHexString: @"#8FCCBBAA"];
	_label4.text = [NSString stringWithFormat: @"label4: %@", [AVHexColor hexStringFromColor: _label4.backgroundColor]];
	
	AVColor *randomColor = [AVHexColor randomColor];
	NSString *randomColorText = [AVHexColor hexStringFromColor: randomColor];
	_labelRandomColor.backgroundColor = randomColor;
	_labelRandomColor.text = randomColorText;
}

- (void)testExecTime
{
	NSDate *start = [NSDate date];
	[AVHexColor colorWithHex: 0xf6c];
	NSTimeInterval timeInterval = [start timeIntervalSinceNow];
	NSLog(@"%s [Line %d] timeInterval 0xf6c: %f", __FUNCTION__, __LINE__, timeInterval);
	
	NSDate *start1 = [NSDate date];
	[AVHexColor colorWithHexString: @"#8f6c"];
	NSTimeInterval timeInterval1 = [start1 timeIntervalSinceNow];
	NSLog(@"%s [Line %d] timeInterval @\"#8f6c\": %f", __FUNCTION__, __LINE__, timeInterval1);
	
	NSDate *start2 = [NSDate date];
	[AVHexColor colorWithHex: 0xff66cc];
	NSTimeInterval timeInterval2 = [start2 timeIntervalSinceNow];
	NSLog(@"%s [Line %d] timeInterval 0xff66cc: %f", __FUNCTION__, __LINE__, timeInterval2);
	
	NSDate *start3 = [NSDate date];
	[AVHexColor colorWithHexString: @"#88ff66cc"];
	NSTimeInterval timeInterval3 = [start3 timeIntervalSinceNow];
	NSLog(@"%s [Line %d] timeInterval @\"#88ff66cc\": %f", __FUNCTION__, __LINE__, timeInterval3);
}

@end
