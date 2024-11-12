//
//  HeroTextDetails.swift
//  OnBoardingRegistration
//
//  Created by Manzoor Ahmed on 7/21/24.
//

import SwiftUI

struct HeroTextDetails: View {
    var body: some View {
        HStack{
            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                .foregroundColor(Color.white)
                .font(Font.custom("Karla-Medium", size: 18))
        }
    }
}

#Preview {
    HeroTextDetails()
}
