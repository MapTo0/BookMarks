//
//  homeView.swift
//  BookMarks
//
//  Created by Hristov, Martin R. on 6/5/16.
//  Copyright © 2016 Hristov, Martin R. All rights reserved.
//

import UIKit

class homeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let welcomeLable = UILabel()
        self.backgroundColor = UIColor.whiteColor()
        welcomeLable.text = "Welcome to Bookmarks !"
        welcomeLable.textAlignment = NSTextAlignment.Center;
        print(self.bounds.width)
        welcomeLable.frame = CGRect(x: 0, y: 55, width: self.bounds.width, height: 44)
        self.addSubview(welcomeLable)
    }
}
