//
//  LoginButton.swift
//  OnBoardingRegistration
//  Long in Button
//  Created by Manzoor Ahmed on 7/22/24.
//

import SwiftUI

struct LoginButton: View {
    @EnvironmentObject var defaultStates: DefaultStatesData
    var body: some View {
        VStack {
            Text("Log in ")
                .padding(.vertical, 25)
                .frame(width: 350, height: 50, alignment: .center)
                .background(defaultStates.yellowBackGroundColor)
                .font(Font.custom("Karla-Medium", size: 20)).bold()
                .foregroundColor(defaultStates.greenForGroundColor)
                
        }.padding(.vertical, 50)
    }
}

#Preview {
    // Inject DefaultSateData to the environment
    LoginButton().environmentObject(DefaultStatesData())
}
