//
//  MyBooksNotLogged.swift
//  BookMarks
//
//  Created by Hristov, Martin R. on 6/12/16.
//  Copyright © 2016 Hristov, Martin R. All rights reserved.
//

import UIKit

class MyBooksNotLogged: UIView {
    
    override func layoutSubviews() {
        self.backgroundColor = UIColor.whiteColor()
        
        let title = UILabel()
        title.text = "Your bookshelf is empty."
        title.frame = CGRectMake(0, self.bounds.height * 0.3, self.bounds.width, 60)
        title.textAlignment = .Center
        title.font = UIFont.boldSystemFontOfSize(16.0)
        
        let description = UILabel()
        let descWidth = self.bounds.width * 0.8
        let fullWidth = self.bounds.width
        description.text = "BookMarks is a place where you can track what you have read, when and explored the newest books on the markket."
        description.frame = CGRectMake((fullWidth - descWidth) / 2, self.bounds.height * 0.4, descWidth, 160)
        description.textAlignment = .Center
        description.numberOfLines = 4
        
        let login = UILabel()
        login.text = "Please Login"
        login.frame = CGRectMake(0, self.bounds.height * 0.6, self.bounds.width, 60)
        login.textAlignment = .Center
        login.font = UIFont.boldSystemFontOfSize(16.0)
        
        
        self.addSubview(title)
        self.addSubview(description)
        self.addSubview(login)
    }

}
