//
//  LoginViewController.swift
//  FoundationApp
//
//  Created by amit srivastava on 06/01/20.
//  Copyright © 2020 amit srivastava. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var loginlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func login(_ sender: AnyObject) {
        let uName = userName.text;
        let uemail = userEmail.text;
        let id = String(arc4random());
        // Check for empty fields.
        if (uName!.isEmpty || uemail!.isEmpty) {
            displayAlertMessage(userMessage: "All fields are required");
            return;
        }
        // Email Address validation
        let isEmailAddressValid = isValidEmailAddress(emailAddressString: uemail!);
        if !isEmailAddressValid {
                displayAlertMessage(userMessage: "Email address is not valid")
            }
        
        let userBuilder = HelpshiftUserBuilder.init(identifier: id, andEmail: uemail);
        userBuilder?.name = uName;
        let user = userBuilder?.build();
        HelpshiftCore.login(user);
        self.loginlabel.text = "You are logged in as"
        
        
    }
    
    @IBAction func Back(_ sender: Any) {
    }
    
    @IBAction func logout(_ sender: Any) {
        self.loginlabel.text = "Please log in"
        userName.text = "";
        userEmail.text = "";
        HelpshiftCore.logout()
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    func displayAlertMessage(userMessage:String){
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil);
    }

}
