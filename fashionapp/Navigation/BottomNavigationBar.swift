//
//  BottomBar.swift
//  fashionapp
//
//  Created by Hercules Silva on 11/10/23.
//

import SwiftUI


struct BottomNavigationBar: View {
    @State var selection: Int = 0

    let barIconNames = ["house", "cart", "heart", "person"]
    let barViewItems = [
        AnyView(HomeView()),
        AnyView(CartView(showBackButton: false)),
        AnyView(Text("Favorite")),
        AnyView(Text("Profile"))
    ]
    
    
    var body: some View {
        TabView (selection: $selection){
            ForEach(barViewItems.count.range) { index in
                VStack { barViewItems[index] }
            }
        }
        .overlay( // Overlay the custom TabView component here
            Color.white // Base color for Tab Bar
                .edgesIgnoringSafeArea(.bottom)
                .frame(height: 50)
                .overlay(
                    HStack {
                        ForEach(barIconNames.count.range) { index in
                            let iconName = barIconNames[index]
                            Spacer()
                            BarItem(iconName: iconName, selected: selection == index) {
                                selection = index
                            }
                            
                            Spacer()
                        }
                        
                    })
            ,
            alignment: .bottom
        )
    }
}

struct BarItem: View {
    let iconName: String
    let selected: Bool
    var onTap : () -> Void
    
    var body: some View {
        Button(action: {
            onTap()
        }, label: {
            Image(systemName: selected ? "\(iconName).fill" : iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25, alignment: .center)
                .foregroundColor(AppColors.accentColor)
                .opacity(selected ? 1 : 0.4)
        })
    }
}


#Preview {
    BottomNavigationBar()
}

