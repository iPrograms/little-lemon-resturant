//
//  LogoText.swift
//  OnBoardingRegistration
//
//  Created by Manzoor on 7/21/24.
//

import SwiftUI
struct LogoText: View {
    
    var body: some View {
        HStack{
            Text("Little lemon")
                .foregroundColor(Color.yellowBackGroundColor)
                .font(Font.custom("MarkaziText-Regular", size: 49))
        }
    }
}
#Preview {
    LogoText()
}
