//
//  User.swift
//  FinTechOOPBasedMobilePayrollSystemEU
//
//  Created by Макс Лахман on 27.02.2024.
//

import Foundation
import SwiftData

@Model
class UserTest {
    var id: UUID
    var firstName: String
    var lastName: String
    var company: CompanyTest
    var array : [CustomerTest]
    
    init(firstName: String, lastName: String, company: CompanyTest, array : [CustomerTest]) {
        self.id = UUID()
        self.firstName = firstName
        self.lastName = lastName
        self.company = company
        self.array = array
    }
}

@Model
class CompanyTest {
    var id: UUID
    var companyName: String
    var designation: String
    
    init(companyName: String, designation: String) {
        self.id = UUID()
        self.companyName = companyName
        self.designation = designation
    }
}


@Model
class CustomerTest {
    var id: UUID
    var text: String
    
    init(text: String) {
        self.id = UUID()
        self.text = text
    }
}
