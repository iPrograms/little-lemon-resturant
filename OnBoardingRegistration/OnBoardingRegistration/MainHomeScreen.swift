//
//  MainHomeScreen.swift
//  OnBoardingRegistration
//
//  Created by Manzoor Ahmed on 7/23/24.
//

import SwiftUI


struct MainHomeScreen: View {
    
    var body: some View {
            VStack{
                Header()
                Hero()
                OrderCategories()
                FoodMenu().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
            }
    }
}

#Preview {
    MainHomeScreen().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
