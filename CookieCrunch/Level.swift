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

    func cookieAt(column: Int, row: Int) -> Cookie? {
        // assert to check bounds. This will force an exception
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return cookies[column, row]
    }
    
    func shuffle() -> Set<Cookie> {
        return createInitialCookies()
    }
    
    private func createInitialCookies() -> Set<Cookie> {
        var set = Set<Cookie>()
        
        // 1
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                
                // 2
                // changed from var to let per Xcode warning
                let cookieType = CookieType.random()
                
                // 3
                let cookie = Cookie(column: column, row: row, cookieType: cookieType)
                cookies[column, row] = cookie
                
                // 4
                set.insert(cookie)
            }
        }
        return set
    }

}


