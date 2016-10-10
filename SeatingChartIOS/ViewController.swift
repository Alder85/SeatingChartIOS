//
//  ViewController.swift
//  SeatingChartIOS
//
//  Created by DEAN, JOSHUA on 9/8/16.
//  Copyright © 2016 DEAN, JOSHUA. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let rectangleView = RectangleView(startPoint: CGPoint(x: 50, y: 50), subviews: 1)
        self.view.addSubview(rectangleView)
        
        //let curveView = CurveView(inRect: CGRect(0,0,300,300), isLeft: true, rows: 2)
        //self.view.addSubview(curveView)
        
        let curveView1 = CurveView(inRect: CGRect(0,0,600,600), isLeft: false, rows: 6)
        self.view.addSubview(curveView1)
        
        
        let testStudent = Student(inName: "trash", inChair: 3, inInstrument: "potatoesalad")
        let testStudentView = StudentView(startPoint: CGPoint(x: 10, y: 10), inStudent: testStudent)
        self.view.addSubview(testStudentView)
        
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


