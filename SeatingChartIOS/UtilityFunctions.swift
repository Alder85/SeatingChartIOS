//
//  UtilityFunctions.swift
//  SeatingChartIOS
//
//  Created by DEAN, JOSHUA on 9/12/16.
//  Copyright © 2016 DEAN, JOSHUA. All rights reserved.
//

import Foundation
import UIKit

func isInRange(_ testVal: CGFloat, _ val1: CGFloat, _ val2: CGFloat) -> Bool
{
    return testVal > val1 && testVal < val2
}

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

extension CGSize
{
    init(_ width: CGFloat, _ height: CGFloat)
    {
        self.init(width: width, height: height)
    }
}
extension CGPoint
{
    init(_ x: CGFloat, _ y: CGFloat)
    {
        self.init(x: x, y: y)
    }
}

extension String {
    
    subscript (i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
        
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(start, offsetBy: r.upperBound - r.lowerBound)
        return self[Range(start ..< end)]
    }
}

/*
 Longer screen dimension, because height and width change when device is rotated
 */
func screenLength() -> CGFloat
{
    return max(UIScreen.main.bounds.height, UIScreen.main.bounds.width)
}

func screenWidth() -> CGFloat
{
    return min(UIScreen.main.bounds.height, UIScreen.main.bounds.width)
}

/**
 Flips a Boolean value
 - Note: Do not attempt to simplify, this is the scientifically proven most effective method
 - Parameters:
 - bool: The Boolean to be flipped
 - Returns: The flipped Boolean
 
 ![Visible Confusion](https://i.warosu.org/data/ck/thumb/0058/69/1412871056921s.jpg)
 */
func flipBoolean(_ bool: Bool) -> Bool
{
    var bool = bool
    let bool1 = bool;
    bool = false;
    var bool2 = bool;
    bool2 = bool1 == bool ? bool2 : bool1
    bool = !bool2
    return bool
}




