//
//  ProductDetailsView.swift
//  fashionapp
//
//  Created by Hercules Silva on 04/10/23.
//

import SwiftUI

struct ProductDetailsView: View {
    
    let product: ProductModel
    
    @Environment(\.dismiss) private var dismiss
        
    var body: some View {
        let topRadius: CGFloat = 32
        
        VStack() {
            ScrollView {
                VStack {
                    CarouselView(
                        items: [AnyView(product.imageFromResource().resizable()
                            .aspectRatio(contentMode: .fit))],
                        height: UIScreen.height(percentage: 0.4)
                    ).overlay(alignment: .topTrailing, content: {
                        HStack {
                            Button(
                                action: { dismiss() },
                                label: {
                                    Image(systemName: "chevron.left")
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                        .foregroundColor(.black)
                                    
                                }
                            )
                            .overlay(RoundedCorner())
                            .padding(.leading)
                            
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
                    })
                    
                    VStack {
                        HStack {
                            VStack (alignment: .leading) {
                                Text(product.name)
                                    .font(.system(size: 18))
                                    .bold()
                                    .foregroundColor(AppColors.blackColor)
                                Text(product.name) // brand
                                    .font(.callout).bold()
                                    .foregroundColor(AppColors.foregroundGrayColor)
                            }
                            Spacer()
                            StarReview(stars: 4)
                        }
                        
                        HStack (alignment: .bottom) {
                            SelectProductSize()
                            Spacer()
                            CustomStepper()
                        }.padding(.top)
                        
                        VStack (alignment: .leading) {
                            Text("Description").bold().foregroundColor(AppColors.blackColor).padding(.vertical)
                            
                            HStack {
                                Text("Soar out the door in the Jordan Jumpman T-Shirt. It's made from soft, comfortable fabric with an easy and relaxed fit.")
                                    .foregroundColor(AppColors.foregroundGrayColor)
                            }
                            
                            HStack {
                                Text("03 Comments").bold().foregroundColor(AppColors.blackColor)
                                Spacer()
                                PickerSortBy()
                            }
                        }
                        .padding(.bottom)
                    }
                    .padding(.horizontal)
                    .padding(.top, 22)
                    .background(.white)
                    .clipShape(.rect(
                        topLeadingRadius: topRadius,
                        topTrailingRadius: topRadius
        
                    ))
                    .background(AppColors.backgroundGrayColor)
                }
            }
            HStack {
                Text(product.formattedPrice()).padding(.trailing).bold().font(.title)
                
                NavigationLink(destination: CartView()){
                    Button(
                        action: {},
                        label: {
                            Text("Add to cart")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                    )
                    .padding(.all)
                    .frame(
                        maxWidth: .infinity
                    )
                    .background(AppColors.blackColor)
                    .foregroundColor(.white)
                    .cornerRadius(15.0)
                }
            }
            .padding(.horizontal)
            
        }.navigationBarBackButtonHidden()
        
    }
}

//struct SizeItemView: View {
//    let size: String
//    let isSelected: Bool
//
//    var body : some View {
//        Text(size)
//            .foregroundColor(isSelected ? .white : .black)
//            .padding(.all)
//            .frame(minWidth: 40, minHeight: 40)
//            .background(isSelected ? .black : .gray)
//            .cornerRadius(10.0)
//    }
//}

#Preview {
    ProductDetailsView(product: ProductModel.sampleData[0])
}
