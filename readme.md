# Xcode Explorer #
This is a plugin project that allows you, as a developer, to explore
the various events and notifications that Xcode4 emits during normal
operations.

There is some supplemental information that can be found in a the following posts:

* [Monitoring Xcode4 Internals](http://www.blackdogfoundry.com/blog/xcodeexplorer-monitor-xcode4-internals/)
* [Looking at Xcode4 Controls](http://www.blackdogfoundry.com/blog/xcodeexplorer-checking-out-the-controls/)

## Installation ##
Installation is extremely simple.  
* Download the project
* Open it in Xcode
* Perform a build (this will automatically build and install the plugin)
* Restart Xcode

## Usage ##
The plugin adds a menu called `Explorer` that has a couple of menu items that you can choose from.

### Notifications ###
Selecting this menu item will open a floating window that you can use to view the
notifications as they occur.  You can enter some comma-separated regular expressions
into the text field to exclude notifications that you don't care about (for example,
it is unlikely you will want to see most of the `NSxxxx` notifications, so it defaults
to excluding them using the pattern `NS.*`).  

Be careful with your regular expressions.  If you type in an invalid one, it just 
silently ignores it.

### View Clicker ###
This allows you to click around on the various Xcode controls (buttons, text, etc)
to see where they are located in the hierarchy (and what type they are).  When you
click on a view/button/textfield, it displays the view hierarchy.
