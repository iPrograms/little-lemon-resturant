//
//  Hero.swift
//  OnBoardingRegistration
//
//  Created by manzoo Ahmed on 7/21/24.
//

import SwiftUI
struct Hero: View {
    @EnvironmentObject var defaultStaes: DefaultStatesData
    var body: some View {
        VStack(alignment:.leading){
                VStack(alignment: .leading){
                    LogoText()
                    LogoSubHeader()
                }.padding(.leading, 18)
                .padding(.top, 12)
               
                HStack {
                    HeroTextDetails().padding(.trailing, 5)
                    HeroImage()
                        
                }.padding(.leading, 18)
                .padding(.top, -38)
                .padding(.trailing, 12)
                .padding(.bottom, 20)
           
            
        }.background(Color(red: 73/255, green: 94/255, blue: 87/255, opacity: 1.0))
            .frame(width: 400, height: 280)
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    Hero().environmentObject(DefaultStatesData())
}
