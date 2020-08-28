

import SwiftUI

struct SaveView: View {
    
    @Environment(\.managedObjectContext) var context
    @State private var imageData: Data = .init(capacity: 0)
    @State private var showMenu: Bool = false
    @State private var imagePicker: Bool = false
    @State private var source: UIImagePickerController.SourceType = .camera
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: ImagePicker(show: self.$imagePicker, image: self.$imageData, source: self.source), isActive: self.$imagePicker) {
                    Text("")
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                
                if self.imageData.count != 0 {
                    Image(uiImage: UIImage(data: self.imageData) ?? UIImage())
                        .resizable()
                        .frame(width: 250, height: 250)
                        .cornerRadius(15)
                }
                
                Button(action: {
                    self.showMenu.toggle()
                }) {
                    Text("Cargar imagen")
                }
                .actionSheet(isPresented: self.$showMenu) {
                    ActionSheet(title: Text("Mennu"), message: Text("Selecciona una opcion"), buttons: [
                        .default(Text("Camara"), action: {
                            self.source = .camera
                            self.imagePicker.toggle()
                        }),
                        .default(Text("Libreria"), action: {
                            self.source = .photoLibrary
                            self.imagePicker.toggle()
                        }),
                        .default(Text("Cancelar"))
                    ])
                }
                
                Button(action: {
                    self.save()
                }) {
                    Text("Guardar imagen")
                }
            }
        }
    }
}

extension SaveView {
    func save () {
        let newPlace = Place(context: self.context)
        newPlace.name = "Colombia"
        newPlace.imageData = self.imageData
        
        do {
            try self.context.save()
            print("Se ha guardado correctamente")

        } catch let error {
            print(error.localizedDescription)
        }
        
    }
}

struct SaveView_Previews: PreviewProvider {
    static var previews: some View {
        SaveView()
    }
}
