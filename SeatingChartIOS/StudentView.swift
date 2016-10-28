//
//  StudentView.swift
//  SeatingChartIOS
//
//  Created by DEAN, JOSHUA on 9/8/16.
//  Copyright © 2016 DEAN, JOSHUA. All rights reserved.
//

import Foundation
import UIKit

class StudentView: UIView {
    var frameSize = CGSize(width: 50.0, height: 50.0)
    var mainFrame: CGRect
    var currentOffset = (x: CGFloat(0), y: CGFloat(0))
    var thisStudent: Student
    
    
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(startPoint: CGPoint, inStudent: Student)
    {
        mainFrame = CGRect(origin: startPoint, size: frameSize)
        thisStudent = inStudent
        super.init(frame: mainFrame)
        self.frame = mainFrame //test if necessary
        self.setNeedsDisplay(self.frame) //is context necessary? test
        self.backgroundColor = randomUIColor()
        
        let label = UILabel(frame: CGRect(x: -20, y: 0, width: 200, height: 50))
        let stringData = NSAttributedString(string: thisStudent.getName(), attributes: [
            NSStrokeColorAttributeName : UIColor.lightGray,
            NSForegroundColorAttributeName : UIColor.black,
            NSStrokeWidthAttributeName : NSNumber(value: -4.0 as Float),
            NSFontAttributeName : UIFont.systemFont(ofSize: 30.0)
            ])
        label.attributedText = stringData//thisStudent.getName()
        self.addSubview(label)

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(StudentView.tapped(_:)))
        self.addGestureRecognizer(tapGestureRecognizer)
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(StudentView.longPressed(_:)))
        self.addGestureRecognizer(longPressRecognizer)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.location(in: self)
            currentOffset.x = currentPoint.x
            currentOffset.y = currentPoint.y
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            var currentPoint = touch.location(in: self.superview)
            //Swift.print("Current Point = ", currentPoint ,"CurrentOffset = ", currentOffset)
            currentPoint.x -= currentOffset.x
            currentPoint.y -= currentOffset.y
            self.frame = CGRect(origin: currentPoint, size: frameSize)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            _ = touch.location(in: self)
        }
    }
    
    
    
    func tapped(_ sender: UITapGestureRecognizer)
    {
        openMenu()
        Swift.print(superViewGroupViews())
    }
    
    func longPressed(_ sender: UILongPressGestureRecognizer)
    {
    }

    
    /*
     MENU STUFF
     */
    func openMenu()
    {
        becomeFirstResponder()
        let menu = UIMenuController.shared
        
        let nameItem = UIMenuItem(title: thisStudent.getName(), action: #selector(StudentView.blankMenuItem))
        let deleteItem = UIMenuItem(title: "Terminate", action: #selector(StudentView.deleteSelf))
        
        menu.menuItems = [nameItem, deleteItem]
        
        menu.setTargetRect(CGRect(x: 0, y: 0, width: 50, height: 0), in: self)
        menu.setMenuVisible(true, animated: true)
    }
    
    override var canBecomeFirstResponder : Bool {
        return true
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool
    {
        if action == #selector(StudentView.deleteSelf) || action == #selector(StudentView.blankMenuItem)
        {
            return true
        }
        return false
    }
    func blankMenuItem()
    {
        //does nothing
    }
    func deleteSelf()
    {
        self.removeFromSuperview()
    }
    
    func superViewGroupViews() -> [GroupView]
    {
        var out: [GroupView] = []
        if self.superview?.subviews != nil
        {
            for i in 0...Int((self.superview?.subviews.count)!) - 1
            {
                self.superview?.subviews[i] is GroupView ? out.append(self.superview?.subviews[i] as! GroupView) : ()
            }
        }
        return out
    }
    
    

    
    
}
