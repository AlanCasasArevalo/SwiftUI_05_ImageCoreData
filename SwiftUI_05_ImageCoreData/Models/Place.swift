
import Foundation
import CoreData

class Place: NSManagedObject {
    @NSManaged public var name: String
    @NSManaged public var imageData: Data
}
