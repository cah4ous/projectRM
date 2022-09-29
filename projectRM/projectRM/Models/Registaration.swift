//
//  Registaration.swift
//  projectRM
//
//  Created by Александр Троицкий on 29.09.2022.
//

import Foundation
/// Модель, которая отвечает за регистрацию и авторизацию пользователя
struct Registration {
      var loginMap = ["12345665432": "qwerty"]

      mutating func addToMap(name: String, pass: String) {
          loginMap[name] = pass
      }

      func getFromMap() -> [String: String] {
          return loginMap
      }
  }
