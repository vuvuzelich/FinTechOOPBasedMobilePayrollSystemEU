//
//  HomeView.swift
//  FinTechOOPBasedMobilePayrollSystemEU
//
//  Created by Макс Лахман on 12.02.2024.
//

import SwiftUI
    
struct HomeView: View {
    @State private var items : [CoverFlowItem] = [Color("MainRedMainColor"), Color("DarkRedMainColor"), .green, .yellow, .primary].compactMap{
        return .init(color: $0)
    }
    

    private var spacing : CGFloat = -70
    private var rotation : CGFloat = UIScreen.main.bounds.width / 6.5
    private var enableReflection = true
    var body: some View {
        NavigationStack{
            VStack{
                HeaderView(image: "3dPerson", userName: "Max")
                CoverFlowView(itemWidth: 280, enableReflection: enableReflection, spacing: spacing, rotation: rotation, items: items) { item in
                    MoneyPanelView(color: item.color)
                        
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
    var walletText = "Гаманець(ГРН)"
    var walletMoneyCoins = "14,268"
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
    let arrImages : [String] = ["1", "2", "3", "4"]
    
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
                Text("Send Again")
                    .font(.system(size: 15, weight: .semibold, design: .rounded)).padding(.bottom, 10)
                    .foregroundStyle(Color("MainTextAndForegroundIconColor"))
                HStack(spacing: -10){
                    ForEach(arrUsers, id: \.self){image in
                        Image(image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                            .clipShape(Circle())
                            
                    }
                }
            }
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




