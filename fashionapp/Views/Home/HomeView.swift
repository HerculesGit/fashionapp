//
//  HomeView.swift
//  fashionapp
//
//  Created by Hercules Silva on 02/10/23.
//

import SwiftUI

struct HomeView: View {
    enum Field: Hashable {
        case name
        case fullName
    }
    
    @State private var username: String = ""
    @FocusState private var emailFieldIsFocused: Bool
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack () {
                    VStack (alignment: .leading) {
                        Text("Location")
                            .foregroundColor(AppColors.foregroundGrayColor)
                            .fontWeight(.bold)
                            .font(.callout)
                        
                        HStack {
                            Image(systemName: "mappin")
                                .imageScale(.large)
                                .foregroundColor(.accentColor)
                            Text("Hanoi, Viet Nam").fontWeight(.bold)
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.leading)
                        TextField(
                            "Looking for fashion",
                            text: $username
                        )
                        .focused($emailFieldIsFocused)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .padding()
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 0)
                    )
                    .foregroundColor(Color.white)
                    .background(Color(hex: "F6F8FA"))
                    .cornerRadius(50)
                    .padding(.top)
                    .padding(.bottom, 4)

                    HStack () {
                        VStack (alignment: .leading ) {
                            Text("Shop with us!")
                            Text("Get 40% Off!")
                                .fontWeight(.bold)
                                .font(.system(size: 26))
                            Text("for all items")
                                .fontWeight(.bold)
                                .font(.system(size: 26))
                        }.padding(.leading)
                            .offset(x:10)
                        
                        Image("couple-img")
                            .resizable()
                            .imageScale(.large)
                            .aspectRatio(contentMode: .fill)
                            .offset(y: 10)
                    }
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: UIScreen.height(percentage: 0.18)
                    )
                    .background(AppColors.backgroundGrayColor)
                    .cornerRadius(15)
                    .padding(.top)
                    
                    FilterCategory(onTap: { category in
                        
                    })
                    .padding(.top)
                    
                    let spacing: CGFloat = 16
                    let columns = [
                        GridItem(.flexible(), spacing: spacing, alignment: .center),
                        GridItem(.flexible(), spacing: 0, alignment: .center)
                    ]
                    
                    LazyVGrid(
                        columns: columns,
                        alignment: .listRowSeparatorLeading,
                        spacing: spacing
                    ) {
                        ForEach(ProductModel.sampleData.count.range) { index in
                            NavigationLink (destination: ProductDetailsView(product: ProductModel.sampleData[index])) {
                                ProductViewItem(product: ProductModel.sampleData[index])
                                    .accessibilityLabel("Product Details")
                            }
                        }
                    }
                    .padding(.top)
                }
                .padding(.horizontal)
            }.background(.white)
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
