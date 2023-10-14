//
//  CartView.swift
//  fashionapp
//
//  Created by Hercules Silva on 13/10/23.
//

import SwiftUI

struct CartView: View {
    let cartItems: [CartItem]
    let showBackButton: Bool
    
    init(cartItems: [CartItem] = CartItem.sampleData, showBackButton: Bool = true) {
        self.cartItems = cartItems
        self.showBackButton = showBackButton
    }
    
    @Environment(\.dismiss) private var dismiss
    
    func total() -> String {
        var doubleTotal: Double = 0.0
        
        cartItems.forEach { cartItem in
            doubleTotal += cartItem.total()
        }
        
        return "$\(doubleTotal.rounded())"
    }
    
    var body: some View {
        
        ///  toolbar
        VStack (alignment: .leading) {
            HStack(alignment: .center) {
                Button(
                    action: { if (showBackButton) { dismiss() } },
                    label: {
                        Image(systemName: "chevron.left")
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .foregroundColor(.black)
                        
                    }
                )
                .overlay(RoundedCorner())
                .padding(.leading)
                .opacity(showBackButton ? 1.0 : 0.0)
                
                Spacer()
                Text("My Cart").bold()
                Spacer()
                
                Button(
                    action: {},
                    label: {
                        Image(systemName: "ellipsis")
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .foregroundColor(.black)
                        
                    }
                )
                .overlay(RoundedCorner())
                .padding(.trailing)
            }
            
            /// body
            ScrollView {
                VStack {
                    ForEach(cartItems) { cartItem in
                        let product: ProductModel = cartItem.product
                        VStack {
                            HStack(alignment: .top) {
                                product.imageFromResource().resizable()
                                    .aspectRatio(contentMode: .fit).frame(height: 140).cornerRadius(15)
                                VStack (alignment: .leading) {
                                    Text(product.name).bold().font(.headline)
                                    
                                    Text(product.brand).foregroundColor(AppColors.foregroundGrayColor).font(.callout).bold()
                                    
                                    Text("Size: \(cartItem.size)").foregroundColor(AppColors.foregroundGrayColor).font(.callout).bold()
                                    
                                    HStack {
                                        Text(product.formattedPrice()).bold()
                                        Spacer()
                                        CustomStepper(stepperValue: cartItem.amount)
                                    }
                                }.padding(.vertical, 8)
                            }
                            Divider().opacity(cartItem.id == cartItems.last!.id ? 0.0 : 1.0)
                        }
                    }
                }
            }.padding(.horizontal)
            
            /// bottom
            HStack {
                VStack (alignment: .leading) {
                    Text("Total")
                    Text(total()).padding(.trailing).bold().font(.title)
                }
                
                Button(
                    action: {},
                    label: {
                        Text("Finish")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        
                        Image(systemName: "cart").foregroundColor(.white)
                    }
                )
                .frame( maxWidth: .infinity )
                .padding(.all)
                .background(AppColors.blackColor)
                .cornerRadius(15.0)
            }
            .padding(.horizontal)
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    CartView(cartItems: CartItem.sampleData)
}
