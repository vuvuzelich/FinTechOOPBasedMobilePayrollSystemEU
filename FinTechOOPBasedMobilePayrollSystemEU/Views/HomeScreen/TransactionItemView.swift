//
//  TransactionItemView.swift
//  FinTechOOPBasedMobilePayrollSystemEU
//
//  Created by Макс Лахман on 26.02.2024.
//

import SwiftUI

struct TransactionItemView: View {
    var color: Color
    let transaction : TransactionItemDataModel
    @State private var showAboutTransactionView = false
    var body: some View {
        Button(action: {
            showAboutTransactionView.toggle()
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .fill(Color("MainBackgroundIconColor"))
                HStack {
                    ZStack {
                        Image(systemName: transaction.defaultImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .padding(15)
                            .foregroundColor(color)
    //                        .foregroundColor(Color("MainTextAndForegroundIconColor"))
                            .background(Color("MainBackgroundIconColor"))
                            .clipShape(Circle())
                            .overlay {
                                ZStack {
                                    Circle().foregroundColor(Color("MainBackgroundIconColor"))
                                        .frame(width: 20, height: 20)
                                    Image(systemName: transaction.operationOptionImage.rawValue)
                                        .foregroundColor(Color("MainTextAndForegroundIconColor"))
                                }
                                .position(CGPoint(x: 50.0, y: 45.0))
                            }
                    }
                    
                    HStack(alignment: .top, spacing: 0) {
                        VStack(alignment: .leading, spacing: 5){
                            Text(transaction.operationOptionImage.description)
                            Text(getFormattedDate(date: transaction.currentTimeAndDate))
                        }
                        Spacer()
                        HStack(spacing: 5) {
                            Text(getFormattedDouble(number: transaction.userTransfers))
                                .padding(.trailing, 15)
                        }
                        //                                        Text(String(format: "%.2f", transaction.userTransfers))
                    }
                    
                }
            }
            .sheet(isPresented: $showAboutTransactionView, content: {
                AboutTransaction()
            })
        })
        
        
    }
    
    
    func getFormattedDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM, HH:mm"
        dateFormatter.locale = Locale(identifier: "uk_UA")
        
        return dateFormatter.string(from: date)
    }
    
    func getFormattedDouble(number: Double) -> String {
        let nf = NumberFormatter()
        //        nf.numberStyle = .decimal
        /*Якщо мені знадобиться зразу конвертувати в валюту*/
        nf.numberStyle = .currency
        nf.maximumFractionDigits = 2
        //        nf.decimalSeparator = "."
        nf.currencyDecimalSeparator = "."
        nf.negativePrefix = "-"
        nf.positivePrefix = "+"
        
        if let formattedString = nf.string(from: NSNumber(value: number)) {
            return formattedString
        } else {
            return "Error formatting number"
        }
    }
}

