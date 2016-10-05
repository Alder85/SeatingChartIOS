//
//  CurveView.swift
//  SeatingChartIOS
//
//  Created by DEAN, JOSHUA on 9/26/16.
//  Copyright © 2016 DEAN, JOSHUA. All rights reserved.
//

import Foundation
import UIKit

class CurveView: GroupView
{
    var numRows: CGFloat
    var buttonArray: [UIButton] = []
    var leftRect = false
    let BUTTON_SIZE: CGFloat = 20
    let SUBVIEW_SIZE: CGFloat = 50
    
    init(inRect: CGRect, isLeft: Bool, rows: CGFloat)
    {
        leftRect = isLeft
        numRows = rows
        super.init(rect: inRect)
        makeButtons()
        
        
        for i in 0...(Int(rows - 1))
        {
            subviewArray.insert([], at: i)
            for q in 0...4
            {
                let temp = GroupSubview(inRect: CGRect(x: CGFloat(arc4random_uniform(UInt32(self.frame.height))), y: CGFloat(arc4random_uniform(UInt32(self.frame.height))), width: 50, height: 50))
                subviewArray[i].insert(temp, at: q)
            }
        }
        
        
        updateSubviewCurves()
        self.setNeedsDisplay(self.frame) //makes context exist
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeButtons()
    {
        if !leftRect
        {
            for i in 1...Int(numRows)
            {
                let y = ((self.frame.size.width - SUBVIEW_SIZE) / numRows) * CGFloat(i)
                makeAddButton(CGPoint(x: y - 47, y: self.frame.height - 22), row: i)
                makeSubtractButton(CGPoint(x: y - 25, y: self.frame.height - 22), row: i)
            }
        }
        else
        {
            for i in 1...Int(numRows)
            {
                let y = ((self.frame.size.width - SUBVIEW_SIZE) / numRows) * (numRows - CGFloat(i))
                makeAddButton(CGPoint(x: y + 69, y: self.frame.height - 22), row: i)
                makeSubtractButton(CGPoint(x: y + 91, y: self.frame.height - 22), row: i) //height above bot
            }
        }
    }
    
    
    func makeAddButton(_ point: CGPoint, row: Int)
    {
        //let button = UIButton(frame: CGRect(origin: point, size: CGSize(width: buttonSize, height: buttonSize))) //add views
        let button = UIButton(type: UIButtonType.system)
        button.setTitle("+", for: UIControlState())
        button.setTitleColor(randomUIColor(), for: UIControlState())
        button.backgroundColor = UIColor.white
        button.frame = CGRect(point.x, point.y, BUTTON_SIZE, BUTTON_SIZE)
        button.addTarget(self, action: #selector(self.addView(_:)), for: .touchUpInside)
        button.restorationIdentifier = String(row - 1)
        self.addSubview(button)
        buttonArray.append(button)
    }
    
    func makeSubtractButton(_ point: CGPoint, row: Int)
    {
        let button = UIButton(type: UIButtonType.system)
        button.setTitle("-", for: UIControlState())
        button.setTitleColor(randomUIColor(), for: UIControlState())
        button.backgroundColor = UIColor.white
        button.frame = CGRect(point.x, point.y, BUTTON_SIZE, BUTTON_SIZE)
        button.addTarget(self, action: #selector(self.removeView(_:)), for: .touchUpInside)
        button.restorationIdentifier = String(row - 1)
        self.addSubview(button)
        buttonArray.append(button)
    }
    
    func addView(_ obj: UIButton)
    {
        Swift.print(obj.restorationIdentifier)
        //addViewInt(Int(obj.identifier!)!)
        let rowNumber = Int(obj.restorationIdentifier!)!
        let temp = GroupSubview(inRect: CGRect(x: 100, y: 100, width: 50, height: 50))
        subviewArray[rowNumber].insert(temp, at: subviewArray[rowNumber].count)
        
        updateSubviewCurves()
        //moveAllViewsWithGroup()
        
    }
    
    func removeView(_ obj: UIButton)
    {
        Swift.print(obj.restorationIdentifier)
        let rowNumber = Int(obj.restorationIdentifier!)!
        if(subviewArray[rowNumber].count > 0)
        {
            subviewArray[rowNumber][subviewArray[rowNumber].count - 1].removeFromSuperview()
            subviewArray[rowNumber].remove(at: subviewArray[rowNumber].count - 1)
        }
        updateSubviewCurves()
       // moveAllViewsWithGroup()
    }
    
    func updateSubviewCurves()
    {
        for i in 1...Int(numRows)
        {
            let startSpot = ((self.frame.size.width - SUBVIEW_SIZE) / numRows) * CGFloat(i)
            if !leftRect
            {
                makeRightSubviewCurve(startSpot, curveNumber: (i-1))
            }
            else
            {
                makeLeftSubviewCurve(startSpot, curveNumber: (i-1))
            }
        }
    }
    
    func makeRightSubviewCurve(_ startSpot: CGFloat, curveNumber: Int)
    {
        let numSubviews = subviewArray[curveNumber].count
        if numSubviews <= 0
        {
            return
        }
        if numSubviews == 1
        {
            let tempDegree = round( CGFloat(Double(startSpot) * sin(M_PI / 4)) )
            subviewArray[curveNumber][0].frame = CGRect(x: tempDegree, y: self.frame.height - tempDegree - SUBVIEW_SIZE, width: SUBVIEW_SIZE, height: SUBVIEW_SIZE)
            self.addSubview(subviewArray[curveNumber][0])
            return
        }
        for i in 0...numSubviews - 1
        {
            let t = ((M_PI / 2) / Double(numSubviews - 1)) * Double(i)
            let tempX = round( CGFloat(Double(startSpot) * cos(t)) )
            let tempY = round( CGFloat(Double(startSpot) * sin(t)) )
            
            subviewArray[curveNumber][i].frame = CGRect(x: tempX, y: self.frame.height - SUBVIEW_SIZE - tempY, width: SUBVIEW_SIZE, height: SUBVIEW_SIZE)
            
            self.addSubview(subviewArray[curveNumber][i])
        }
        
    }
    
    func makeLeftSubviewCurve(_ startSpot: CGFloat, curveNumber: Int)
    {
        let numSubviews = subviewArray[curveNumber].count
        if numSubviews <= 0
        {
            return
        }
        if numSubviews == 1
        {
            let tempDegree = round( CGFloat(Double(startSpot) * sin(M_PI / 4)) )
            subviewArray[curveNumber][0].frame = CGRect(x: tempDegree, y: tempDegree, width: SUBVIEW_SIZE, height: SUBVIEW_SIZE)
            self.addSubview(subviewArray[curveNumber][0])
            return
        }
        for i in 0...numSubviews - 1
        {
            let t = ((M_PI / 2) / Double(numSubviews - 1)) * Double(i)
            //let tempX = self.frame.maxX - (round( CGFloat(Double(startSpot) * cos(t)) ) + 50)
            let tempX = self.frame.width - round( CGFloat(Double(startSpot) * cos(t)) ) - SUBVIEW_SIZE
            let tempY = round( CGFloat(Double(startSpot) * sin(t)) )
            
            subviewArray[curveNumber][i].frame = CGRect(x: tempX, y: self.frame.height - SUBVIEW_SIZE - tempY, width: 50, height: 50)
            
            self.addSubview(subviewArray[curveNumber][i])
        }
        
    }

    
}
