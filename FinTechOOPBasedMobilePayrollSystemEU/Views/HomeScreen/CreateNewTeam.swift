//
//  CreateNewUserTeam.swift
//  FinTechOOPBasedMobilePayrollSystemEU
//
//  Created by Макс Лахман on 27.02.2024.
//

import SwiftUI
import SwiftData

struct CreateNewTeam: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var nameTeam : String = ""
    
    @Query(sort: \UserModel.name, order: .forward, animation: .spring) var arrayTeamUsers : [TeamModel]
    
    
    
    @State private var paidOrUnpaid : Bool = false
    
    @Environment(\.modelContext) private var context
    
    @Query var users : [UserModel]
    
    private func addItemText(){
        let item = TeamModel(teamName: nameTeam, users: users)
        context.insert(item)
//        try! context.save()
        dismiss()
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                NavigationLink {
                    AddNewUserInTeam(users: users)
                } label: {
                    Text("ADD USER HERE!")
                        .foregroundStyle(Color.red)
                }
                


                TextField("Им'я", text: $nameTeam)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                List{
                    ForEach(users, id: \.id){ user in
                        Text(user.name)
                            .foregroundStyle(Color.green)
                            .swipeActions {
                                Button("Delete", role: .destructive) {
                                    context.delete(user)
                                }
                            }
                    }
                    
                }
                Button {
                    addItemText()
                } label: {
                    ZStack {
                        Text("ADDD")
                    }
                    .frame(maxHeight: 100)
                    .padding()
                }
                .padding(.bottom, 80)
            }
            .foregroundColor(Color("MainTextAndForegroundIconColor"))
        }
        .navigationTitle("Додати команду")
    }

}

#Preview {
    CreateNewTeam()
}
