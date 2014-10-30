//
//  BDNotificationsWindowController.h
//  XcodeExplorer
//
//  Created by Craig Edwards on 28/11/12.
//  Copyright (c) 2012 BlackDog Foundry. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface XCENotificationsWindowController : NSWindowController<NSTableViewDataSource> {
	NSMutableArray *notifications;
	NSMutableArray *regularExpressions;
	
	IBOutlet NSTextField *filterTextField;
	IBOutlet NSTableView *tableView;
    IBOutlet NSButton *recordButton;
    IBOutlet NSButton *stopButton;
}

-(IBAction)startRecording:(id)sender;
-(IBAction)stopRecording:(id)sender;

@end
