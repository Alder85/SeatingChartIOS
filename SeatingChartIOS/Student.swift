//
//  Student.swift
//  DriveSample
//
//  Created by DEAN, JOSHUA on 2/3/16.
//
//

import Foundation

class Student: NSObject, NSCoding
{
    fileprivate var informationArray: [String] = []
    fileprivate var name: String        = "invalid name"
    fileprivate var instrument: String  = "invalid instrument"
    fileprivate var chair: Int          = -42
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("Students")
    
    struct PropertyKey {
        static let informationKey = "information"
    }
    
    override init()
    {
        
    }
    
    init(inArray: [String])
    {
        informationArray = inArray
        name = inArray[0]
        instrument = inArray[1]
        chair = Int(inArray[2])!
    }
    
    init(inName: String, inChair: Int, inInstrument: String)
    {
        name = inName
        instrument = inInstrument
        chair = inChair
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(informationArray, forKey: PropertyKey.informationKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let informationArray = aDecoder.decodeObject(forKey: PropertyKey.informationKey) as! [String]
        
        // Must call designated initializer.
        self.init(inArray: informationArray)
    }
    
    func getName() -> String
    {
        return name
    }
    
    func getInstrument() -> String
    {
        return instrument
    }
    
    func getChair() -> Int
    {
        return chair
    }
    
    func setName(_ inName: String)
    {
        name = inName
    }
    
    func setInstrument(_ inInstrument: String)
    {
        instrument = inInstrument
    }
    
    func setChair(_ inChair: Int)
    {
        chair = inChair
    }
    
    func getInformation() -> [String]
    {
        return informationArray
    }
    
    func setInformation(_ str: String, loc: Int)
    {
        informationArray[loc] = str
    }
    
    override var description: String
    {
        return name + " plays " + instrument + " and is chair #" + String(chair)
    }
}








