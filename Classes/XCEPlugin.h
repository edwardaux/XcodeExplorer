//
//  XCEPlugin.h
//  XcodeExplorer
//
//  Created by Craig Edwards on 28/11/12.
//  Copyright (c) 2012 BlackDog Foundry. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "XCENotificationsWindowController.h"

@interface XCEPlugin : NSObject

@property (nonatomic,retain) XCENotificationsWindowController *notificationsController;

@end
