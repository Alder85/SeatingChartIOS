//
//  MainMenuController.swift
//  SeatingChartIOS
//
//  Created by DEAN, JOSHUA on 1/27/17.
//  Copyright © 2017 DEAN, JOSHUA. All rights reserved.
//

import Foundation
import UIKit

class MainMenuController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad()
    {
        currentFile = fileList[0]
    }
    
    //Data Sources
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fileList.count
    }
    
    //Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        
        return fileList[row].name
    }
    
    //On Selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        currentFile = fileList[row]
    }
    //Display Rainbow
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel = view as! UILabel!
        if view == nil
        {
            pickerLabel = UILabel()
            let hue = CGFloat(row)/CGFloat(fileList.count)
            pickerLabel?.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        }
        let titleData = fileList[row].name
        let myTitle = NSAttributedString(string: titleData!, attributes: [NSFontAttributeName:UIFont(name: "Arial", size: 16.0)!,NSForegroundColorAttributeName:UIColor.black])
        pickerLabel!.attributedText = myTitle
        pickerLabel!.textAlignment = .center
        return pickerLabel!
        
    }

}
