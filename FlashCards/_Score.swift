// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Score.swift instead.

import CoreData

enum ScoreAttributes: String {
    case forgottenCount = "forgottenCount"
    case rememberedCount = "rememberedCount"
}

enum ScoreRelationships: String {
    case flashCard = "flashCard"
    case user = "user"
}

@objc
class _Score: NSManagedObject {

    // MARK: - Class methods

    class func entityName () -> String {
        return "Score"
    }

    class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Score.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged
    var forgottenCount: NSNumber?

    // func validateForgottenCount(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var rememberedCount: NSNumber?

    // func validateRememberedCount(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    // MARK: - Relationships

    @NSManaged
    var flashCard: FlashCard?

    // func validateFlashCard(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var user: User?

    // func validateUser(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

}

