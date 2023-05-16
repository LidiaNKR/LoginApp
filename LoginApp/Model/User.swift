//
//  User.swift
//  LoginApp
//
//  Created by Лидия Ладанюк on 04.05.2023.
//

import UIKit

/// Учетная запись
struct User {
    let login: String
    let password: String
    let person: Person
}

/// Персональные данные
struct Person {
    let name: String
    let surname: String
    let information: Info
    
    /// Молные имя и фамилия пользователя
    var fullname: String {
        "\(name) \(surname)"
    }
}

/// Поднобная информация о пользователе
struct Info {
    let photo: UIImage
    let age: Int
    let breed: String
    let hobbies: String
    let moreInfo: String
    
    //Описание информации о пользователе
    var description: String {
        """
        Мой возраст: \(age) лет
        Порода: \(breed)
        Мое хобби: \(hobbies)
        Немного обо мне: \(moreInfo)
        """
    }
}
