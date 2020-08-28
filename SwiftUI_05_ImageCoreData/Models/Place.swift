
import Foundation
import CoreData

class Places: NSManagedObject {
    @NSManaged public var name: String
    @NSManaged public var imageData: Data
}
