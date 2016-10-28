//
//  Level.swift
//  CookieCrunch
//
//  Created by Chris Jungmann on 10/28/16.
//  Copyright © 2016 Chris Jungmann. All rights reserved.
//

import Foundation

let NumColumns = 9
let NumRows = 9

class Level {
    
    //
    fileprivate var cookies = Array2D<Cookie>(columns: NumColumns, rows: NumRows)
    
    // this adds tiles which are slots for cookies and other things
    fileprivate var tiles = Array2D<Tile>(columns: NumColumns, rows: NumRows)

    
    init(filename: String) {
        // 1
        guard let dictionary = Dictionary<String, AnyObject>.loadJSONFromBundle(filename: filename) else { return }
        // 2
        guard let tilesArray = dictionary["tiles"] as? [[Int]] else { return }
        // 3
        for (row, rowArray) in tilesArray.enumerated() {
            // 4
            let tileRow = NumRows - row - 1
            // 5
            for (column, value) in rowArray.enumerated() {
                if value == 1 {
                    tiles[column, tileRow] = Tile()
                }
            }
        }
    }
    
        
    func shuffle() -> Set<Cookie> {
        return createInitialCookies()
    }
    
    private func createInitialCookies() -> Set<Cookie> {
        var set = Set<Cookie>()
        
        // 1
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                
                if tiles[column, row] != nil {
                    
                    // 2
                    // changed from var to let per Xcode warning
                    let cookieType = CookieType.random()
                    
                    // 3
                    let cookie = Cookie(column: column, row: row, cookieType: cookieType)
                    cookies[column, row] = cookie
                    
                    // 4
                    set.insert(cookie)
                }

//                // 2
//                // changed from var to let per Xcode warning
//                let cookieType = CookieType.random()
//
//                // 3
//                let cookie = Cookie(column: column, row: row, cookieType: cookieType)
//                cookies[column, row] = cookie
//                
//                // 4
//                set.insert(cookie)
                
            }
        }
        return set
    }
    
    func tileAt(column: Int, row: Int) -> Tile? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return tiles[column, row]
    }
    
    // Returns the cookie at the specified column and row, or nil when there is none.
    func cookieAt(column: Int, row: Int) -> Cookie? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return cookies[column, row]
    }

}


