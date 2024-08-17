//
//  Item.swift
//  OnBoardingRegistration
//
//  Created by Manzoor Ahmed on 7/29/24.
//

import SwiftUI

struct SingleItem: View {
    
    let backgroundColor: Color = Color(red:237/255, green: 239/255, blue: 238/255, opacity: 1.0)
    let priceClolor: Color = Color(red:238/255, green: 153/255, blue: 114/255, opacity: 1.0)
    
    var dish: Dish?
    
    var body: some View {
        
        VStack(alignment: .leading){
            HStack(){
                Text("\(dish?.title ?? "Missing title")")
                    .font(Font.custom("Karla-Medium", size: 18))
                    .foregroundColor(.black)
                
            }
            HStack{
                Text("\(dish?.details ?? "Missing details.")")
                    .foregroundColor(.gray)
                    .font(Font.custom("karla-Medium", size: 16))
                Spacer()
                AsyncImage(url: URL(string: "\(dish?.image ?? "")")) { image in
                   image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 150, height: 150)
                
            }
            HStack{
                Text("$\(dish?.price  ?? "0.00")")
                    .font(Font.custom("Karla-Medium", size: 25 ))
                    .foregroundColor(.gray)
                 
            }
        }
        
    }
    
}

