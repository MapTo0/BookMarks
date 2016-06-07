//
//  SearchDetailsViewController.swift
//  BookMarks
//
//  Created by Hristov, Martin R. on 6/6/16.
//  Copyright © 2016 Hristov, Martin R. All rights reserved.
//

import UIKit
import Firebase

class SearchDetailsViewController: UIViewController {

    var book = Book()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        let logoHeight = (self.view.bounds.size.height - 128)/2
        let bookLogo = UIImageView()
        let title = UILabel()
        let author = UILabel()
        let hrLine = UIView()
        let readBtn = UIButton()
        let rateLbl = UILabel()

        
        bookLogo.image = UIImage(data: book.imgData)
        bookLogo.contentMode = UIViewContentMode.ScaleAspectFit
        bookLogo.frame = CGRect(x: 0, y: 84, width: self.view.bounds.size.width, height: logoHeight)
        title.frame = CGRect(x: 0, y: logoHeight + 84, width: self.view.bounds.size.width, height: 44)
        author.frame = CGRect(x: 0, y: logoHeight + 124, width: self.view.bounds.size.width, height: 28)
        
        title.text = book.name
        title.font = UIFont(name: title.font.fontName, size: 20)
        title.textAlignment = NSTextAlignment.Center

        author.text = "by " + book.author
        author.font = UIFont(name: author.font.fontName, size: 12)
        author.textAlignment = NSTextAlignment.Center
        
        hrLine.layer.borderWidth = 1.0
        hrLine.layer.borderColor = UIColor.blackColor().CGColor
        hrLine.frame = CGRect(x: 10, y: logoHeight + 160, width: self.view.bounds.size.width - 20, height: 1)
       
        readBtn.frame = CGRect(x: (self.view.bounds.size.width - 180)/2 , y: logoHeight + 180, width: 180, height: 38)
        readBtn.backgroundColor = UIColor.blackColor()
        readBtn.setTitle("Want to Read", forState: UIControlState.Normal)
        
        rateLbl.frame = CGRect(x: 0 , y: logoHeight + 220, width: self.view.bounds.size.width, height: 38)
        rateLbl.text = "Rate this book:"
        rateLbl.textAlignment = NSTextAlignment.Center
        rateLbl.font = UIFont(name: author.font.fontName, size: 10)

        self.view.addSubview(bookLogo)
        self.view.addSubview(title)
        self.view.addSubview(author)
        self.view.addSubview(hrLine)
        self.view.addSubview(readBtn)
        self.view.addSubview(rateLbl)
    }
}