//
//  DataManager.swift
//  LoginApp
//
//  Created by Лидия Ладанюк on 04.05.2023.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    var user: User = User(login: "User",
                          password: "12345",
                          person: Person(name: "Лакки",
                                         surname: "Кусевич",
                                         information: Info(photo: #imageLiteral(resourceName: "Лакки"),
                                                           age: 11,
                                                           breed: "Метис",
                                                           hobbies: "Тыгдыкать по ночам",
                                                           moreInfo: """
             Привет кожаный!😊
             Меня зовут Лакки!
             В возрасте 7-ми лет меня выбросили на улицу, оставив в переноске на лавочке в лесу...
             Мне было очень-очень срашно, но вскоре добрые люди забрали меня домой,
             откормили и отогрели. Теперь я счастливый, сытый и красивый!)
             """)))
    
    private init () {}
}
