//
//  LoginViewController.swift
//  BookMarks
//
//  Created by Hristov, Martin R. on 6/4/16.
//  Copyright © 2016 Hristov, Martin R. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginBtn.addTarget(self, action: #selector(LoginViewController.loginUser), forControlEvents: UIControlEvents.TouchUpInside)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginUser() {
        let password = passField.text
        let email = emailField.text
        let myApp = FIRAuth(app: FIRApp.defaultApp()!)
        myApp!.signInWithEmail(email!, password: password!, completion: { (user, error) in
            if let error = error {
                let alertController = UIAlertController()
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                    print("some action")
                }
                alertController.message = "Error: That password does not match you email address"
                alertController.title = "Sign in failed"
                alertController.addAction(OKAction)
                self.presentViewController(alertController, animated: true) {}
                print("Sign in failed:", error.localizedDescription)
            } else {
                self.navigationController?.view = homeView()
                print ("Signed in with uid:", user!.uid)
            }
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
