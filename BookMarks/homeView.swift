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
        self.backgroundColor = UIColor.whiteColor()
        var lable = UILabel()
        lable.text = "wtf"
        lable.frame = CGRect(x: 60, y: 100, width: 50, height: 10)
        
        self.addSubview(lable)
        
        print ("home view")
    }
}
 