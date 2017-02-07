//
//  MainMenuController.swift
//  SeatingChartIOS
//
//  Created by DEAN, JOSHUA on 1/27/17.
//  Copyright © 2017 DEAN, JOSHUA. All rights reserved.
//

import Foundation
import UIKit
import GTMAppAuth
import GoogleAPIClient
import GoogleAPIClientForREST

class MainMenuController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
    @IBOutlet weak var pickerView: UIPickerView!
    let sheetsAPI = SheetsAPI()
    override func viewDidLoad()
    {
        pickerView.dataSource = self
        pickerView.delegate = self
        self.view.setNeedsDisplay()
        pickerView.setNeedsDisplay()
        _ = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(reloadPicker), userInfo: nil, repeats: true)
    }
    func reloadPicker()
    {
        pickerView.reloadAllComponents()
    }
    @IBAction func login(_ sender: Any)
    {
        sheetsAPI.auth(viewController: self)
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
            pickerLabel?.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness: 0.8, alpha: 1.0)
        }
        let titleData = fileList[row].name
        let myTitle = NSAttributedString(string: titleData!, attributes: [NSFontAttributeName:UIFont(name: "Arial", size: 16.0)!,NSForegroundColorAttributeName:UIColor.black])
        pickerLabel!.attributedText = myTitle
        pickerLabel!.textAlignment = .center
        return pickerLabel!
        
    }

}
