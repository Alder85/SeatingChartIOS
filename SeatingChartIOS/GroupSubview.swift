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
}
