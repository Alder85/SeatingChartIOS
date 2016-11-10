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

    var rvButton = UIButton()
    var vButton = UIButton()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //let curveView = CurveView(inRect: CGRect(0,0,300,300), isLeft: true, rows: 2)
        //self.view.addSubview(curveView)
        /*
        let curveView1 = CurveView(inRect: CGRect(0,0,600,600), isLeft: false, rows: 6)
        self.view.addSubview(curveView1)
        */
        //self.supportedInterfaceOrientations
       // self.preferredInterfaceOrientationForPresentation
            let testStudent = Student(inName: "trash", inChair: 3, inInstrument: "potatoesalad")
            let testStudentView = StudentView(startPoint: CGPoint(x: 10, y: 10), inStudent: testStudent)
            self.view.addSubview(testStudentView)
        addViewButton()
        //addCurveViewButton()
       // addRectangleViewButton()
        
    }
    func addViewButton()
    {
        vButton = UIButton(type: UIButtonType.system)
        vButton.setTitle("Add View", for: UIControlState())
        vButton.setTitleColor(randomBrightUIColor(), for: UIControlState())
        vButton.backgroundColor = randomDarkUIColor()
        vButton.frame = CGRect(screenLength() - 150, 50, 100, 50)
        vButton.addTarget(self, action: #selector(self.presentPopover), for: .touchUpInside)
        //cvButton.restorationIdentifier = String(row - 1)
        self.view.addSubview(vButton)
        self.view.sendSubview(toBack: vButton)
    }
    
    
    func addCurveViewButton()
    {
        let cvButton = UIButton(type: UIButtonType.system)
        cvButton.setTitle("Add CurveView", for: UIControlState())
        cvButton.setTitleColor(randomUIColor(), for: UIControlState())
        cvButton.backgroundColor = UIColor.white
        cvButton.frame = CGRect(screenLength() - 150, 50, 150, 50)
        cvButton.addTarget(self, action: #selector(self.openCVMenu(sender:)), for: .touchUpInside)
        //cvButton.restorationIdentifier = String(row - 1)
        self.view.addSubview(cvButton)
        self.view.sendSubview(toBack: cvButton)
    }
    
    func addRectangleViewButton()
    {
        rvButton = UIButton(type: UIButtonType.system)
        rvButton.setTitle("Add RectangleView", for: UIControlState())
        rvButton.setTitleColor(randomUIColor(), for: UIControlState())
        rvButton.backgroundColor = UIColor.white
        rvButton.frame = CGRect(screenLength() - 150, 100, 150, 50)
        rvButton.addTarget(self, action: #selector(self.addRectangleView), for: .touchUpInside)
        self.view.addSubview(rvButton)
    }
    
    func addRectangleView()
    {
        let rectangleView = RectangleView(startPoint: CGPoint(x: 50, y: 50), subviews: 1)
        self.view.addSubview(rectangleView)
        self.view.sendSubview(toBack: rectangleView)
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
        let popoverContentController = UIViewController()
        popoverContentController.view.backgroundColor = randomBrightUIColor()
        popoverContentController.preferredContentSize = CGSize(width: 300, height: 300)
        popoverContentController.modalPresentationStyle = UIModalPresentationStyle.popover
        popoverContentController.popoverPresentationController!.delegate = self
        
        buttonLoop: for x in 0...2
        {
            let potatoe = 10 + (60 * x)
            popoverContentController.view.addSubview(CVButton(isLeft: true, rows: x + 2, point: CGPoint(10, CGFloat(potatoe))))
            popoverContentController.view.addSubview(CVButton(isLeft: false, rows: x + 2, point: CGPoint(155, CGFloat(potatoe))))
        }

        self.present(popoverContentController, animated: true, completion: nil)
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
    func openCVMenu(sender: UIButton)
    {
        presentPopover()

        /*
        let menu = UIMenuController.shared
        //let deleteItem = UIMenuItem(title: "Terminate", action: #selector(GroupView.deleteSelf))
        menu.menuItems = [UIMenuItem(title: "Right 2", action: #selector(self.addCurveViewr2)),
                          UIMenuItem(title: "Right 3", action:#selector(self.addCurveViewr3)),
                          UIMenuItem(title: "Right 4", action:#selector(self.addCurveViewr4)),
                          UIMenuItem(title: "Left 2", action:#selector(self.addCurveViewl2)),
                          UIMenuItem(title: "Left 3", action:#selector(self.addCurveViewl3)),
                          UIMenuItem(title: "Left 4", action:#selector(self.addCurveViewl4))]
       // menu.menuItems = [deleteItem]
        
        
        menu.setTargetRect(CGRect(x: 0, y: 0, width: 50, height: 0), in: sender)
        menu.setMenuVisible(true, animated: true)\
 */
        
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
    }
    
    func addCurveView(_ isLeft: Bool, _ numRows: CGFloat)
    {
        let newCurveView = CurveView(inRect: CGRect(0,0,400,400), isLeft: isLeft, rows: numRows)
        self.view.addSubview(newCurveView)
        self.view.sendSubview(toBack: newCurveView)
    }
    
    /*
     There's gotta be a better way to consolidate this cancer
     */
    func addCurveViewr2()
    {
        addCurveView(false, 2)
    }
    func addCurveViewr3()
    {
        addCurveView(false, 3)
    }
    func addCurveViewr4()
    {
        addCurveView(false, 4)
    }
    func addCurveViewl2()
    {
        addCurveView(true, 2)
    }
    func addCurveViewl3()
    {
        addCurveView(true, 3)
    }
    func addCurveViewl4()
    {
        addCurveView(true, 4)
    }
    
    
    override var canBecomeFirstResponder : Bool {
        return true
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool
    {
        if action == #selector(GroupView.deleteSelf) ||
            action == #selector(self.addCurveViewr2) ||
            action == #selector(self.addCurveViewr3) ||
            action == #selector(self.addCurveViewr4) ||
            action == #selector(self.addCurveViewl2) ||
            action == #selector(self.addCurveViewl3) ||
            action == #selector(self.addCurveViewl4)
        {
            return true
        }
        return false
        
    }


    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


