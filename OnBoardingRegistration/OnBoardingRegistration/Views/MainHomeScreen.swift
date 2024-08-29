//
//  MainHomeScreen.swift
//  OnBoardingRegistration
//
//  Created by Manzoor Ahmed on 7/23/24.
//

import SwiftUI


struct MainHomeScreen: View {
    @EnvironmentObject var defaultSettings: DefaultStatesData
    
    @State var isSearching: Bool = false
    @State var searchText: String = ""
    
    var body: some View {
            VStack{
                Header()
                Hero()
                OrderCategories()
                FoodMenu(isSearching: $isSearching, searchText: $searchText).environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
            }
    }
}

#Preview {
    MainHomeScreen().environmentObject(DefaultStatesData())
}
