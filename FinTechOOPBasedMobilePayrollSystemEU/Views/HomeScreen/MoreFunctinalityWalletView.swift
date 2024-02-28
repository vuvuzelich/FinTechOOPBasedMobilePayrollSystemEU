//
//  MoreFunctinalityWalletView.swift
//  FinTechOOPBasedMobilePayrollSystemEU
//
//  Created by Макс Лахман on 15.02.2024.
//

import SwiftUI
import SwiftData


struct MoreFunctinalityWalletView: View {
    @Environment(\.dismiss) var dismiss
    var walletCircleButtons : [TeamCardDataModel]
    
    
    @State private var selection: String?
    
    
    @Environment(\.modelContext) private var context
    @Query private var transactions : [TransactionItemDataModel]
    
    
    
    
    var color: Color
    var walletText : String
    var walletMoneyCoins : String
    
    
    
    func deleteItem(from group: TransactionItemDataModel, at index: Int){
        context.delete(transactions[index])
    }
    
    func updateItem(item : TransactionItemDataModel){
        item.userTransfers = 40.54
        try? context.save()
    }
    
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(color.gradient)
                    
                    HStack {
                        VStack(alignment: .leading){
                            Text(walletText)
                            
                                .font(.system(size: 15, weight: .regular, design: .serif))
                                .padding(.top, 30)
                            
                            
                            HStack(alignment: .bottom, spacing: 0) {
                                Text("$\(walletMoneyCoins)")
                                    .font(.system(size: 32, weight: .medium, design: .serif))
                                Text(".00")
                                    .font(.system(size: 22, weight: .medium, design: .serif))
                                    .padding(.bottom, 3)
                            }.padding(.top, 15)
                        }
                        Spacer()
                    }
                    .padding(20)
                    
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                .ignoresSafeArea(edges: .top)
                .frame(width: UIScreen.main.bounds.width / 1, height: UIScreen.main.bounds.height / 2.7)
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(walletCircleButtons, id: \.id) { button in
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(color.gradient)
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    ZStack {
                                        Circle()
                                            .fill(Color.gray)
                                            .frame(maxWidth: 60)
                                        Image(systemName: button.icon)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 20, height: 20, alignment: .center)
                                            .foregroundStyle(Color("MainBackgroundIconColor"))
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text(String(button.name))
                                            .foregroundStyle(Color("MainTextAndForegroundIconColor"))
                                            .font(.system(size: 16))
                                        //                                        .minimumScaleFactor(0.7) // Здесь установите значение по вашему усмотрению
                                            .lineLimit(1) // Ограничение на одну строку
                                            .multilineTextAlignment(.center)
                                        Text(String(button.photoMembers.count) + " members")
                                            .foregroundStyle(Color("MainTextAndForegroundIconColor"))
                                            .font(.system(size: 16))
                                            .minimumScaleFactor(0.7) // Здесь установите значение по вашему усмотрению
                                            .lineLimit(1) // Ограничение на одну строку
                                            .multilineTextAlignment(.center)
                                    }.padding(.trailing, 15)
                                    
                                    HStack(spacing: -10) {
                                        let displayedMembers = Array(button.photoMembers.prefix(3))
                                        ForEach(displayedMembers, id: \.self) { image in
                                            Image(image)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 45, height: 45)
                                                .clipShape(Circle())
                                        }
                                        
                                        if button.photoMembers.count > 3 {
                                            ZStack {
                                                Circle()
                                                    .stroke(color.gradient, lineWidth : 3)
                                                Circle()
                                                    .fill(Color("MainBackgroundIconColor"))
                                                Text("+\(button.photoMembers.count - 3)")
                                                    .font(.system(size: 14))
                                                    .frame(width: 45, height: 45)
                                                    .foregroundStyle(Color("MainTextAndForegroundIconColor"))
                                                    .clipShape(Circle())
                                            }
                                        }
                                    }
                                    
                                    if button.paidOrUnpaid {
                                        NavigationLink {
                                            SendView(walletText: walletText)
                                        } label: {
                                            ZStack{
                                                Capsule()
                                                    .fill(color.gradient.opacity(0.8))
                                                Text("Оплатити")
                                                    .foregroundStyle(Color("MainTextAndForegroundIconColor"))
                                            }
                                        }
                                        
                                        
                                    } else {
                                        ZStack{
                                            Capsule()
                                                .fill(.gray.opacity(0.5))
                                            Text("Оплачено")
                                                .foregroundStyle(Color("MainTextAndForegroundIconColor"))
                                        }
                                    }
                                    
                                    
                                }.padding(15)
                            }.padding(.bottom, 10)
                            
                            
                            
                        }
                    }
                    .padding(.top, 10)
                }.padding(.horizontal, 5)
                
                Divider().padding(.vertical, 10)
                
                List {
                    Section(header: Text("Transactions")) {
                        ForEach(transactions) { transaction in  // Итерируем по транзакциям внутри каждой группы
                            HStack {
                                TransactionItemView(color : color, transaction: transaction)
                                //                                Button(action: { updateItem(item: transaction) }, label: { Image(systemName: "pencil") })
                            }
                        }
                        .onDelete { indexes in
                            for index in indexes {
                                context.delete(transactions[index])
                            }
                        }
                        
                    }
                }
                .padding(.bottom, 60)
                .listStyle(.insetGrouped)
                .listRowSpacing(8.0)
                .scrollIndicators(.hidden)
                .foregroundStyle(Color("MainTextAndForegroundIconColor"))
                .font(.system(size: 16))
                .bold()
            }
            .navigationTitle(walletText)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea(edges: .top)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        ZStack {
                            Circle()
                                .fill(Color.gray).frame(maxWidth: 50)
                            
                            Image(systemName: "xmark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 16, alignment: .center)
                                .padding(14)
                                .foregroundStyle(Color("MainBackgroundIconColor"))
                        }
                    })
                }
            }
        }
    }
}




#Preview {
    MoreFunctinalityWalletView(walletCircleButtons: [
        TeamCardDataModel(icon: "arrow.down.backward", name: "Команда розробників", photoMembers: ["1", "2", "3", "4", "3dPerson"], paidOrUnpaid: true),
        TeamCardDataModel(icon: "arrow.up.forward", name: "Команда дизайнерів", photoMembers: ["1", "2", "3", "4"], paidOrUnpaid: false),
        TeamCardDataModel(icon: "creditcard", name: "Команда розробників", photoMembers: ["1", "2", "3"], paidOrUnpaid: true),
        TeamCardDataModel(icon: "arrow.left.arrow.right", name: "Команда розробників", photoMembers: ["1", "2"], paidOrUnpaid: false)
        
    ], color: .red, walletText: "Wallet", walletMoneyCoins: "14,500")
}

