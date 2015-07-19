import CoreData

@objc(Score)
class Score: _Score {
    private static func preficateFor(card: FlashCard, user: User) -> NSPredicate {
        return NSPredicate(format: "user = %@ AND flashCard = %@", card, user)
    }

    static func changeScoreFor(user: User, card:FlashCard, success:Bool) {
        var score: Score? = MR_findFirstWithPredicate(preficateFor(card, user: user))
        if score == nil {
            score = Score.MR_createEntity()
        }
        //XXX figure our why no Value property was created
        if success {
            score!.rememberedCount = score!.rememberedCount!.integerValue + 1
        } else {
            score!.forgottenCount = score!.forgottenCount!.integerValue + 1
        }
        NSManagedObjectContext.defaultContext().MR_saveToPersistentStoreAndWait()
        //XXX trigger request
    }
}

