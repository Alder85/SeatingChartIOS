//
//  GroupView.swift
//  SeatingChartIOS
//
//  Created by DEAN, JOSHUA on 9/13/16.
//  Copyright © 2016 DEAN, JOSHUA. All rights reserved.
//

import Foundation
import UIKit

class GroupView: UIView
{
    var frameSize = CGSize(width: 200.0, height: 200.0)
    var mainFrame: CGRect
    var currentOffset = (x: CGFloat(0), y: CGFloat(0))
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(startPoint: CGPoint)
    {
        mainFrame = CGRect(origin: startPoint, size: frameSize)
        super.init(frame: mainFrame)
        self.frame = mainFrame //test if necessary
        self.setNeedsDisplayInRect(self.frame) //is context necessary? test
        self.backgroundColor = randomUIColor()
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(GroupView.tapped(_:)))
        self.addGestureRecognizer(tapGestureRecognizer)
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(GroupView.longPressed(_:)))
        self.addGestureRecognizer(longPressRecognizer)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.locationInView(self)
            currentOffset.x = currentPoint.x
            currentOffset.y = currentPoint.y
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            var currentPoint = touch.locationInView(self.superview)
            //Swift.print("Current Point = ", currentPoint ,"CurrentOffset = ", currentOffset)
            currentPoint.x -= currentOffset.x
            currentPoint.y -= currentOffset.y
            self.frame = CGRect(origin: currentPoint, size: frameSize)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            _ = touch.locationInView(self)
        }
    }

    func tapped(sender: UITapGestureRecognizer)
    {
        openMenu()
    }
    
    func longPressed(sender: UILongPressGestureRecognizer)
    {
        
    }
    
    /*
     MENU STUFF
     */
    func openMenu()
    {
        becomeFirstResponder()
        let menu = UIMenuController.sharedMenuController()

        let deleteItem = UIMenuItem(title: "Terminate", action: #selector(GroupView.deleteSelf))
        
        menu.menuItems = [deleteItem]
        
        menu.setTargetRect(CGRectMake(0, 0, 50, 0), inView: self)
        menu.setMenuVisible(true, animated: true)
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool
    {
        return true
        /*
        if action == #selector(GroupView.deleteSelf) || action == #selector(StudentView.blankMenuItem)
        {
            return true
        }
        return false
         */
    }
    func blankMenuItem()
    {
        //does nothing
    }
    func deleteSelf()
    {
        self.removeFromSuperview()
    }


}