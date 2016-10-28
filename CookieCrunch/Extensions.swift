//
//  Extensions.swift
//  CookieCrunch
//
//  Created by Chris Jungmann on 10/28/16.
//  Copyright © 2016 Chris Jungmann. All rights reserved.
//

import Foundation

// Using Swift’s extension mechanism to add new methods to existing types

extension Dictionary {
    
    static func loadJSONFromBundle(filename: String) -> Dictionary<String, AnyObject>? {
        
        var dataOK: Data
        var dictionaryOK: NSDictionary = NSDictionary()
        
        // first check if file exists of type json
        if let path = Bundle.main.path(forResource: filename, ofType: "json") {
            
            // first we try to load the file
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: NSData.ReadingOptions()) as Data!
                dataOK = data!
            }
            catch {
                print("Could not load level file: \(filename), error: \(error)")
                return nil
            }
            
            // next we decode it into an NSDictionary
            do {
                let dictionary = try JSONSerialization.jsonObject(with: dataOK, options: JSONSerialization.ReadingOptions()) as AnyObject!
                dictionaryOK = (dictionary as! NSDictionary as? Dictionary<String, AnyObject>)! as NSDictionary
            }
            catch {
                print("Level file '\(filename)' is not valid JSON: \(error)")
                return nil
            }
        } else {
            print("JSON File not found in path")
            return nil
        }
        
        print("File Ok")
        return dictionaryOK as? Dictionary<String, AnyObject>
        
    }
    
}

