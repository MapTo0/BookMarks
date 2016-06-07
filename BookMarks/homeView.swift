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
        let imageView = UIImageView()
        imageView.animationImages = [] // todo add images
        
    }
}
 