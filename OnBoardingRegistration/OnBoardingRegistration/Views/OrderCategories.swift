//
//  OrderCategories.swift
//  OnBoardingRegistration
//
//  Created by Manzoor Ahmed on 7/21/24.
//  View for showing food categories 

import SwiftUI

extension String: Identifiable {
    public var id: String {
        self
    }
}

struct OrderCategories: View {
   
    @EnvironmentObject private var defatulSates: DefaultStatesData
    
    // Need to change to Color extention 
    let backgroundColor: Color = Color(red: 237/255, green: 239/255, blue: 238/255, opacity: 1.0)
    let foregroundColor: Color = Color(red: 73/255, green: 94/255, blue: 87/255, opacity: 1.0)
    
    var categories = ["Starter", "Desserts", "Drinks", "Specials"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("ORDER FOR DELIVERY!")
                .font(Font.custom("Karla-Medium", size: 20)).bold()
                .padding(.bottom,8)
                .padding(.top, 8)

            ScrollView(.horizontal) {
                HStack(alignment: .top, spacing: 5) {
                    ForEach(categories) { category in
                        ZStack{
                            RoundedRectangle(cornerRadius: 12, style: .circular)
                                .fill(backgroundColor)
                                .frame(width: 90, height: 45)
                                
                            Text(category)
                                .fixedSize()
                                .font(Font.custom("Karla-Medium", size: 18))
                                .frame(width: 80, height: 40)
                                .cornerRadius(12)
                                .background(backgroundColor)
                                .foregroundColor(foregroundColor)   
                        }
                    }
                }
            }
        }.padding(.leading, 20)
    }
}

#Preview {
    OrderCategories().environmentObject(DefaultStatesData())
}
