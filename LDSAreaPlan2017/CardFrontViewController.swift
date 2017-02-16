//
//  CardFrontViewController.swift
//  LDSAreaPlan2017
//
//  Created by Daniel Dickson on 2/8/17.
//  Copyright © 2017 Daniel Dickson. All rights reserved.
//

import UIKit

class CardFrontViewController: UIViewController {

    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var liveTextLabel: UILabel!
    @IBOutlet weak var gatherTextLabel: UILabel!
    @IBOutlet weak var careTextLabel: UILabel!
    @IBOutlet weak var enableTextLabel: UILabel!
    @IBOutlet weak var myGoalsButton: UIButton!
    @IBOutlet weak var familyGoalsButton: UIButton!
    
    static let flipPresentAnimationController = FlipPresentAnimationController()
    static let flipDismissAnimationController = FlipDismissAnimationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        liveTextLabel.text = "\u{2022}Strengthen ourselves and our families by receiving and keeping saving ordinances.\n\n\u{2022}Strengthen our faith in Heavenly Father and His Son Jesus Christ and His Atonement by regularly studying the Book of Mormon and by honoring the Sabbath Day"
        gatherTextLabel.text = "\u{2022}Teach repentance and baptize converts\n\n\u{2022}Rescue less-active members"
        careTextLabel.text = "\u{2022}Build spiritual and temporal self-reliance.\n\n\u{2022}Live the law of the fast and serve others."
        enableTextLabel.text = "\u{2022}Find family names.\n\n\u{2022}Take family names to the temple for ordinances and teach others to do the same."

        myGoalsButton.setTitleColor(UIColor.myBlueColor(), for: .normal)
        familyGoalsButton.setTitleColor(UIColor.myRedColor(), for: .normal)
        
        familyGoalsButton.titleLabel?.numberOfLines = 1
        familyGoalsButton.titleLabel?.adjustsFontSizeToFitWidth = true
        familyGoalsButton.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
        
        myGoalsButton.titleLabel?.numberOfLines = 1
        myGoalsButton.titleLabel?.adjustsFontSizeToFitWidth = true
        myGoalsButton.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
    }

    
    @IBAction func myGoalsButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toMyGoals", sender: self)
    }
    
    @IBAction func familyGoalsButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toFamilyGoals", sender: self)
    }
    
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toMyGoals" {
            let destinationViewController = segue.destination as? CardBackViewController
            destinationViewController?.isMyGoals = true
            destinationViewController?.transitioningDelegate = self
        } else if segue.identifier == "toFamilyGoals" {
            let destinationViewController = segue.destination as? CardBackViewController
            destinationViewController?.isMyGoals = false
            destinationViewController?.transitioningDelegate = self
        }
    }

}

extension CardFrontViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        CardFrontViewController.flipPresentAnimationController.originFrame = cardView.frame
        return CardFrontViewController.flipPresentAnimationController
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            CardFrontViewController.flipDismissAnimationController.destinationFrame = cardView.frame
        return CardFrontViewController.flipDismissAnimationController
    }
}
