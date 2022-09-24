//
//  Register.swift
//  projectRM
//
//  Created by Александр Троицкий on 24.09.2022.
//

import Foundation
/// RegistrationModel
 struct Register {
     var loginMap = ["admin": "admin"]

     mutating func addToMap(name: String, pass: String) {
         loginMap[name] = pass
     }

     func getFromMap() -> [String: String] {
         return loginMap
     }
 }
