//
//  ViewController.swift
//  SeatingChartIOS
//
//  Created by DEAN, JOSHUA on 9/8/16.
//  Copyright © 2016 DEAN, JOSHUA. All rights reserved.
// CONNOR DID THIS 
// SAVE ME
// 'SHOW BLAME' LIES

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate
{
    var vButton = UIButton()
    let popoverContentController = UIViewController()
    override func viewDidLoad()
    {
        super.viewDidLoad()

        let testStudent = Student(inName: "trash", inChair: 3, inInstrument: "potatoesalad")
        let testStudentView = StudentView(startPoint: CGPoint(x: 10, y: 10), inStudent: testStudent)
        self.view.addSubview(testStudentView)
        addViewButton()
        
    }
    func addViewButton()
    {
        vButton = UIButton(type: UIButtonType.system)
        vButton.setTitle("Add View", for: UIControlState())
        vButton.setTitleColor(randomBrightUIColor(), for: UIControlState())
        vButton.backgroundColor = randomDarkUIColor()
        vButton.frame = CGRect(screenLength() - 150, 50, 100, 50)
        vButton.addTarget(self, action: #selector(self.presentPopover), for: .touchUpInside)
        self.view.addSubview(vButton)
        self.view.sendSubview(toBack: vButton)
    }
    
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        popoverPresentationController.permittedArrowDirections = .any
        let alignView = UIView(frame: CGRect(vButton.frame.midX, vButton.frame.maxY, 0, 0))
        self.view.addSubview(alignView)
        popoverPresentationController.sourceView = alignView
    }
    
    func presentPopover()
    {
        popoverContentController.view.backgroundColor = randomBrightUIColor()
        popoverContentController.preferredContentSize = CGSize(width: 300, height: 300)
        popoverContentController.modalPresentationStyle = UIModalPresentationStyle.popover
        popoverContentController.popoverPresentationController!.delegate = self
        
        buttonLoop: for x in 0...3
        {
            let potatoe = 10 + (60 * x)
            popoverContentController.view.addSubview(CVButton(isLeft: true, rows: x + 2, point: CGPoint(10, CGFloat(potatoe))))
            popoverContentController.view.addSubview(CVButton(isLeft: false, rows: x + 2, point: CGPoint(155, CGFloat(potatoe))))
        }
        popoverContentController.view.addSubview(rectangleViewButton())

        self.present(popoverContentController, animated: true, completion: nil)
    }
    
    func rectangleViewButton() -> UIButton
    {
        let rvButton = UIButton(type: UIButtonType.system)
        rvButton.setTitle("Add RectangleView", for: UIControlState())
        rvButton.setTitleColor(randomBrightUIColor(), for: UIControlState())
        rvButton.backgroundColor = randomDarkUIColor()
        rvButton.frame = CGRect(10, 250, 280, 40)
        rvButton.addTarget(self, action: #selector(self.addRectangleView), for: .touchUpInside)
        return rvButton
    }
    
    func CVButton(isLeft: Bool, rows: Int, point: CGPoint) -> UIButton
    {
        let cvButton = UIButton(type: UIButtonType.system)
        if(isLeft)
        {
            cvButton.setTitle("Left " + String(rows), for: UIControlState())
        }
        else
        {
            cvButton.setTitle("Right " + String(rows), for: UIControlState())
        }
        cvButton.setTitleColor(randomBrightUIColor(), for: UIControlState())
        cvButton.backgroundColor = randomDarkUIColor()
        cvButton.frame = CGRect(point.x, point.y, 135, 50)
        cvButton.restorationIdentifier = String(rows)
        cvButton.addTarget(self, action: #selector(self.addCurveView(_:)), for: .touchUpInside)
        return(cvButton)
    }

    func addCurveView(_ sender: UIButton)
    {
        if(sender.titleLabel?.text?[0] == "R")
        {
            addCurveView(false, CGFloat(Int(sender.restorationIdentifier!)!))
        }
        else if(sender.titleLabel?.text?[0] == "L")
        {
            addCurveView(true, CGFloat(Int(sender.restorationIdentifier!)!))
        }
        popoverContentController.dismiss(animated: true, completion: nil)
    }
    
    func addCurveView(_ isLeft: Bool, _ numRows: CGFloat)
    {
        let newCurveView = CurveView(inRect: CGRect(0,0,400,400), isLeft: isLeft, rows: numRows)
        self.view.addSubview(newCurveView)
        self.view.sendSubview(toBack: newCurveView)
    }
    
    func addRectangleView()
    {
        let rectangleView = RectangleView(startPoint: CGPoint(x: 50, y: 50), subviews: 1)
        self.view.addSubview(rectangleView)
        self.view.sendSubview(toBack: rectangleView)
    }
    
    
    override var canBecomeFirstResponder : Bool {
        return true
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


