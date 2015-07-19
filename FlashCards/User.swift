import CoreData

@objc(User)
class User: _User {
    private static var _userObjectId: NSManagedObjectID? //XXX persist
    static var currentUser: User? {
        get {
            if let objectId = _userObjectId {
                return NSManagedObjectContext.MR_defaultContext().objectWithID(objectId) as? User
            }
            return nil
        }
        set {
            if let newValue = newValue {
                if newValue.objectID.temporaryID {
                    NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
                }
                _userObjectId = newValue.objectID
            } else {
                _userObjectId = nil
            }
        }
    }
	// Custom logic goes here.

    static func userWith(name: String) -> User {
        return User.MR_findFirstOrCreateByAttribute("email", withValue: name) //XXX email or name ?
    }
}
