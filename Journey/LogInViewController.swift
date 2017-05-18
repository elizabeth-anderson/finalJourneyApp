//
//  LogInViewController.swift
//  Journey
//
//  Created by Victoria Anderson on 5/8/17.
//  Copyright © 2017 bhs. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController
{
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

       
    }

    @IBAction func logInButtonTapped(_ sender: Any)
    {
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail")
        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword")
        
        if(userEmailStored == userEmail)
        {
            if(userPasswordStored == userPassword)
            {
                //log in is successful
                
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                UserDefaults.standard.synchronize()
                self.dismiss(animated: true, completion: nil)
                //dismisses log in View Controller after logged in
                
                
                
            }
        }
        


}
}
