Lucid Qt Screensaver 
====================

http://projects.forum.nokia.com/lucid

A simple screensaver project for Qt on Symbian. The screensaver is designed 
for Symbian^3 AMOLED devices, which allow the continuous displaying of an 
image with very low power consumption.

This project implements a screensaver plug-in for the Symbian platform. The 
plug-in actually just starts a separate process which provides the visual 
output for the screensaver. In order to keep power usage low, the plug-in also 
instructs the screensaver host to set the display to partial mode, which 
provides just 8 colors (3-bit RGB) on screen.

The actual Qt application is using QML to display a randomly offset image on 
screen together with analog clock hands.  As the power usage of an AMOLED 
display depends on the amount of subpixels lit, the image is masked to have 
25% pixels visible and 75% black. The black grid mask and only one timer 
update per minute ensure that the power usage is always kept to minimum. 
Upon startup, the Qt application initialises its own window to raise over the 
screensaver host window, so that it is always shown but the focus is still in 
the screensaver host window.

The code has been tested to work with Qt 4.7.3 compiling to a Symbian^1 
target. Although this is targeted for Symbian^3 devices, the screensaver 
headers are no longer provided with the Symbian^3 SDK, so you have to use 
a Symbian^1 target.

The screensaver background graphic is a photo by Jarno Heikkinen, available 
under Creative Commons Attribution licence. It has been further dithered to an 
8 color palette.  <http://www.flickr.com/photos/jarnoheikkinen/5194626959/>


PREREQUISITES
-------------------------------------------------------------------------------

- Qt (basic) 
- Qt Quick (basic) 
- Symbian ECOM (intermediate)


IMPORTANT FILES/CLASSES
-------------------------------------------------------------------------------

lucidlauncher/lucidlauncher.cpp (screensaver plug-in implementation)
lucidsaver/main.cpp (QML viewer with screensaver-compatible Symbian calls)
qml/lucidsaver/main.qml (screensaver visuals)


REQUIRED CAPABILITIES
-------------------------------------------------------------------------------

NetworkServices, LocalServices, Location, ReadUserData, WriteUserData, 
ReadDeviceData, WriteDeviceData, SwEvent, UserEnvironment, PowerMgmt.


KNOWN ISSUES
-------------------------------------------------------------------------------

Symbian Anna requires manufacturer capabilities, which a casual developer may 
find difficult to obtain.


BUILD & INSTALLATION INSTRUCTIONS
-------------------------------------------------------------------------------

Preparations 
~~~~~~~~~~~~

Check that you have the latest Qt/Qt SDK installed in the development
environment and on the device.


Build & installation instructions using Qt SDK
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Open the Qt PRO file.
   File > Open File or Project, select the lucid.pro file.

2. Select target(s), for example 'Qt for Symbian^1 (Qt SDK)', and press the
   Finish button.

3. Open Projects > Symbian Device > Run Settings and select signing using your 
   developer certificate.

4. Press the Run button to build the project and create the Symbian install
   package. The application is installed on the device.


COMPATIBILITY
-------------------------------------------------------------------------------

- Qt SDK 1.1 
- Qt Mobility 1.1.3 
- Qt 4.7.3

Tested on: 
- Nokia E7-00

Developed with: 
- Qt SDK 1.1


CHANGE HISTORY
-------------------------------------------------------------------------------

1.0 First version