//
//  Array2D.swift
//  CookieCrunch
//
//  Created by Chris Jungmann on 10/28/16.
//  Copyright © 2016 Chris Jungmann. All rights reserved.
//

// import Foundation

struct Array2D<T> {
    
    let columns: Int
    let rows: Int
    fileprivate var array: Array<T?>
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        array = Array<T?>(repeating: nil, count: rows*columns)              // tutorial used pre Swift 3 syntax 
                                                                            //(count: rows*columns, repeatedValue: nil)
    }
    
    // this is the setter and getter. Allows access to the array via array[column, row]
    
    subscript(column: Int, row: Int) -> T? {
        get {
            return array[row*columns + column]
        }
        set {
            array[row*columns + column] = newValue
        }
    }
}

