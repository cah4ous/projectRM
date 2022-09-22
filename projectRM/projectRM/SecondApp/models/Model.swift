//
//  Model.swift
//  projectRM
//
//  Created by Александр Троицкий on 23.09.2022.
//

import Foundation
struct GetWord {
    var word: String
    
    init(word: String) {
        self.word = word
    }
    
    func changeWord(word: String) -> String {
        if word == "leohl" {
            return "hello"
        } else {
            return "noooo"
        }
    }
}
