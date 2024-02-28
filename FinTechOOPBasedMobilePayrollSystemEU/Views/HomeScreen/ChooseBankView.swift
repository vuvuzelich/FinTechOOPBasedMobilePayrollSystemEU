//
//  ChooseBankView.swift
//  FinTechOOPBasedMobilePayrollSystemEU
//
//  Created by Макс Лахман on 13.02.2024.
//

import SwiftUI

struct ChooseBankView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedBank: Bool = false
    let arrBanks = ["bank1", "bank2", "bank3", "bank4", "bank5", "bank6", "bank7", "bank8", "bank9", "bank10", "bank11", "bank12", "bank13", "bank14",]
    
    

    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
//                HStack {
//                    Text("Select your bank").font(.system(size: 25, weight: .semibold, design: .default))
//                    Spacer()
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 10)
//                            .fill(Color("MainRedMainColor"))
//                            .shadow(color: .black.opacity(0.5), radius: 8, y: 2)
//                            .frame(maxWidth: 50)
//                        Image(systemName: "magnifyingglass")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 20)
//                            .padding(10)
//                            .foregroundStyle(Color("MainTextAndForegroundIconColor"))
//                    }
//                }
//                .padding(20)

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(arrBanks, id: \.self) { bank in
                            NavigationLink {
                                BankTemplateView(bank: bank)
                            } label: {
                                ZStack {
                                    Circle()
                                        .fill(Color("MainBackgroundIconColor"))
                                        
                                    Image(bank)
                                        .resizable()
                                        .scaledToFit()
                                        .padding()
                                }
                            }
                        }
                    }
                    .padding(16)
                    
            }.padding(.bottom, 66)
        }
        .navigationTitle("Select your Bank")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
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
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("MainRedMainColor"))
                            .shadow(color: .black.opacity(0.5), radius: 8, y: 2)
                            .frame(maxWidth: 50)
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .padding(10)
                            .foregroundStyle(Color("MainTextAndForegroundIconColor"))
                    }
                })
            }
        }
        
    }
}

struct BankTemplateView: View {
    var bank: String
    @Environment(\.dismiss) var dismiss
    
    var btnBack : some View {
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
    var body: some View {
        VStack {
            Text(bank)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing: btnBack)
    }

}

#Preview {
    ChooseBankView()
}
