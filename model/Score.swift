import CoreData

@objc(Score)
class Score: _Score {
    private static func preficateFor(card: FlashCard, user: User) -> NSPredicate {
        return NSPredicate(format: "user = %@ AND flashCard = %@", card, user)
    }

    static func changeScoreFor(user: User, card:FlashCard, success:Bool) {
        var score: Score ?
        score = MR_findFirstWithPredicate(preficateFor(card, user: user)) {

        }
    }
	// Custom logic goes here.

}
