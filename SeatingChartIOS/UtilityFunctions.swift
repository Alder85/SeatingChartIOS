//
//  UtilityFunctions.swift
//  SeatingChartIOS
//
//  Created by DEAN, JOSHUA on 9/12/16.
//  Copyright © 2016 DEAN, JOSHUA. All rights reserved.
//

import Foundation
import UIKit

func randomUIColor() -> UIColor
{
    let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
    let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
    let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
    
    return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
}

func randomBrightUIColor() -> UIColor
{
    let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
    let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.1 // from 0.1 to 1.0 to maximize whiteness
    let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.7 // 0.7 to 1.0 to distance from black
    
    return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
}

func randomDarkUIColor() -> UIColor
{
    let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
    let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.7 // from 0.7 to 1.0 to distance from brightness
    let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.1 // from 0.1 to 1.0 to increase darkness
    
    return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
}

extension CGRect
{
    init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat)
    {
        self.init(x: x, y: y, width: width, height: height)
    }
}
