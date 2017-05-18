//
//  RegisterPageViewController.swift
//  Journey
//
//  Created by Victoria Anderson on 5/8/17.
//  Copyright © 2017 bhs. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController
{

    
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
      
    }
    

    @IBAction func registerButtonTapped(_ sender: Any)
    {
        let userEmail = userEmailTextField.text ;
        let userPassword = userPasswordTextField.text;
        let userRepeatPassword = repeatPasswordTextField.text;
        
        //check for empty fields
        
        func displayMyAlertMessage(userMessage: String)
        {
            var myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.alert);
            
            let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil);
            
            myAlert.addAction(okAction);
            
            self.presentedViewController;[myAlert, dismiss(animated: true, completion:nil)] as [Any];
            
        }
        
        
        if(userEmail!.isEmpty || (userPassword?.isEmpty)! || (userRepeatPassword?.isEmpty)!)
        {
            //display alert message
            displayMyAlertMessage(userMessage: "All fields are required");
            return;
        }
        
        //check if passwords match
        
        
        if(userPassword != userRepeatPassword)
            
        {
            //display an alert message
            displayMyAlertMessage(userMessage: "Passwords do not match");
            return;
        }
        
        
        // store data
        
        UserDefaults.standard.set(userEmail, forKey: "user email");
        UserDefaults.standard.set(userPassword, forKey: "user password");
        UserDefaults.standard.synchronize();
        
        
        //display alert message with confirmation
        
        var myAlert = UIAlertController(title:"Alert", message: "registration is successfull", preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default)
        {
            action in
            self.dismiss(animated: true, completion: nil);
        }
        
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil);
        
    }
    
    
    
    
    
    
    




}
