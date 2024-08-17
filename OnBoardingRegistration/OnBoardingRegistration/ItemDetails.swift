//
//  ItemDetails.swift
//  OnBoardingRegistration
//
//  Created by Manzoor Ahmed on 7/29/24.
//

import SwiftUI

struct ItemDetails: View {
    
    let backgroundColor: Color = .init(red: 237/255, green: 239/255, blue: 238/255, opacity: 1)
    let forgroundColor: Color = .init(red: 51/255, green: 51/255, blue: 51/255, opacity: 1)
    let priceClolor: Color = Color(red:238/255, green: 153/255, blue: 114/255, opacity: 1.0)
    let buttonColor: Color = Color(red: 244.0/255, green: 206.0/255, blue: 20.0/255, opacity: 1.0)
    
    @State   private var isClicked: Bool = false
    var dishDetails: Dish?
    
    var body: some View {
        NavigationStack{
            VStack {
                HStack {
                    Text("\(dishDetails?.title ?? "Missing title" )").bold()
                        .font(.title)
                        .foregroundColor(forgroundColor)
                }.background(.clear)
                HStack {
                    Image("\(dishDetails?.image ?? "Missing details")").resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 300)
                        .clipShape(Circle())
                        .shadow(radius: 12)
                }
               
                HStack{
                    Text("\(dishDetails?.price ?? "0.00")").foregroundColor(priceClolor)
                        .font(Font.custom("Karla-Medium", size: 25)).bold()
                    Spacer()
                }.padding(.leading, 15)
                    .padding(.bottom, 8)
                HStack{
                    Button(action: {
                        self.isClicked = true
                    }, label: {
                        Text("Order now").bold()
                            .frame(width: 320, height: 50, alignment: .center)
                            .background(buttonColor)
                            .foregroundColor(forgroundColor)
                            .cornerRadius(12.0)
                    })
                }
            }.background(backgroundColor)
                .cornerRadius(15)
                .navigationDestination(isPresented: $isClicked, destination:{
                    OnBoarding()
                })
               
        }
    }
}

#Preview {
    let dish = Dish()
    dish.title = "Wild Alaskan Salmon"
    dish.image = "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/lemonDessert%202.jpg?raw=true"
    dish.price = "12.99"
    dish.details =  "Please try it in our new salad dish"
    dish.category = "Salad"
    
    return ItemDetails(dishDetails: dish)
}
