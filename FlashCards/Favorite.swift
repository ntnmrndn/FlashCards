import Foundation
import CoreData


@objc(Favorite)
class Favorite: _Favorite {
    private static func favoritePredicate(card: FlashCard) -> NSPredicate {
        return NSPredicate(format: "user = %@ AND flashCard = %@", User.currentUser!, card)
    }

    static func changeFavorite(card:FlashCard, isFavorite: Bool) {
        if isFavorite {
            var favorite = Favorite.MR_createEntity()
            favorite.user = User.currentUser
            favorite.flashCard = card
        } else {
            Favorite.MR_deleteAllMatchingPredicate(favoritePredicate(card))
        }
    }

    
    static func isFavorite(card :FlashCard) -> Bool {
        return Favorite.MR_countOfEntitiesWithPredicate(favoritePredicate(card)) > 0
    }
}
