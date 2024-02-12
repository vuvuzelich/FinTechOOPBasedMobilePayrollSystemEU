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
    private var rotation : CGFloat = 50
    private var enableReflection = true
    var body: some View {
        NavigationStack{
            VStack{
                header(image: "3dPerson", userName: "Max")
                CoverFlowView(itemWidth: 280, enableReflection: enableReflection, spacing: spacing, rotation: rotation, items: items) { item in
                    MoneyPanelView(color: item.color)

                }
                .frame(height: 180)
                Spacer(minLength: 0)
                HStack(){
                    Text("Activites")
                    Spacer()
                }.padding(.leading, 25).font(.system(size: 20, weight: .semibold, design: .serif)).foregroundColor(Color("MainTextAndForegroundIconColor"))
                HStack(spacing: 8){
                    VStack{
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.red)
                            Text("Activities")
                        }
                        HStack(spacing: 5){
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.green)
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.yellow)
                        }
                    }
                    VStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.blue)
                    }
                }
                .frame(maxHeight: 250)
                .padding(.horizontal, 10)

                Spacer(minLength: 0)
            }
            .background(LinearGradient(colors: [Color("FirstBackgroundColor"), Color("SecondBackgroundColor")], startPoint: .top, endPoint: .bottom))
        }
        

        
        
    }
    
    
    
    func header(image : String, userName : String) -> some View{
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

#Preview {
    HomeView()
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


