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
        let testStudent = Student(inName: "Connor", inChair: 3, inInstrument: "potatoesalad")
        let testStudentView = StudentView(startPoint: CGPoint(x: 10, y: 10), inStudent: testStudent)
        self.view.addSubview(testStudentView)
        
        let rectangleView = RectangleView(startPoint: CGPoint(x: 50, y: 50))
        self.view.addSubview(rectangleView)
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


