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
    
    
    init(startPoint: CGPoint, subviews: Int)
    {
        let rect = CGRect(x: startPoint.x, y: startPoint.y, width: 200, height: 100)
        super.init(rect: rect)
        numberOfSubviews = subviews
        subviewArray.append([])
        
        for _ in stride(from: 0, to: numberOfSubviews, by: 1)
        {
            let temp = GroupSubview(inRect: CGRect(x: position, y: (self.frame.height / 2) - 25, width: 50, height: 50))
            subviewArray[0].append(temp)
            self.addSubview(subviewArray[0][subviewArray[0].count - 1])
            position += 60
        }

        let addViewButton = UIButton(type: UIButtonType.system) //add views
        addViewButton.setTitle("+", for: UIControlState())
        addViewButton.setTitleColor(UIColor.blue, for: UIControlState())
        addViewButton.backgroundColor = UIColor.white
        addViewButton.frame = CGRect(x: 35, y: 70, width: 20, height: 20)
        addViewButton.addTarget(self, action: #selector(self.addView(_:)), for: .touchUpInside)
        self.addSubview(addViewButton)
        
        let removeViewButton = UIButton(type: UIButtonType.system) //add views
        removeViewButton.setTitle("-", for: UIControlState())
        removeViewButton.setTitleColor(UIColor.blue, for: UIControlState())
        removeViewButton.backgroundColor = UIColor.white
        removeViewButton.frame = CGRect(x: 10, y: 70, width: 20, height: 20)
        removeViewButton.addTarget(self, action: #selector(self.removeView(_:)), for: .touchUpInside)
        self.addSubview(removeViewButton)
    }
    
    func addView(_ sender: AnyObject?)
    {
        let temp = GroupSubview(inRect: CGRect(x: position, y: (self.frame.height / 2) - 25, width: 50, height: 50))
        subviewArray[0].append(temp)
        self.addSubview(temp)
        position += 60
        numberOfSubviews += 1
    }
    
    func removeView(_ sender: AnyObject?)
    {
        if subviewArray[0].count > 1
        {
            subviewArray[0][subviewArray[0].count - 1].removeFromSuperview()
            subviewArray[0].removeLast()
            position -= 60
            numberOfSubviews -= 1
        }
    }


    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
