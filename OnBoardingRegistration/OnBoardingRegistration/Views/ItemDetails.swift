//
//  ItemDetails.swift
//  OnBoardingRegistration
//
//  Created by Manzoor Ahmed on 7/29/24.
//  View for showing Item details

import SwiftUI

struct ItemDetails: View {
    @State   private var isClicked: Bool = false
    var dishDetails: Dish?
    
    var body: some View {
        NavigationStack{
            VStack {
                HStack {
                    Text("\(dishDetails?.title ?? "Missing title" )").bold()
                        .font(.title)
                        .foregroundColor(Color.greenForGroundColor)
                }.background(.clear)
                HStack {
                    Image("\(dishDetails?.image ?? "Missing details")").resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 300)
                        .clipShape(Circle())
                        .shadow(radius: 12)
                }
               
                HStack{
                    Text("\(dishDetails?.price ?? "0.00")").foregroundColor(Color.priceClolor)
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
                            .background(Color.buttonColor)
                            .foregroundColor(Color.greenForGroundColor)
                            .cornerRadius(12.0)
                    })
                }
            }.background(Color.yellowBackGroundColor)
                .cornerRadius(15)
                .navigationDestination(isPresented: $isClicked, destination:{
                    OnBoarding()
                })
        }
    }
}
