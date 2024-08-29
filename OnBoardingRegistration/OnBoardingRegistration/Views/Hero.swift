//
//  Hero.swift
//  OnBoardingRegistration
//
//  Created by manzoo Ahmed on 7/21/24.
//

import SwiftUI
struct Hero: View {
    @EnvironmentObject var defaultStaes: DefaultStatesData
    
    @State private var isSearhing: Bool = false
    @State var searchClicked: Bool = false
    @State var searchText = ""
    
    
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
            // Check if user is logged in
            // When clicked set
            if defaultStaes.isLoggedIn {
                HStack{
                    ZStack{
                        Circle().frame(width: 50, height: 50)
                        Image(systemName: "magnifyingglass.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                    }.onTapGesture {
                        self.isSearhing = true
                        print("Searched button clicked")
                    }
                }.padding()
            }
           
        }.background(Color(red: 73/255, green: 94/255, blue: 87/255, opacity: 1.0))
            //.frame(width: 400, height: 300)
        .navigationBarBackButtonHidden(true)
        
    }
}
#Preview {
    Hero().environmentObject(DefaultStatesData())
}
