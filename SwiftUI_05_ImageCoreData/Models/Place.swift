
import Foundation
import CoreData

class Place: NSManagedObject, Identifiable  {
    @NSManaged public var name: String
    @NSManaged public var imageData: Data
}
