// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Favorite.swift instead.

import CoreData

enum FavoriteRelationships: String {
    case flashCard = "flashCard"
    case user = "user"
}

@objc
class _Favorite: NSManagedObject {

    // MARK: - Class methods

    class func entityName () -> String {
        return "Favorite"
    }

    class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Favorite.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    // MARK: - Relationships

    @NSManaged
    var flashCard: FlashCard?

    // func validateFlashCard(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var user: User?

    // func validateUser(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

}

