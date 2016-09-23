//
//  RectangleView.swift
//  SeatingChartIOS
//
//  Created by DEAN, JOSHUA on 9/14/16.
//  Copyright © 2016 DEAN, JOSHUA. All rights reserved.
//

import Foundation
import UIKit

class RectangleView: GroupView
{
    
    var numberOfSubviews: Int = 1
    var position: CGFloat = 0
    
    
    init(startPoint: CGPoint)
    {
        let rect = CGRect(x: startPoint.x, y: startPoint.y, width: 200, height: 100)
        super.init(rect: rect)

        let addViewButton = UIButton(type: UIButtonType.system) //add views
        addViewButton.setTitle("+", for: UIControlState())
        addViewButton.setTitleColor(UIColor.blue, for: UIControlState())
        addViewButton.backgroundColor = UIColor.white
        addViewButton.frame = CGRect(x: 35, y: 70, width: 20, height: 20)
        
        
        //addViewButton.addTarget(self, action: #selector(myClass.pressed(_:)), forControlEvents: .TouchUpInside)
        self.addSubview(addViewButton)
        
        let removeViewButton = UIButton(type: UIButtonType.system) //add views
        removeViewButton.setTitle("-", for: UIControlState())
        removeViewButton.setTitleColor(UIColor.blue, for: UIControlState())
        removeViewButton.backgroundColor = UIColor.white
        removeViewButton.frame = CGRect(x: 10, y: 70, width: 20, height: 20)
        //addViewButton.addTarget(self, action: #selector(myClass.pressed(_:)), forControlEvents: .TouchUpInside)
        self.addSubview(removeViewButton)
    }
    
    func addView(_ sender: AnyObject?)
    {
        let temp = GroupSubview(inRect: CGRect(x: position, y: (self.frame.height / 2) - 25, width: 50, height: 50))
        subviewArray[0].append(temp)
        self.addSubview(temp)
        position = position + 60
        numberOfSubviews += 1
    }


    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
