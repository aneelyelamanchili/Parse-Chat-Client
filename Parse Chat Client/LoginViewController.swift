//
//  LoginViewController.swift
//  Parse Chat Client
//
//  Created by Aneel Yelamanchili on 10/3/16.
//  Copyright © 2016 Aneel Yelamanchili. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signUp(_ sender: AnyObject) {
        
        var user = PFUser()
        user.username = email.text
        user.password = password.text
        
        user.signUpInBackground {
            (succeeded, error) -> Void in
            if let error = error as? NSError {
                
                let errorString = error.userInfo["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
                
                let alertController = UIAlertController(title: "Error!", message: errorString as String?, preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    //handle response
                }
                
                alertController.addAction(OKAction)
                
            } else {
                self.performSegue(withIdentifier: "loginSegue", sender: self)
            }
        }
        
    }
    
    @IBAction func login(_ sender: AnyObject) {
        
        PFUser.logInWithUsername(inBackground: email.text!, password: password.text!) {
            (user, error) -> Void in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: self)
            
                
                
            } else {
                //login failed do stuff
                let errorString = (error as? NSError)?.userInfo["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
                
                let alertController = UIAlertController(title: "Error!", message: errorString as String?, preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    //handle response
                }
                
                alertController.addAction(OKAction)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
