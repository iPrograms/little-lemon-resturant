import CoreData
import SwiftUI

struct Item: Decodable {
    let title: String
    let price: String
    let image: String
    let description: String
    let category: String
}

struct MenuItem: Decodable {
    let menu: [Item]
}

struct FoodMenu: View {
    @Environment(\.managedObjectContext) private var viewContext
   
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Dish.title, ascending: true)],
        animation: .default
    ) private var items: FetchedResults<Dish>
    
    @State private var clickedItem: Dish?
    @State private var showDetails: Bool = false
    @State private var searchText = ""
    @State private var fetched: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(items) { dish in
                            SingleItem(dish: dish).environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
                    }.onTapGesture {
                        showDetails = true
                    }
                    }.navigationDestination(isPresented: $showDetails) {
                        if let dish = clickedItem {
                            ItemDetails(dishDetails: dish
                            ).environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
                        }
                    }
                }.navigationTitle("Menu Items")
            }.onAppear(perform: {
            if !fetched{
                print("fetching...")
                fetchData()
            }else {
                print("data fetched already")
            }
        })
    }
    
    private func fetchData() {
        PersistenceController.shared.clear()
        print("Cleared data\n")
        
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("Can't fetch data")
                return
            }
            do {
                // Decode
                let menuList = try JSONDecoder().decode(MenuItem.self, from: data)
                // Creat a new item from the menu
                for item in menuList.menu {
                    let newItem = Dish(context: viewContext)
                    newItem.title = item.title
                    newItem.image = item.image
                    newItem.details = item.description
                    newItem.category = item.category
                    newItem.price = item.price
                    
                    print("title: \(newItem.title ?? "Missing title")")
                    print("image: \(newItem.image ?? "Missing image")")
                    print("details: \(newItem.details ?? "Missing details")")
                    print("category: \(newItem.category ?? "Missing category")")
                    print("price: \(newItem.price ?? "Missing price")")
                }
                // Save
                if viewContext.hasChanges{
                    do {
                        try viewContext.save()
                        print("data saved.")
                        fetched = true // don't save again
                    } catch {
                        print(error.localizedDescription)
                    }
                }
                
            } catch {
                print("Error fetching data: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
    private func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
}

#Preview {
    FoodMenu()
        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
