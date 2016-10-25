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

class ViewController: UIViewController
{

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
        
        let testStudent = Student(inName: "trash", inChair: 3, inInstrument: "potatoesalad")
        let testStudentView = StudentView(startPoint: CGPoint(x: 10, y: 10), inStudent: testStudent)
        self.view.addSubview(testStudentView)
        
        addCurveViewButton()
        addRectangleViewButton()
        
    }
    
    func addCurveViewButton()
    {
        let cvButton = UIButton(type: UIButtonType.system)
        cvButton.setTitle("Add CurveView", for: UIControlState())
        cvButton.setTitleColor(randomUIColor(), for: UIControlState())
        cvButton.backgroundColor = UIColor.white
        cvButton.frame = CGRect(UIScreen.main.bounds.width - 150, 50, 150, 50)
        cvButton.addTarget(self, action: #selector(self.openCVMenu(sender:)), for: .touchUpInside)
        //cvButton.restorationIdentifier = String(row - 1)
        self.view.addSubview(cvButton)
    }
    
    func addRectangleViewButton()
    {
        let rvButton = UIButton(type: UIButtonType.system)
        rvButton.setTitle("Add RectangleView", for: UIControlState())
        rvButton.setTitleColor(randomUIColor(), for: UIControlState())
        rvButton.backgroundColor = UIColor.white
        rvButton.frame = CGRect(UIScreen.main.bounds.width - 150, 100, 150, 50)
        rvButton.addTarget(self, action: #selector(self.addRectangleView), for: .touchUpInside)
        self.view.addSubview(rvButton)
    }
    
    func addRectangleView()
    {
        let rectangleView = RectangleView(startPoint: CGPoint(x: 50, y: 50), subviews: 1)
        self.view.addSubview(rectangleView)
    }
    func openCVMenu(sender: UIButton)
    {
        becomeFirstResponder()
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
        menu.setMenuVisible(true, animated: true)
    }
    
    func addCurveView(_ isLeft: Bool, _ numRows: CGFloat)
    {
        let newCurveView = CurveView(inRect: CGRect(0,0,400,400), isLeft: isLeft, rows: numRows)
        self.view.addSubview(newCurveView)
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


