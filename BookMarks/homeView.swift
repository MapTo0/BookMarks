//
//  homeView.swift
//  BookMarks
//
//  Created by Hristov, Martin R. on 6/5/16.
//  Copyright © 2016 Hristov, Martin R. All rights reserved.
//

import UIKit
import Firebase
import ImageSlideshow

class homeView: UIView {
    
    var firstName = ""
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        var viewColoer = UIColor(red: 246, green: 247, blue: 240, alpha: 1)
        self.backgroundColor = viewColoer
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let slider = ImageSlideshow()
        slider.setImageInputs([ImageSource(image: UIImage(named: "slide1")!), ImageSource(image: UIImage(named: "slide2")!), ImageSource(image: UIImage(named: "slide3")!), ImageSource(image: UIImage(named: "slide4")!), ImageSource(image: UIImage(named: "slide5")!)])
        slider.slideshowInterval = 3
        slider.contentScaleMode = UIViewContentMode.ScaleAspectFill
        slider.frame = CGRectMake(0, 64, screenSize.width, self.bounds.height * 0.5)
        
        let helloLable = UILabel()
        helloLable.frame = CGRectMake(50, self.bounds.height * 0.6 + 20, screenSize.width, 80)
        helloLable.font = helloLable.font.fontWithSize(36)
        
        let descriptionLable = UILabel()

        descriptionLable.frame = CGRectMake(50, self.bounds.height * 0.6 + 40, screenSize.width - 50, 180)
        descriptionLable.font = helloLable.font.fontWithSize(18)
        descriptionLable.lineBreakMode = .ByWordWrapping
        descriptionLable.numberOfLines = 0
        
        self.addSubview(slider)
        self.addSubview(helloLable)
        self.addSubview(descriptionLable)
        
        let firebaseUsers = FIRDatabase.database().reference().child("users")
        
        let myApp = FIRAuth(app: FIRApp.defaultApp()!)
        let user = myApp?.currentUser
        let userId = user?.uid
        let firstNameQuery = firebaseUsers.child(userId!).child("firstName")
        firstNameQuery.observeEventType(.Value) { (firstName) in
            helloLable.text = "Hi, " + (firstName.value as! String)
        }
        descriptionLable.text = "Read your favourite books, rate and share with friends"
        
    }
}
 