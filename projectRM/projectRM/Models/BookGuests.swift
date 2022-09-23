//
//  BookGuests.swift
//  projectRM
//
//  Created by Александр Троицкий on 23.09.2022.
//

import Foundation
/// bookGuests
struct BookGuest {
    var arrBookGuest: [BookGuest] = []
    var name: String
    var countGuest: String
    var numberOfTable: String
    var bookTable: Bool
    var prepayment: Bool
    var vipPlace: Bool
    
    init(name: String, countGuest: String, numberOfTable: String, bookTable: Bool, prepayment: Bool, vipPlace: Bool) {
        self.name = name
        self.countGuest = countGuest
        self.numberOfTable = numberOfTable
        self.bookTable = bookTable
        self.prepayment = prepayment
        self.vipPlace = vipPlace
    }
    
    mutating func addGuest(name: String,
                           countGuest: String,
                           numberOfTable: String,
                           bookTable: Bool,
                           prepayment: Bool,
                           vipPlace: Bool) {
        arrBookGuest.append(BookGuest(name: name,
                                      countGuest: countGuest,
                                      numberOfTable: numberOfTable,
                                      bookTable: bookTable,
                                      prepayment: prepayment,
                                      vipPlace: vipPlace))
    }
    
    func getInfoGuest() -> [BookGuest] {
        return arrBookGuest
    }
}
