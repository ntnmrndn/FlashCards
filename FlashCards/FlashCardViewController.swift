//
//  ViewController.swift
//  FlashCards
//
//  Created by Antoine Marandon on 19/07/2015.
//  Copyright (c) 2015 Antoine Marandon. All rights reserved.
//

import UIKit
import Haneke
import MDCSwipeToChoose
import CoreData

class FlashCardViewController: UIViewController, MDCSwipeToChooseDelegate {
    @IBOutlet var foreignWordLabel: UILabel!
    @IBOutlet var nativeWordLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var hideVisualEffect: UIVisualEffectView!
    @IBOutlet var finishView: UIView!
    @IBOutlet var favoriteSwitch: UISwitch!

    var flashCards: [FlashCard]! //XXX should have better use of memory, can't make it const because would be instantiated before core data setup
    var currentCard: FlashCard!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        flashCards = FlashCard.MR_findAll() as! [FlashCard]
        Notification.userLoggedIn.addObserver(self, selector: "nextCard")
    }


    deinit {
        Notification.removeObserver(self)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        if User.currentUser == nil {
            let loginViewController = R.storyboard.main.loginViewController!
            presentViewController(loginViewController, animated: true, completion: nil)
        } else {
            nextCard()
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }


    @IBAction func showForeignWord() {
        UIView.animateWithDuration(NSTimeInterval(0.5), animations: { () -> Void in
            self.hideVisualEffect.alpha = 0
        }, completion: { (_) -> Void in
            self.finishView.hidden = false
        })
     }


    func setupFavorite(isFavorite: Bool) {
        favoriteSwitch.on = isFavorite
    }


    @IBAction func toggleFavorite() {
        Favorite.changeFavorite(currentCard, isFavorite: favoriteSwitch.on)
        NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
    }


    @IBAction func userRemembered() {
        //XXX  Score.changeScoreFor(User.currentUser!, card: currentCard, success: true)
        nextCard()
    }


    @IBAction func userForgot() {
        //XXX   Score.changeScoreFor(User.currentUser!, card: currentCard, success: false)
        nextCard()
    }

    
    @IBAction func nextCard() {
        self.finishView.hidden = true
        self.hideVisualEffect.alpha = 1
        currentCard = flashCards.randomObject
        nativeWordLabel.text = currentCard.nativeWord
        foreignWordLabel.text = currentCard.foreignWord
        imageView.hnk_setImageFromURL(currentCard.imageURL)
        setupFavorite(Favorite.isFavorite(currentCard))
    }
}

