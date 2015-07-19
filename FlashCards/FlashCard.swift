import Foundation
import CoreData

@objc(FlashCard)
class FlashCard: _FlashCard {
    var imageURL: NSURL {
        return NSURL(string: "http://0.0.0.0:3000/\(image!)")!
    }


    static func flashCardFromJSON(JSON: Dictionary<String, String>) -> FlashCard {
        var flashCard = FlashCard.MR_createEntity()
        flashCard.image = JSON["image"]
        flashCard.nativeWord = JSON["nativeWord"]
        flashCard.foreignWord = JSON["foreignWord"]
        return flashCard
    }


    /// Prepare coredata by feeding in data if necessary
    static func initFromJSON() {
        if FlashCard.MR_countOfEntities() == 0 {
            let path = NSBundle.mainBundle().pathForResource("data", ofType: "json")
            let jsonData = NSData(contentsOfFile: path!)
            var jsonResult = NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.MutableContainers, error: nil) as! [Dictionary<String, String>]
            for flashCardJSON in jsonResult {
                FlashCard.flashCardFromJSON(flashCardJSON)
            }
            NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
        }
    }

}
