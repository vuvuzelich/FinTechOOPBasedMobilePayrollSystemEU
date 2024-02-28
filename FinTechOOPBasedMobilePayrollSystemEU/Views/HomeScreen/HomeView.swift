//
//  HomeView.swift
//  FinTechOOPBasedMobilePayrollSystemEU
//
//  Created by Макс Лахман on 12.02.2024.
//

import SwiftUI
    
struct HomeView: View {
    @State private var items: [MainCardMenuItemDataModel] = [
        .init(color: Color("MainRedMainColor"), walletText: "Red", walletMoneyCoins: "10000", arrayOfUserTeams: [
            TeamCardDataModel(icon: "arrow.down.backward", name: "Команда розробників", photoMembers: ["1", "2", "3", "4", "3dPerson"], paidOrUnpaid: true),
            TeamCardDataModel(icon: "arrow.up.forward", name: "Команда дизайнерів", photoMembers: ["1", "2", "3", "4"], paidOrUnpaid: false),
            TeamCardDataModel(icon: "creditcard", name: "Команда розробників", photoMembers: ["1", "2", "3"], paidOrUnpaid: true),
            TeamCardDataModel(icon: "arrow.left.arrow.right", name: "Команда розробників", photoMembers: ["1", "2"], paidOrUnpaid: false)
            
        ]),
        .init(color: Color("DarkRedMainColor"), walletText: "Dark Red", walletMoneyCoins: "6740", arrayOfUserTeams: [
            TeamCardDataModel(icon: "arrow.down.backward", name: "Команда розробників", photoMembers: ["1", "2", "3", "4", "3dPerson"], paidOrUnpaid: true),
            TeamCardDataModel(icon: "arrow.up.forward", name: "Команда дизайнерів", photoMembers: ["1", "2", "3", "4"], paidOrUnpaid: false),
            TeamCardDataModel(icon: "creditcard", name: "Команда розробників", photoMembers: ["1", "2", "3"], paidOrUnpaid: true),
            TeamCardDataModel(icon: "arrow.left.arrow.right", name: "Команда розробників", photoMembers: ["1", "2"], paidOrUnpaid: false)
            
        ]),
        .init(color: .green, walletText: "Green", walletMoneyCoins: "31000", arrayOfUserTeams: [
            TeamCardDataModel(icon: "arrow.down.backward", name: "Команда розробників", photoMembers: ["1", "2", "3", "4", "3dPerson"], paidOrUnpaid: true),
            TeamCardDataModel(icon: "arrow.up.forward", name: "Команда дизайнерів", photoMembers: ["1", "2", "3", "4"], paidOrUnpaid: false),
            TeamCardDataModel(icon: "creditcard", name: "Команда розробників", photoMembers: ["1", "2", "3"], paidOrUnpaid: true),
            TeamCardDataModel(icon: "arrow.left.arrow.right", name: "Команда розробників", photoMembers: ["1", "2"], paidOrUnpaid: false)
            
        ]),
        .init(color: .yellow, walletText: "Yellow", walletMoneyCoins: "44340", arrayOfUserTeams: [
            TeamCardDataModel(icon: "arrow.down.backward", name: "Команда розробників", photoMembers: ["1", "2", "3", "4", "3dPerson"], paidOrUnpaid: true),
            TeamCardDataModel(icon: "arrow.up.forward", name: "Команда дизайнерів", photoMembers: ["1", "2", "3", "4"], paidOrUnpaid: false),
            TeamCardDataModel(icon: "creditcard", name: "Команда розробників", photoMembers: ["1", "2", "3"], paidOrUnpaid: true),
            TeamCardDataModel(icon: "arrow.left.arrow.right", name: "Команда розробників", photoMembers: ["1", "2"], paidOrUnpaid: false)
            
        ]),
        .init(color: .blue, walletText: "Blue", walletMoneyCoins: "6543", arrayOfUserTeams: [
            TeamCardDataModel(icon: "arrow.down.backward", name: "Команда розробників", photoMembers: ["1", "2", "3", "4", "3dPerson"], paidOrUnpaid: true),
            TeamCardDataModel(icon: "arrow.up.forward", name: "Команда дизайнерів", photoMembers: ["1", "2", "3", "4"], paidOrUnpaid: false),
            TeamCardDataModel(icon: "creditcard", name: "Команда розробників", photoMembers: ["1", "2", "3"], paidOrUnpaid: true),
            TeamCardDataModel(icon: "arrow.left.arrow.right", name: "Команда розробників", photoMembers: ["1", "2"], paidOrUnpaid: false)
            
        ])
        ]
    

