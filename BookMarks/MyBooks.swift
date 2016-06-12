//
//  MyBooks.swift
//  BookMarks
//
//  Created by Hristov, Martin R. on 6/12/16.
//  Copyright © 2016 Hristov, Martin R. All rights reserved.
//

import UIKit

class MyBooks: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let lable = UILabel()
        lable.text = "test"
        
        lable.frame = CGRect(x: 20, y: 20, width: 20, height: 20)
        self.backgroundColor = UIColor.whiteColor()
        self.addSubview(lable)
    }

}
