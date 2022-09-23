//
//  Register.swift
//  projectRM
//
//  Created by Александр Троицкий on 23.09.2022.
//

import Foundation
/// reg123
struct Register {
    var arr = ["admin": "admin"]
    
    mutating func addToArray(name: String, pass: String) {
        arr[name] = pass
    }
    
    func getFromArray() -> [String: String] {
        return arr
    }
}
