//
//  MyGraf.swift
//  OftenWorld
//
//  Created by Nazar on 12.02.17.
//  Copyright © 2017 Nazar. All rights reserved.
//

import UIKit

class MyGraf: UIImageView {


    override func draw(_ rect: CGRect) {
        UIColor.cyan.set()
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 200, y: 100))
        path.addLine(to: CGPoint(x: 100, y: 200))
        path.close()
        path.lineWidth = 8.0
       // #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1).set()
        path.stroke()
    
    }

}
