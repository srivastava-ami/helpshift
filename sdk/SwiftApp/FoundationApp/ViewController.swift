//
//  ViewController.swift
//  FoundationApp
//
//  Created by amit srivastava on 05/12/19.
//  Copyright © 2019 amit srivastava. All rights reserved.
//

import UIKit

class MyDelegates: NSObject, HelpshiftSupportDelegate {
    
    private let button: UIButton
    init(_ button: UIButton) {
        self.button = button
    }
    
        func didReceiveUnreadMessagesCount(_ count: Int) {
            DispatchQueue.main.async() {
                self.button.setTitle(self.button.title(for: .normal)! + String(" (") +  String(count) + String(")"), for: .normal)
            }
        }
        
    }


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Using the badge delegate on first load.
        HelpshiftSupport.sharedInstance()?.delegate = MyDelegates(self.showConversation)
        
    }
    
    @IBOutlet weak var showConversation: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
//        Updating the button title on every apearance of the screen.
        showConversation.setTitle("Show Conversations", for: .normal)
//        self.button.setTitle(self.button.title(for: .normal), for: .normal)
        HelpshiftSupport.requestUnreadMessagesCount(true)
    }

    
    @IBAction func ShowFaqs(_ sender: Any) {
        
//        let cifbuild = NSMutableDictionary()
//        cifbuild["app_name"] = ["sl", "Foundation App"];
//        let cifbuilder = HelpshiftAPIConfigBuilder.init()
//        cifbuilder.customIssueFields = (cifbuild as! [AnyHashable : Any]);
//        HelpshiftSupport.showFAQs(self, with: cifbuilder.build());
        
        let cifbuild = NSMutableDictionary()
        cifbuild["app_name"] = ["sl", "Foundation App"];
        let cifbuilder = HelpshiftAPIConfigBuilder.init()
        cifbuilder.customIssueFields = (cifbuild as! [AnyHashable : Any]);
        let builder = HelpshiftAPIConfigBuilder()
        let hashmeta: [AnyHashable: Any] = [AnyHashable("meta"): "Foundation App"]
        let hashtag: [Any] = ["tier3", "hid_tier1", "fr"]
        builder.customMetaData = HelpshiftSupportMetaData.init(metaData: hashmeta, andTags: hashtag)
        let apiconfig = builder.build()
//        HelpshiftSupport.showFAQs(self, with: cifbuilder.build());
        HelpshiftSupport.showFAQs(self, with: apiconfig)
                
    }
    
    
    @IBAction func ShowConversation(_ sender: Any) {
        let convbuilder = HelpshiftAPIConfigBuilder.init()
        convbuilder.showConversationInfoScreen = true
        let apiconfig = convbuilder.build()
        HelpshiftSupport.showConversation(self, with: apiconfig)
    }
    
    
    @IBAction func AccountSetting(_ sender: Any) {
    }
        
}

