//
//  FirstViewController.swift
//  BookMarks
//
//  Created by Hristov, Martin R. on 5/28/16.
//  Copyright © 2016 Hristov, Martin R. All rights reserved.
//

import UIKit
import Firebase

class FirstViewController: UIViewController {
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        let myApp = FIRAuth(app: FIRApp.defaultApp()!)
        let user = myApp?.currentUser
        self.navigationController?.tabBarController?.tabBar.tintColor = UIColor.brownColor()
        
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "tempHome")
        self.view.insertSubview(backgroundImage, atIndex: 0)
        
        let homeImage = UIImage(named: "home")
        let loginImage = UIImage(named: "login")
        
        if (user == nil) {
            self.navigationController!.navigationBar.topItem?.title = "BookMarks"
            self.navigationController?.tabBarItem.title = "Login"
            self.navigationController?.tabBarItem.image = homeImage
        } else {
            var testLable = UILabel()
            testLable.text = " wtf"
            testLable.frame = CGRect(x: 400, y: 400, width: 400, height: 400)
            self.view.addSubview(testLable)
            self.navigationController!.navigationBar.topItem?.title = "Home"
            self.navigationController?.tabBarItem.title = "Home"
            self.navigationController?.tabBarItem.image = homeImage
            self.navigationController?.navigationBar.backgroundColor = UIColor.brownColor()
            var home = HomeViewController()
            home.view = homeView()
            self.navigationController?.pushViewController(home, animated: false)
        }
    }
}

