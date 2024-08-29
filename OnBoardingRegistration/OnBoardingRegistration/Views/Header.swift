//
//  MainScreen.swift
//  OnBoardingRegistration
//  The Header for Little Lemon Resturant
//  Created by Manzoor Ahmed on 7/21/24.
//

import SwiftUI

struct Header: View {
    @State private var showProfile = false
    
    var body: some View {
        NavigationStack{
            HStack(alignment: .center, spacing: 40){
                Image("Logo").resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 250, height: 50)
                    .clipped()
                   
                Image("Profile").resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipped()
                    .onTapGesture(perform: {
                        showProfile = true
                        print("Show profile: \(showProfile)")
                    })
            }
            .navigationDestination(isPresented: $showProfile, destination: {
                UserProfile()
            })
        }
    }
}


#Preview {
  Header()
}
