
import SwiftUI
import Foundation
import CoreData

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var menuItems: [MenuItem] = []
    @State private var searchText: String = ""
    
    func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)
        } else {
            let predicateFormat = "title CONTAINS[c] %@"
            return NSPredicate(format: predicateFormat, argumentArray: [searchText])
        }
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
           return [NSSortDescriptor(key: "title",
                                     ascending: true,
                                     selector:
                                       #selector(NSString.localizedStandardCompare))]
       }

    let serverURL = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
    
    
    var body: some View {
        VStack{
            
            Text("Little Lemon Restaurant")
                .font(.title)
                .padding()
            
            Text("Chicago")
                .font(.title2)
                .padding()
            
            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                .font(.headline)
                .padding()
            
            TextField("Search menu", text: $searchText)
                .font(.system(size: 16))
                  .foregroundColor(.black)
                  .padding(10)
                  .background(Color.white)
                  .border(Color.black, width: 1)
                  .cornerRadius(8)
                  
                
            FetchedObjects(predicate: buildPredicate(),sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                List{
                    ForEach(dishes) { dish in
                        HStack{
                            Text("\(dish.title!) - $\(dish.price!)")
                            AsyncImage(url: URL(string: dish.image!)) { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                ProgressView()
                            }
                            .clipShape(Rectangle())
                            .frame(minHeight: 150)
                        }
                    }
                    
                }
                
            }       .padding()
        }
        .onAppear() {
            
                getMenuData()
     
            }
            
        
    }
func getMenuData() {
    
PersistenceController.shared.clear()
            
    let url = URL(string: serverURL)
            
    let request = URLRequest(url: url!)
            
    let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
                
        if let data = data {
                    
        let decoder = JSONDecoder()
        if let fullMenu = try? decoder.decode(MenuList.self, from: data) {
                        
        for dish in fullMenu.menu {
        let newDish = Dish(context: viewContext)
                            
            newDish.title = dish.title
            newDish.price = dish.price
            newDish.image = dish.image
                            
        }
            try? viewContext.save()
        }   else {
                print(error.debugDescription.description)
                 }
        }   else {
                print(error.debugDescription.description)
                 }
             }
        
            dataTask.resume()
        }
    }




struct Menu_Previews: PreviewProvider {
   static var previews: some View {
       Menu().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)

   }
        }
        
        
        
    
