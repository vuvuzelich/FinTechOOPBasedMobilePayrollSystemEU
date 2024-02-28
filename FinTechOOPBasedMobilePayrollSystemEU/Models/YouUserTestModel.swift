//
//  UserModel.swift
//  FinTechOOPBasedMobilePayrollSystemEU
//
//  Created by Макс Лахман on 27.02.2024.
//

import Foundation
import SwiftData

@Model
class YouUserTestModel : Identifiable {
    var id: UUID
    var imageUser : String
    var name : String
    
    init(imageUser: String, name: String) {
        self.id = UUID()
        self.imageUser = imageUser
        self.name = name
    }
}
