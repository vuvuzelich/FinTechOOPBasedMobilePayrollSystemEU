//
//  Item.swift
//  FinTechOOPBasedMobilePayrollSystemEU
//
//  Created by Макс Лахман on 15.02.2024.
//

import Foundation
import SwiftUI

struct MainCardMenuItemDataModel : Identifiable {
    let id : UUID = .init()
    var color : Color
    var walletText : String
    var walletMoneyCoins : String
    var arrayOfUserTeams : [TeamCardDataModel]
}
