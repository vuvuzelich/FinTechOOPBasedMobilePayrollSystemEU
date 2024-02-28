//
//  ReceiveView.swift
//  FinTechOOPBasedMobilePayrollSystemEU
//
//  Created by Макс Лахман on 19.02.2024.
//

import SwiftUI

struct ReceiveView: View {
    @State private var fullText: String = ""
    @FocusState var sendIsFocused: Bool
    var walletText : String
    @Environment(\.dismiss) var dismiss
    @State private var accountNumber = ""
    @State private var hourlyRate = ""
    @State private var hoursWorked = ""
    @State private var taxRate : String? = ""
    @State private var bonuses : String? = ""
    @State private var comments = ""
    @State private var finalNetSalary = "0.00"
    @Environment(\.modelContext) private var context
    var color : String = "MainRedMainColor"
    private func addItem(){
        let item = TransactionItemDataModel(defaultImage: "t.circle.fill", operationOptionImage: .receive, currentTimeAndDate: Date(), userTransfers: Double(finalNetSalary) ?? 0.00)
        context.insert(item)
    }
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Калькулятор зарплати")) {
                    HStack {
                        TextField("Номер рахунку", text: $accountNumber)
                            .keyboardType(.asciiCapableNumberPad)
                            .onChange(of: accountNumber) { oldValue, newValue in
                                // Удаление пробелов из нового значения
                                let cleanedValue = newValue.replacingOccurrences(of: " ", with: "")
                                
                                // Проверка на максимальное количество цифр (16)
                                if cleanedValue.count <= 16 {
                                    // Форматирование номера счета (вставка пробелов после каждых 4 цифр)
                                    let formattedValue = formatAccountNumber(cleanedValue)
                                    
                                    // Присвоение форматированного значения переменной
                                    accountNumber = formattedValue
                                } else {
                                    // Если введено более 16 цифр, обрезаем
                                    accountNumber = String(cleanedValue.prefix(16))
                                }
                            }
                            .focused($sendIsFocused)
                    }
                    HStack {
                        TextField("Погодинна ставка", text: $hourlyRate)
                            .keyboardType(.numberPad)
                            .focused($sendIsFocused)
                    }

                    HStack {
                        TextField("Відпрацьовані години", text: $hoursWorked)
                            .keyboardType(.numberPad)
                            .focused($sendIsFocused)
                    }
                    HStack {
                        TextField("Податкова ставка", text: Binding(
                            get: { taxRate ?? "" },
                            set: { taxRate = $0.isEmpty ? nil : $0 }
                        ))
                        .keyboardType(.numberPad)
                        .focused($sendIsFocused)
                    }

                    HStack {
                        TextField("Бонуси", text: Binding(
                            get: { bonuses ?? "" },
                            set: { bonuses = $0.isEmpty ? nil : $0 }
                        ))
                        .keyboardType(.numberPad)
                        .focused($sendIsFocused)
                    }
                    
                    CustomTextEditor.init(placeholder: "Почни писати свій коментар..", text: $comments)
                        .font(.body)
                        .accentColor(.red)
                        .frame(height: 200)
                        .cornerRadius(8)
                    
                    

                }
                
            }
            .scrollIndicators(.hidden)
            .listRowSpacing(20)
            .foregroundColor(Color("MainTextAndForegroundIconColor"))
            
            
            
            
            
            Button {
                addItem()
                sendIsFocused = false
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("MainTextAndForegroundIconColor"))
                    HStack {
                        Text("Send ₴\(finalNetSalary)")
                        Image(systemName: "arrowshape.bounce.forward")
                    }
                    .foregroundStyle(Color("MainBackgroundIconColor"))
                }
                .frame(maxHeight: 100)
                .padding()
            }
            .padding(.bottom, 80)
            .onChange(of: [hourlyRate, hoursWorked, taxRate, bonuses]) { oldValue, newValue in
                pushSalary()
            }
        }
        .navigationTitle(walletText)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .topBarTrailing) {
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
    
    private func formatAccountNumber(_ value: String) -> String {
            var formattedValue = ""
            var index = 0

            for character in value {
                if index > 0 && index % 4 == 0 {
                    formattedValue.append(" ")
                }
                formattedValue.append(character)
                index += 1
            }

            return formattedValue
        }
    
    func pushSalary() {
        let hourlyRateDouble = Double(hourlyRate) ?? 0.0
        let hoursWorkedDouble = Double(hoursWorked) ?? 0.0
        let taxRateDouble = Double(taxRate ?? "") ?? 0.0
        let bonusesDouble = Double(bonuses ?? "") ?? 0.0

        let grossSalary = hourlyRateDouble * hoursWorkedDouble
        let taxAmount = grossSalary * (taxRateDouble / 100)
        let netSalary = grossSalary - taxAmount + bonusesDouble
        finalNetSalary = String(format: "%.2f", netSalary)
    }
    
    
}

#Preview {
    ReceiveView(walletText: "ered")
}
