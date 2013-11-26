//
//  CustomView.m
//  ColorWithHex
//
//  Created by Angelo Villegas on 11/26/13.
//
//

#import "CustomView.h"
#import "AVHexColor.h"

@implementation CustomView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];
	
	[[AVHexColor randomColor] setFill];
	NSRectFill( dirtyRect );
	[super drawRect: dirtyRect];
}

@end
