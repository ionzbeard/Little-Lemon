
import SwiftUI

struct Menu: View {
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
           
        List {
                           // Add menu items here
                       }
                       .padding()
                   }
                   .padding()
               }
        }
        
  

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
