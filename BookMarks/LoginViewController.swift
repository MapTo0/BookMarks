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
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
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
        let homeImage = UIImage(named: "home")
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
                self.navigationController?.tabBarItem.image = homeImage
                self.navigationController!.navigationBar.topItem?.title = "Home"
                self.navigationController?.tabBarItem.title = "Home"
                self.appDelegate.fillCurrentUserBooks()
                self.navigationController?.view = homeView()
                print ("Signed in with uid:", user!.uid)
            }
        })
    }
}
