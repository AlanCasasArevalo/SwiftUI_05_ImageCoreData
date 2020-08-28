
import SwiftUI

struct CollectionView: View {
    
    @FetchRequest(entity: Place.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Place.name, ascending: true)
    ]) var places: FetchedResults<Place>
    
    var body: some View {
        VStack  {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(self.places) { place in
                        VStack {
                            Spacer()
                            Image(uiImage: UIImage(data: place.imageData) ?? UIImage())
                                .resizable()
                                .frame(width: 250, height: 250, alignment: .center)
                                .cornerRadius(20)
                                .shadow(color: .black, radius: 5, x: 5, y: 5)
                                .padding()
                            Text(place.name)
                                .foregroundColor(Color(.darkGray))
                                .font(.system(.largeTitle, design: .rounded))                                
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
