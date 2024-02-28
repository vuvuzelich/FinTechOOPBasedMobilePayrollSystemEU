//
//  Transaction.swift
//  FinTechOOPBasedMobilePayrollSystemEU
//
//  Created by Макс Лахман on 22.02.2024.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class TransactionItemDataModel: Identifiable {
    var id : UUID
    var defaultImage : String
    var operationOptionImage : SendOrReceivedEnum
    var currentTimeAndDate : Date
    var userTransfers : Double
    
    init(defaultImage: String, operationOptionImage: SendOrReceivedEnum, currentTimeAndDate: Date, userTransfers: Double) {
        self.id = UUID()
        self.defaultImage = defaultImage
        self.operationOptionImage = operationOptionImage
        self.currentTimeAndDate = currentTimeAndDate
        self.userTransfers = userTransfers
    }
    
}




