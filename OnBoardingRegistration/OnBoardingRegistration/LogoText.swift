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
                .foregroundColor(Color(red: 244.0/255, green: 206.0/255, blue: 20.0/255, opacity: 1.0))
                .font(Font.custom("MarkaziText-Regular", size: 49))
        }
    }
}
#Preview {
    LogoText()
}
