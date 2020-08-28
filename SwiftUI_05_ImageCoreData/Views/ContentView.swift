
import SwiftUI

struct ContentView: View {
    
    @State private var position = 0
    
    var body: some View {
        
        VStack (alignment: .center) {
            Picker(selection: self.$position, label: Text("")) {
                Image(systemName: "flame.fill").tag(0)
                    .foregroundColor(.blue)
                Image(systemName: "camera.fill").tag(1)
                    .foregroundColor(Color(.cyan))
                Image(systemName: "ant.fill").tag(2)
                    .foregroundColor(.green)
            }
            .pickerStyle(SegmentedPickerStyle())
            .background(LinearGradient(gradient: Gradient(colors: [.green, .red]), startPoint: .trailing, endPoint: .leading))
            .frame(height: 80, alignment: .center)
            
            if self.position == 0 {
                CollectionView()
            } else if self.position == 1 {
                SaveView()
            } else if self.position == 2 {
                TopBarView()
            }
            Spacer()

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
