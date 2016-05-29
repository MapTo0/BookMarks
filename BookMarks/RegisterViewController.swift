//
//  RegisterViewController.swift
//  BookMarks
//
//  Created by Hristov, Martin R. on 5/29/16.
//  Copyright © 2016 Hristov, Martin R. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var registerBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerBtn.addTarget(self, action: #selector(RegisterViewController.registerUser), forControlEvents: UIControlEvents.TouchUpInside)

        // Do any additional setup after loading the view.
    }
    
    func registerUser () {
        let password = passField.text
        let email = emailField.text
        let myApp = FIRAuth(app: FIRApp.defaultApp()!)
        
        myApp!.createUserWithEmail(email!, password: password!, completion: { (user, error) in
            if let error = error {
                print("Sign in failed:", error.localizedDescription)
            } else {
                print ("Signed in with uid:", user!.uid)
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
