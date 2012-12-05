//
//  XCEViewClickerWindowController.m
//  XcodeExplorer
//
//  Created by Craig Edwards on 5/12/12.
//  Copyright (c) 2012 BlackDog Foundry. All rights reserved.
//

#import "XCEViewClickerWindowController.h"

@implementation XCEViewClickerWindowController

-(id)init {
	self = [super initWithWindowNibName:@"XCEViewClickerWindowController"];
	if (self) {
		[self registerClickListener];
	}
	return self;
}

-(void)registerClickListener {
	[NSEvent addLocalMonitorForEventsMatchingMask:NSLeftMouseDownMask handler:^(NSEvent *event) {
		NSView *view = [[[NSApp mainWindow] contentView] hitTest:[event locationInWindow]];
		
		// traverse up the view hierarchy collecting views as we go
		NSMutableArray *views = [NSMutableArray array];
		while (view != nil) {
			[views addObject:view];
			view = [view superview];
		}
		
		// now let's start at the top of the hierarchy and build something
		// that we can dump out and view
		NSMutableString *output = [NSMutableString string];
		if ([views count] == 0) {
			[output appendString:@"Unable to determine view"];
		}
		else {
			NSMutableString *indent = [NSMutableString string];
			for (int i = (int)[views count]-1; i >= 0; i--) {
				[output appendFormat:@"%@%@\n", indent, views[i]];
				[indent appendString:@"  "];
			}
		}
		// set the generated tree hierarchy into the window
		[currentViewContents setString:output];
		
		// and return the original event
		return event;
	}];
}

-(void)dealloc {
	[currentViewContents release];
	[super dealloc];
}

@end
