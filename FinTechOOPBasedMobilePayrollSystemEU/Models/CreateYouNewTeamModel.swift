//
//  CreateNewTeamModel.swift
//  FinTechOOPBasedMobilePayrollSystemEU
//
//  Created by Макс Лахман on 27.02.2024.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class CreateYouNewTeamModel: Identifiable {
    var id : UUID
    var nameTeam : String
    var icon : String
//    var members : [TeamModel]
    var paidOrUnpaid : Bool
    
    init(nameTeam: String, icon: String, /*members : [TeamModel]*/ paidOrUnpaid: Bool) {
        self.id = UUID()
        self.nameTeam = nameTeam
        self.icon = icon
//        self.members = members
        self.paidOrUnpaid = paidOrUnpaid
    }
    
}



