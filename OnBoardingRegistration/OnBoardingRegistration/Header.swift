//
//  MainScreen.swift
//  OnBoardingRegistration
//  The Header for Little Lemon Resturant
//  Created by Manzoor Ahmed on 7/21/24.
//

import SwiftUI

struct Header: View {
    var body: some View {
    
        HStack(alignment: .center, spacing: 40){
            Image("Logo").resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 50)
                .clipped()
            Image("Profile").resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipped()
        }
    }
}


#Preview {
  Header()
}
