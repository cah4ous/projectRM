//
//  User.swift
//  projectRM
//
//  Created by Александр Троицкий on 04.10.2022.
//

import Foundation
/// Структура, которая позволяет хранить и пользоваться данными зарегистрированных пользователей
struct User: Codable {
    let name: String
    let email: String
    let password: String
}
