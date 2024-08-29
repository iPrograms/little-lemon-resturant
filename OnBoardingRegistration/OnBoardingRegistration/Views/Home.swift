//
//  MainScreen.swift
//  OnBoardingRegistration
//
//  Created by Manzoor Ahmed on 7/17/24.
//

import SwiftUI

struct Home: View {
  
    @EnvironmentObject var userSettings : DefaultStatesData
    var body: some View {
        TabView {
            MainHomeScreen()
                .font(.title)
                .tabItem {
                    Label("Home", systemImage: "house")}
            
            UserProfile()
                .font(.title)
                .tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
   
    Home().environmentObject(DefaultStatesData())
}
