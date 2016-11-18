//
//  GroupSubview.swift
//  SeatingChartIOS
//
//  Created by DEAN, JOSHUA on 9/14/16.
//  Copyright © 2016 DEAN, JOSHUA. All rights reserved.
//

import Foundation
import UIKit

class GroupSubview: UIView
{
    var stuV: StudentView?
    init(inRect: CGRect)
    {
        super.init(frame: inRect)
        self.frame = inRect
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        randomBrightUIColor().setFill()
        UIRectFill(rect)
    }
    
    func dragStudent()
    {
        if let frameTSSV = self.superview!.superview?.convert(self.frame, from: self.superview)
        {
            stuV?.frame = CGRect(origin: frameTSSV.origin, size: stuV!.frame.size)
        }
    }
 
    func setSVIfPossible(sv: StudentView)
    {
        let frameTSSV = (self.superview!.superview?.convert(self.frame, from: self.superview))! as CGRect
        if isInRange(sv.frame.midX, frameTSSV.minX, frameTSSV.maxX) &&
           isInRange(sv.frame.midY, frameTSSV.minY, frameTSSV.maxY)
        {
            if let _ = self.stuV {} // look into fixing ugly code
            else
            {
                stuV = sv
            }
            stuV?.frame = CGRect(origin: frameTSSV.origin, size: stuV!.frame.size)

        }
        else
        {
            stuV = nil
        }
    }
}
