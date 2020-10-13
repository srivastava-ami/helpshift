//
//  AppDelegate.swift
//  FoundationApp
//
//  Created by amit srivastava on 05/12/19.
//  Copyright © 2019 amit srivastava. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Helpshift variables.
        // Ref https://developers.helpshift.com/ios/getting-started/
        let HSkey = "e2767a2hfsl9f8efe04412d4b9bead8ca"
        let HSDname = "DOMAIN.helpshift.com"
        let HSAppId = "DOMAIN_platform_20191119232256372-2e30cc357c68889"
        // End of variable declaration

        HelpshiftCore.initialize(with: HelpshiftSupport.sharedInstance());
        
        let installBuilder = HelpshiftInstallConfigBuilder()
        installBuilder.enableInAppNotifications = true
        installBuilder.enableLogging = true
        
        HelpshiftCore.install(forApiKey: HSkey, domainName: HSDname, appID: HSAppId, with: installBuilder.build());
        
        HelpshiftCore.setTheme("HelpshiftCustomConfigDark")
//        HelpshiftCore.setLanguage("en")
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    

}

