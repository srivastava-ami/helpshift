# Helpshift-FoundationApp
This repo will maintain the code for the Foundation App

* IOS App
    * Swift
    
Note: iOS Deplyoment target 13

Prerequisite for iOS app to develop:
* cocopods
    * Using brew, if brew is not installled. Run the following:
    `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null`
    `brew install cocoapods`
    * Now you have the cocopods installed, go to the project direcotry and create new file name "Podfile". For content refer `FoundationApp/Podfile`
    * Run the following command to add the SDK in the project directory
    `pod update`
    * Now close the xcode project and open the xcworkspace file to while opening the project.


Core API usages and its detail:

   * Initialization - https://developers.helpshift.com/ios/getting-started/#initializing
   * Login/Logout - https://developers.helpshift.com/ios/users/#logged-in-users / https://developers.helpshift.com/ios/users/#logging-out-users
   * CIFs - https://developers.helpshift.com/ios/tracking/#custom-issue-fields
   * Custom Color scheme (header / commenting in plist file) - https://developers.helpshift.com/ios/design/#runtime-light-dark
   * Custom strings (change ‘contact us’ to ‘chat with us’ on FAQ screen) - https://developers.helpshift.com/ios/string-customization/#string-customization
   * In-app notifications - https://developers.helpshift.com/ios/notifications/#in-app-notifications
   * Badging (main screen with unreadcount) - https://developers.helpshift.com/ios/notifications/#notification-badges
