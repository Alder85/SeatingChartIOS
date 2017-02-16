//
//  GoogleNamePlate.swift
//  SeatingChartIOS
//
//  Created by DEAN, JOSHUA on 2/7/17.
//  Copyright © 2017 DEAN, JOSHUA. All rights reserved.
//

import Foundation
import UIKit
import GTMAppAuth
import GoogleAPIClient
import GoogleAPIClientForREST

class GoogleNamePlate: UIView
{
    let size = CGSize(width: 200, height: 100)
    
    var currentOffset = (x: CGFloat(0), y: CGFloat(0))
    
    init(origin: CGPoint)
    {
        super.init(frame: CGRect(origin: origin, size: size))
        backgroundColor = randomBrightUIColor()
        setCornerRadius(radius: 10)
        _ = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(draw(_:)), userInfo: nil, repeats: true)
    }
    
    override func draw(_ rect: CGRect) {
        subviews.forEach{ $0.removeFromSuperview() }
        super.draw(rect)
        if authorization != nil
        {
            let emailLabel = UILabel(frame: CGRect(10,5,300,50))
            emailLabel.text = "Email: " + (authorization?.userEmail)!
            emailLabel.textAlignment = .center
            addSubview(emailLabel)
            let logoutButton = UIButton(type: UIButtonType.system)
            logoutButton.setTitle("Logout", for: UIControlState())
            logoutButton.setTitleColor(randomBrightUIColor(), for: UIControlState())
            logoutButton.backgroundColor = randomDarkUIColor()
            logoutButton.frame = CGRect(50, 50, 100, 40)
            logoutButton.setCornerRadius(radius: 5)
            logoutButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
            addSubview(logoutButton)
            
        }
        else
        {
            let loginButton = UIButton(type: UIButtonType.system)
            loginButton.setTitle("Login to Google", for: UIControlState())
            loginButton.setTitleColor(randomBrightUIColor(), for: UIControlState())
            loginButton.backgroundColor = randomDarkUIColor()
            loginButton.frame = CGRect(10, 50, 180, 40)
            loginButton.setCornerRadius(radius: 5)
            loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
            addSubview(loginButton)

            let sadLabel = UILabel(frame: CGRect(0,10,200,30))
            sadLabel.text = "Not logged in"
            sadLabel.textAlignment = .center
            addSubview(sadLabel)
        }
    }
    
    func logout()
    {
        sheetsAPI.removeState()
    }
    
    func login()
    {
        (parentViewController as! MainMenuController).login()
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
            currentPoint.x -= currentOffset.x
            currentPoint.y -= currentOffset.y
            self.frame = CGRect(origin: currentPoint, size: self.frame.size)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            _ = touch.location(in: self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
