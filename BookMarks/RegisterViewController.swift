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

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var registerBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerBtn.addTarget(self, action: #selector(RegisterViewController.registerUser), forControlEvents: UIControlEvents.TouchUpInside)

        // Do any additional setup after loading the view.
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "tempHome")
        self.view.insertSubview(backgroundImage, atIndex: 0)
    }
    
    func registerUser () {
        let password = passField.text
        let email = emailField.text
        let firstName = firstNameField.text
        let lastName = lastNameField.text
        let myApp = FIRAuth(app: FIRApp.defaultApp()!)

        
        myApp!.createUserWithEmail(email!, password: password!, completion: { (user, error) in
            if let error = error {
                let alertController = UIAlertController()
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                    // We do nothing on wrong credentials
                }
                alertController.message = "Error: That password or email does not match pattern. Please try again"
                alertController.title = "Sign up failed"
                alertController.addAction(OKAction)
                self.presentViewController(alertController, animated: true) {}
                print("Sign up failed:", error.localizedDescription)
            } else {
                self.navigationController?.view = homeView()
                let firebaseUsers = FIRDatabase.database().reference().child("users")
                let userId = user!.uid
                self.tabBarItem.title = "Home"
                firebaseUsers.child(userId).child("firstName").setValue(firstName)
                firebaseUsers.child(userId).child("lastName").setValue(lastName)
                
                print ("Signed up with uid:", user!.uid)
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
