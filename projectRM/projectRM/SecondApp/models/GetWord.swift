//
//  Model.swift
//  projectRM
//
//  Created by Александр Троицкий on 23.09.2022.
//

import Foundation

struct GetWord {
    var word: String
    
    func changeWord(word: String) -> String {
        word == "leohl" ? "hello" : "noooo"
    }
}
