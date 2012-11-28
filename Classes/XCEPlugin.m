//
//  XCEPlugin.m
//  XcodeExplorer
//
//  Created by Craig Edwards on 28/11/12.
//  Copyright (c) 2012 BlackDog Foundry. All rights reserved.
//

#import "XCEPlugin.h"

@implementation XCEPlugin

static XCEPlugin *mySharedPlugin = nil;

+(void)pluginDidLoad:(NSBundle *)plugin {
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		mySharedPlugin = [[self alloc] init];
	});
}

+(XCEPlugin *)sharedPlugin {
	return mySharedPlugin;
}

-(id)init {
	if (self = [super init]) {
		[self addMenuItems];
		[self setNotificationsController:nil];
	}
	return self;
}

-(void)addMenuItems {
	NSMenu *mainMenu = [NSApp mainMenu];
	
	// create a new menu and add a new item
	NSMenu *menu = [[NSMenu alloc] initWithTitle:@"Explorer"];
	NSMenuItem *item1 = [[NSMenuItem alloc] initWithTitle:@"Notifications" action:@selector(notificationsMenuClicked:) keyEquivalent:@""];
	[item1 setTarget:self];
	[menu addItem:item1];
	// add the newly created menu to the main menu bar
	NSMenuItem *newMenuItem = [[NSMenuItem alloc] initWithTitle:@"Explorer" action:NULL keyEquivalent:@""];
	[newMenuItem setSubmenu:menu];
	[mainMenu addItem:newMenuItem];
}

-(void)notificationsMenuClicked:(id)sender {
	if ([self notificationsController] == nil) {
		[self setNotificationsController:[[[XCENotificationsWindowController alloc] init] autorelease]];
	}
	[[self notificationsController] showWindow:[NSApp mainWindow]];
}

-(void)dealloc {
	[_notificationsController release];
	[super dealloc];
}

@end
