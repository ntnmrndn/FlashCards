// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FlashCard.swift instead.

import CoreData

enum FlashCardAttributes: String {
    case foreignWord = "foreignWord"
    case image = "image"
    case nativeWord = "nativeWord"
}

enum FlashCardRelationships: String {
    case favorites = "favorites"
}

@objc
class _FlashCard: NSManagedObject {

    // MARK: - Class methods

    class func entityName () -> String {
        return "FlashCard"
    }

    class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _FlashCard.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged
    var foreignWord: String?

    // func validateForeignWord(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var image: String?

    // func validateImage(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var nativeWord: String?

    // func validateNativeWord(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    // MARK: - Relationships

    @NSManaged
    var favorites: NSSet

}

extension _FlashCard {

    func addFavorites(objects: NSSet) {
        let mutable = self.favorites.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as Set<NSObject>)
        self.favorites = mutable.copy() as! NSSet
    }

    func removeFavorites(objects: NSSet) {
        let mutable = self.favorites.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as Set<NSObject>)
        self.favorites = mutable.copy() as! NSSet
    }

    func addFavoritesObject(value: Favorite!) {
        let mutable = self.favorites.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.favorites = mutable.copy() as! NSSet
    }

    func removeFavoritesObject(value: Favorite!) {
        let mutable = self.favorites.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.favorites = mutable.copy() as! NSSet
    }

}
