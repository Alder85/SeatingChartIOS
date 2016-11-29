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
    let SUBVIEW_SIZE: CGFloat = 50
    let BUTTON_SIZE: CGFloat = 20
    let CUSHION: CGFloat = 13
    var SUBVIEW_CUSHION: CGFloat
    {
        return CUSHION + SUBVIEW_SIZE + CUSHION
    }
    var BUTTON_CUSHION: CGFloat
    {
        return CUSHION + BUTTON_SIZE + CUSHION
    }
    var SUBVIEW_HALF_CUSHION: CGFloat
    {
        return CUSHION + SUBVIEW_SIZE
    }
    var BUTTON_HALF_CUSHION: CGFloat
    {
        return CUSHION + BUTTON_SIZE
    }
    var MIN_WIDTH: CGFloat
    {
        return BUTTON_CUSHION + (3 * SUBVIEW_HALF_CUSHION)
    }
    
    
    init(startPoint: CGPoint, subviews: Int)
    {
        super.init(rect: CGRect(0,0,0,0)) //optimize
        self.frame = CGRect(x: startPoint.x, y: startPoint.y, width: MIN_WIDTH, height: SUBVIEW_CUSHION)
        numberOfSubviews = subviews
        subviewArray.append([])
        
        for _ in stride(from: 0, to: numberOfSubviews, by: 1)
        {
            let temp = GroupSubview(inRect: CGRect(x: position + BUTTON_CUSHION, y: CUSHION, width: SUBVIEW_SIZE, height: SUBVIEW_SIZE))
            subviewArray[0].append(temp)
            self.addSubview(subviewArray[0][subviewArray[0].count - 1])
            position += SUBVIEW_HALF_CUSHION
        }
        
        
        
        updateViewSize()
        
        let addViewButton = UIButton(type: UIButtonType.system) //add views
        addViewButton.setTitle("+", for: UIControlState())
        addViewButton.setTitleColor(UIColor.blue, for: UIControlState())
        addViewButton.backgroundColor = UIColor.white
        addViewButton.frame = CGRect(x: CUSHION, y: CUSHION, width: BUTTON_SIZE, height: BUTTON_SIZE)
        addViewButton.addTarget(self, action: #selector(self.addView(_:)), for: .touchUpInside)
        self.addSubview(addViewButton)
        
        let removeViewButton = UIButton(type: UIButtonType.system) //add views
        removeViewButton.setTitle("-", for: UIControlState())
        removeViewButton.setTitleColor(UIColor.blue, for: UIControlState())
        removeViewButton.backgroundColor = UIColor.white
        removeViewButton.frame = CGRect(x: CUSHION, y: self.frame.height - BUTTON_HALF_CUSHION, width: BUTTON_SIZE, height: BUTTON_SIZE)
        removeViewButton.addTarget(self, action: #selector(self.removeView(_:)), for: .touchUpInside)
        self.addSubview(removeViewButton)
    }
    
    func updateViewSize()
    {
        self.frame.size.width = BUTTON_CUSHION + (SUBVIEW_HALF_CUSHION * CGFloat(numberOfSubviews))
        if self.frame.width < MIN_WIDTH
        {
            self.frame.size.width = MIN_WIDTH
        }
    }
    
    func addView(_ sender: AnyObject?)
    {
        let temp = GroupSubview(inRect: CGRect(x: position + BUTTON_CUSHION, y: CUSHION, width: SUBVIEW_SIZE, height: SUBVIEW_SIZE))
        subviewArray[0].append(temp)
        self.addSubview(temp)
        position += SUBVIEW_HALF_CUSHION
        numberOfSubviews += 1
        
        updateViewSize()
    }
    
    func removeView(_ sender: AnyObject?)
    {
        if subviewArray[0].count > 1
        {
            subviewArray[0][subviewArray[0].count - 1].removeFromSuperview()
            subviewArray[0].removeLast()
            position -= SUBVIEW_HALF_CUSHION
            numberOfSubviews -= 1
        }
        
        updateViewSize()
    }


    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
