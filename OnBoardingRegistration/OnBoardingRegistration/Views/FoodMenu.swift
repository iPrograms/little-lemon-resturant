import CoreData
import SwiftUI

struct FoodMenu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    // Track user actions
    @State private var clickedItem: Dish?
    @State private var showDetails: Bool = false
    @State private var fetched: Bool = false
    @Binding var isSearching: Bool
    @Binding var searchText: String
   
    var body: some View {
        NavigationStack {
            FetchedObjects(predicate: buildPredicates(),
                           sortDescriptors: buildSortDescriptors())
            { (dishes: [Dish]) in
                    List {
                        ForEach(dishes, id: \.self) { dish in
                            SingleItem(dish: dish)
                        }.onTapGesture {
                            showDetails = true
                        }
                    }
                    //.searchable(text: $searchText, isPresented: $isSearching, placement: .toolbar)
                    .navigationDestination(isPresented: $showDetails) {
                        if let dish = clickedItem {
                            ItemDetails(dishDetails: dish
                            )
                        }
                    }
                    .task {
                        if fetched == false {
                            do{
                                try await fetchData(viewContext)
                                fetched = true
                            }catch {
                                print("\(error).localizedDescription")
                            }
                        }
                    }
                }.navigationTitle("Menu Items")
                .navigationBarBackButtonHidden(true)
                
            }.scrollIndicatorsFlash(onAppear: true)
    }
    // Fetch data from core data context
    private func fetchData(_ coreDataContext: NSManagedObjectContext) async throws  {
        // Clean up 
        PersistenceController.shared.clear()
        print("Cleared data\n")
        
        // Fetch new data from url 
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        //let request = URLRequest(url: url)
        let urlSession = URLSession.shared
        let decoder = JSONDecoder()
        
        do {
            let (data, _ ) = try await urlSession.data(from: url)
            let menuList = try decoder.decode(MenuItem.self, from: data)
            // Creat a new item from the menu
            let fullMenuItems = menuList.menu
            // Show all menu items
            for item in fullMenuItems {
                let newItem = Dish(context: viewContext)
                newItem.title = item.title
                newItem.image = item.image
                newItem.details = item.description
                newItem.category = item.category
                newItem.price = item.price
                
                print("Item title: \(newItem.title ?? "Missing title")")
                print("Item image: \(newItem.image ?? "Missing image")")
                print("Item details: \(newItem.details ?? "Missing details")")
                print("Item category: \(newItem.category ?? "Missing category")")
                print("Item price: \(newItem.price ?? "Missing price")")
            }
            // Save
            if viewContext.hasChanges {
                do {
                    try viewContext.save()
                    print("data saved.")
                  
                } catch {
                    throw NSError()
                   
                }
            }
            
        } catch {
            print("Error fetching data: \(error.localizedDescription)")
        }
    }
    
    // Sort Descriptors
    private func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    // Predicates
    private func buildPredicates() -> NSPredicate {
        self.searchText.isEmpty ? NSPredicate(value: true) :
    }
}

#Preview {
    @State var isSearching: Bool = false
    @State var searchText: String = ""
    return FoodMenu(isSearching: $isSearching, searchText: $searchText)
        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