    private var spacing : CGFloat = -70
    private var rotation : CGFloat = UIScreen.main.bounds.width / 6.5
    private var enableReflection = true
    var body: some View {
        NavigationStack{
            VStack{
                HeaderView(image: "3dPerson", userName: "Max")
                CoverFlowView(itemWidth: 280, enableReflection: enableReflection, spacing: spacing, rotation: rotation, items: items) { item in
                    NavigationLink {
                        MoreFunctinalityWalletView(walletCircleButtons: item.arrayOfUserTeams, color: item.color, walletText: item.walletText, walletMoneyCoins: item.walletMoneyCoins)
                    } label: {
                        MoneyPanelView(color: item.color, walletText: item.walletText, walletMoneyCoins: item.walletMoneyCoins)
                    }
                    
                        
                }

                .frame(height: 180)
                Spacer(minLength: 0)
                ActivitiesView()
                Spacer(minLength: 0)
            }
            .background(LinearGradient(colors: [Color("FirstBackgroundColor"), Color("SecondBackgroundColor")], startPoint: .top, endPoint: .bottom))
        }
    }
    
    

}

#Preview {
    HomeView()
}



struct HeaderView: View {
    var image : String
    var userName : String
    var body: some View {
        HStack{
            ZStack{
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
            }
            Text("Hello, \(userName)!")
                .font(.headline)
                .foregroundColor(Color("MainTextAndForegroundIconColor"))
            Spacer()
            ZStack{
                Image(systemName: "cloud.fog.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .padding(15)
                    .foregroundColor(Color("MainTextAndForegroundIconColor"))
                    .background(Color("MainBackgroundIconColor"))
                    .clipShape(Circle())
                    .overlay {
                        Circle().foregroundColor(Color("MainRedMainColor")).frame(width: 7, height: 7).position(CGPoint(x: 39.0, y: 20))
                    }
            }
        }.padding(.horizontal, 10)
    }
}



struct MoneyPanelView: View {
    var color: Color
    var walletText : String
    var walletMoneyCoins : String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(color.gradient)
            HStack {
                VStack(alignment: .leading){
                    Text(walletText)
                        .padding(.vertical, 5)
                        .font(.system(size: 12, weight: .regular, design: .serif))
                        
                    
                    HStack(alignment: .bottom, spacing: 0) {
                        Text("$\(walletMoneyCoins)")
                            .font(.system(size: 32, weight: .medium, design: .serif))
                        Text(".00")
                            .font(.system(size: 22, weight: .medium, design: .serif))
                            .padding(.bottom, 3)
                    }
                }
                Spacer()
            }
            .padding(20)
            
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .frame(width: UIScreen.main.bounds.width / 1.4, height: 150)
    }
}



struct ActivitiesView: View {
    let arrImages : [String] = ["1", "2", "3", "4", "3dPerson"]
    
    var body: some View {
        VStack {
            HStack(){
                Text("Activites")
                Spacer()
            }.padding(.leading, 25).font(.system(size: 20, weight: .semibold, design: .serif)).foregroundColor(Color("MainTextAndForegroundIconColor"))
            HStack(spacing: 8){
                VStack{
                    lastActivities(arrUsers: arrImages)
                    
                    HStack(spacing: 5){
                        defaultSystemIntergationCompanies(image: "payoneer", nameCorporation: "Payoneer")
                        defaultSystemIntergationCompanies(image: "paypal", nameCorporation: "PayPal")
                    }
                }
                NavigationLink {
                    ChooseBankView()
                } label: {
                    payrollCalculation()
                }

            }
            .frame(maxHeight: 250)
        .padding(.horizontal, 10)
        }
    }
    
    func lastActivities(arrUsers : [String]) -> some View{
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("MainBackgroundIconColor"))
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Send Again")
                        .font(.system(size: 15, weight: .semibold, design: .rounded)).padding(.bottom, 10)
                    .foregroundStyle(Color("MainTextAndForegroundIconColor"))
                    Spacer()
                }
                
                HStack(spacing: -10) {
                    if arrUsers.count > 4 {
                        ForEach(arrUsers.prefix(3), id: \.self) { image in
                            Image(image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45, height: 45)
                                .clipShape(Circle())
                        }
                        Text("+\(arrUsers.count - 3)")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                            .frame(width: 45, height: 45)
                            .background(Color.gray)
                            .clipShape(Circle())
                    } else {
                        ForEach(arrUsers.prefix(4), id: \.self) { image in
                            Image(image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45, height: 45)
                                .clipShape(Circle())
                        }
                    }
                }
            }.padding(.leading, 15)
        }
    }
    
    func defaultSystemIntergationCompanies(image : String, nameCorporation : String) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("MainBackgroundIconColor"))
            VStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 60)
                Text(nameCorporation)
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .foregroundStyle(Color("MainTextAndForegroundIconColor"))
            }
        }
    }
    
    func payrollCalculation() -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("MainBackgroundIconColor"))
            VStack {
                Image(systemName: "banknote.fill")
                    .resizable()
                    .scaledToFit()
                    .padding(5)
                    .frame(maxWidth: 60)
                    .padding(25)
                    .background(Color("FirstBackgroundColor"))
                    .clipShape(Circle())
                
                    
                Text("Розрахуємо заробітну плату?")
                    .multilineTextAlignment(.center)
            }
        }
        .foregroundColor(Color("MainTextAndForegroundIconColor"))
    }
}




