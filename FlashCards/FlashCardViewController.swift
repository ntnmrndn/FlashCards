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

class FlashCardViewController: UIViewController, MDCSwipeToChooseDelegate {
    @IBOutlet var foreignWordLabel: UILabel! //XXX migrate to xib ?
    @IBOutlet var nativeWordLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var hideVisualEffect: UIVisualEffectView!
    @IBOutlet var finishView: UIView!

    var flashCards: [FlashCard]! //XXX better use of memory, can't make it const because would be instantiated before core data setup
    var currentCard: FlashCard!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        flashCards = FlashCard.MR_findAll() as! [FlashCard]
//        var options = MDCSwipeToChooseViewOptions()
//        options.delegate = self
//        options.likedText = "Remembered"
//        options.likedColor = UIColor.blueColor()
//        options.nopeText = "Forgot"
//        options.onPan = { state -> Void in
//            if state.thresholdRatio != 1 {
//                return
//            }
//            if state.direction == MDCSwipeDirection.Left {
//                self.userForgot()
//            } else if state.direction == MDCSwipeDirection.Right {
//                self.userRemembered()
//            }
//        }
//        var view = MDCSwipeToChooseView(frame: self.view.bounds, options: options)
//        view.imageView.image = UIImage(named: "photo.png")
        self.view.addSubview(view)
    }


    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
           nextCard()
    }


    @IBAction func showForeignWord() {
        UIView.animateWithDuration(NSTimeInterval(0.5), animations: { () -> Void in
            self.hideVisualEffect.alpha = 0
        }, completion: { (_) -> Void in
            self.finishView.hidden = false
        })
     }


    @IBAction func userRemembered() {
        nextCard()
    }


    @IBAction func userForgot() {
        nextCard()
    }

    
    @IBAction func nextCard() {
        self.finishView.hidden = true
        self.hideVisualEffect.alpha = 1
        currentCard = flashCards.randomObject
        nativeWordLabel.text = currentCard.nativeWord
        foreignWordLabel.text = currentCard.foreignWord
        imageView.hnk_setImageFromURL(currentCard.imageURL)
    }
}

