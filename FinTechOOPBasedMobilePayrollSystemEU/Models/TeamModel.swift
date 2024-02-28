//
//  TeamModel.swift
//  FinTechOOPBasedMobilePayrollSystemEU
//
//  Created by Макс Лахман on 27.02.2024.
//

import Foundation
import SwiftData

@Model
class TeamModel : Identifiable {
    var id: UUID
    var teamName : String
//    var users : [YouUserTestModel]
    
    init(teamName: String/*, users: [YouUserTestModel]*/) {
        self.id = UUID()
        self.teamName = teamName
//        self.users = users
    }
}
