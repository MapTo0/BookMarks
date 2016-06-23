//
//  SearchDetailsViewController.swift
//  BookMarks
//
//  Created by Hristov, Martin R. on 6/6/16.
//  Copyright © 2016 Hristov, Martin R. All rights reserved.
//

import UIKit
import Firebase
import Cosmos

class SearchDetailsViewController: UIViewController {
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let TitleLable = UILabel()

    var book = Book()
    override func viewDidLoad() {
        super.viewDidLoad()
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        scrollView.scrollEnabled = true
        self.view.addSubview(scrollView)
        self.view.backgroundColor = UIColor.whiteColor()
        let logoHeight = (self.view.bounds.size.height - 128)/2
        let bookLogo = UIImageView()
        let author = UILabel()
        let hrLine = UIView()
        let readBtn = UIButton()
        let rateLbl = UILabel()
        let cosmosView = CosmosView()
        let fullHrLine = UIView()
        let descTitle = UILabel()
        let description = UITextView()

        
        bookLogo.image = UIImage(data: book.imgData)
        bookLogo.contentMode = UIViewContentMode.ScaleAspectFit
        bookLogo.frame = CGRect(x: 0, y: 20, width: self.view.bounds.size.width, height: logoHeight)
        TitleLable.frame = CGRect(x: 0, y: logoHeight + 30, width: self.view.bounds.size.width, height: 44)
        author.frame = CGRect(x: 0, y: logoHeight + 64, width: self.view.bounds.size.width, height: 28)
        
        TitleLable.text = book.name
        TitleLable.font = UIFont(name: TitleLable.font.fontName, size: 20)
        TitleLable.textAlignment = NSTextAlignment.Center

        author.text = "by " + book.author
        author.font = UIFont(name: author.font.fontName, size: 12)
        author.textAlignment = NSTextAlignment.Center
        
        hrLine.layer.borderWidth = 1.0
        hrLine.layer.borderColor = UIColor.blackColor().CGColor
        hrLine.frame = CGRect(x: 10, y: logoHeight + 100, width: self.view.bounds.size.width - 20, height: 1)
       
        readBtn.frame = CGRect(x: (self.view.bounds.size.width - 180)/2 , y: logoHeight + 120, width: 180, height: 38)
        readBtn.backgroundColor = UIColor.blackColor()
        readBtn.setTitle("Want to Read", forState: UIControlState.Normal)
        readBtn.addTarget(self, action: #selector(SearchDetailsViewController.addToRead), forControlEvents: UIControlEvents.TouchUpInside)
        
        rateLbl.frame = CGRect(x: 0 , y: logoHeight + 160, width: self.view.bounds.size.width, height: 38)
        rateLbl.text = "Rate this book:"
        rateLbl.textAlignment = NSTextAlignment.Center
        rateLbl.font = UIFont(name: author.font.fontName, size: 10)
        
        cosmosView.settings.starSize = 30
        cosmosView.frame = CGRect(x: (self.view.bounds.size.width/2)-85, y: logoHeight + 200, width: 0, height: 0)
        
        fullHrLine.layer.borderWidth = 1.0
        fullHrLine.layer.borderColor = UIColor.blackColor().CGColor
        fullHrLine.frame = CGRect(x: 0, y: logoHeight + 250, width: self.view.bounds.size.width, height: 1)
        
        descTitle.text = "Book Description"
        descTitle.font = UIFont(name: author.font.fontName, size: 16)
        descTitle.textAlignment = NSTextAlignment.Center
        descTitle.frame = CGRect(x: 0, y: logoHeight + 270, width: self.view.bounds.size.width, height: 20)
        
        description.text = book.bookDescription
        description.font = UIFont(name: author.font.fontName, size: 12)
        description.frame = CGRect(x: 0, y: logoHeight + 270, width: self.view.bounds.size.width, height: description.contentSize.height)
        scrollView.contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height + description.contentSize.height - 64)
        description.frame = CGRect(x: 0, y: logoHeight + 290, width: self.view.bounds.size.width, height: description.contentSize.height)

        print(description.contentSize.height)
        scrollView.addSubview(bookLogo)
        scrollView.addSubview(TitleLable)
        scrollView.addSubview(author)
        scrollView.addSubview(hrLine)
        scrollView.addSubview(readBtn)
        scrollView.addSubview(rateLbl)
        scrollView.addSubview(cosmosView)
        scrollView.addSubview(fullHrLine)
        scrollView.addSubview(descTitle)
        scrollView.addSubview(description)
    }
    
    func addToRead () {
        let myApp = FIRAuth(app: FIRApp.defaultApp()!)
        let user = myApp?.currentUser   
        if (user == nil) {
            print("no user")
        } else {
            let date = NSDate()
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = .MediumStyle
            let dateString = dateFormatter.stringFromDate(date)
            appDelegate.firebaseUsers.child((user?.uid)!).child("books").updateChildValues([dateString: TitleLable.text!])
            appDelegate.userBooks.setValue(dateString, forKey: TitleLable.text!)
        }
        
    }
}