//
//  HeroImage.swift
//  OnBoardingRegistration
//
//  Created by Manzoor Ahmed on 7/21/24.
//

import SwiftUI


struct HeroImage: View {
    
    var body: some View {
        Image("Grilled fish")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 140, height: 171)
            .cornerRadius(16)
    }
}

#Preview {
    HeroImage()
}
