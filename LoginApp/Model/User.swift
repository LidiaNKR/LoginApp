//
//  User.swift
//  LoginApp
//
//  Created by Лидия Ладанюк on 04.05.2023.
//

import UIKit

struct User {
    let login: String
    let password: String
    let person: Person
}

struct Person {
    let name: String
    let surname: String
    let information: Info
    
    var fullname: String {
        "\(name) \(surname)"
    }
}

struct Info {
    let photo: UIImage
    let age: Int
    let breed: String
    let hobbies: String
    let moreInfo: String
    
    var description: String {
        """
        Мой возраст: \(age) лет
        Порода: \(breed)
        Мое хобби: \(hobbies)
        Немного обо мне: \(moreInfo)
        """
    }
}
