//
//  CardBackViewController.swift
//  LDSAreaPlan2017
//
//  Created by Daniel Dickson on 2/9/17.
//  Copyright © 2017 Daniel Dickson. All rights reserved.
//

import UIKit

class CardBackViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    
    @IBOutlet weak var goalsTitleLabel: UILabel!
    @IBOutlet weak var liveImageView: UIImageView!
    @IBOutlet weak var gatherImageView: UIImageView!
    @IBOutlet weak var careImageView: UIImageView!
    @IBOutlet weak var enableImageView: UIImageView!
    @IBOutlet weak var liveTextView: UITextView!
    @IBOutlet weak var gatherTextView: UITextView!
    @IBOutlet weak var careTextView: UITextView!
    @IBOutlet weak var enableTextView: UITextView!
    @IBOutlet weak var liveUIView: UIView!
    @IBOutlet weak var gatherUIView: UIView!
    @IBOutlet weak var careUIView: UIView!
    @IBOutlet weak var enableUIView: UIView!
    @IBOutlet var inputUIView: UIView!
    @IBOutlet weak var inputImageView: UIImageView!
    @IBOutlet weak var inputUIView2: UIView!
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet var gatherInputView: UIView!
    @IBOutlet weak var inputGatherImageView: UIImageView!
    @IBOutlet weak var gatherUIView2: UIView!
    @IBOutlet weak var inputGatherTextView: UITextView!
    @IBOutlet var careInputView: UIView!
    @IBOutlet weak var inputCareImageView: UIImageView!
    @IBOutlet weak var careUIView2: UIView!
    @IBOutlet weak var inputCareTextView: UITextView!
    @IBOutlet var enableInputView: UIView!
    @IBOutlet weak var inputEnableImageView: UIImageView!
    @IBOutlet weak var enableUIView2: UIView!
    @IBOutlet weak var inputEnableTextView: UITextView!
    
    var blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    var isMyGoals: Bool?
    var myLiveGoal: String = ""
    var myGatherGoal: String = ""
    var myCareGoal: String = ""
    var myEnableGoal: String = ""
    var familyLiveGoal: String = ""
    var familyGatherGoal: String = ""
    var familyCareGoal: String = ""
    var familyEnableGoal: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        liveTextView.delegate = self
        gatherTextView.delegate = self
        careTextView.delegate = self
        enableTextView.delegate = self
        inputTextView.delegate = self
        inputGatherTextView.delegate = self
        inputCareTextView.delegate = self
        inputEnableTextView.delegate = self
        
        liveTextView.inputAccessoryView = inputUIView
        gatherTextView.inputAccessoryView = gatherInputView
        careTextView.inputAccessoryView = careInputView
        enableTextView.inputAccessoryView = enableInputView
        
        let uiViews: [UIView] = [liveUIView, gatherUIView, careUIView, enableUIView]
        let imageViews: [UIImageView] = [liveImageView, inputImageView, gatherImageView, inputGatherImageView, careImageView, inputCareImageView, enableImageView, inputEnableImageView]
        let textViews: [UITextView] = [liveTextView, inputTextView, gatherTextView, inputGatherTextView, careTextView, inputCareTextView, enableTextView, inputEnableTextView]
        
        setupImages()
        updateWithText()
        
        if let isMyGoals = isMyGoals {
            if isMyGoals {
                goalsTitleLabel.text = "My Goals"
                goalsTitleLabel.textColor = UIColor.myBlueColor()
                updateBackgroundColors(uiViews: uiViews, uiImageViews: imageViews, uiTextViews: textViews, color: UIColor.myBlueColor())
            } else {
                goalsTitleLabel.text = "Family Goals"
                goalsTitleLabel.textColor = UIColor.myRedColor()
                updateBackgroundColors(uiViews: uiViews, uiImageViews: imageViews, uiTextViews: textViews, color: UIColor.myRedColor())
            }
        }
    }
    
    func updateWithText() {
        let myLiveGoal = UserDefaults.standard.object(forKey: "myLiveGoal") as? String
        let myGatherGoal = UserDefaults.standard.object(forKey: "myGatherGoal") as? String
        let myCareGoal = UserDefaults.standard.object(forKey: "myCareGoal") as? String
        let myEnableGoal = UserDefaults.standard.object(forKey: "myEnableGoal") as? String
        let familyLiveGoal = UserDefaults.standard.object(forKey: "familyLiveGoal") as? String
        let familyGatherGoal = UserDefaults.standard.object(forKey: "familyGatherGoal") as? String
        let familyCareGoal = UserDefaults.standard.object(forKey: "familyCareGoal") as? String
        let familyEnableGoal = UserDefaults.standard.object(forKey: "familyEnableGoal") as? String
        
        if let myLiveGoal = myLiveGoal {
            self.myLiveGoal = myLiveGoal
        }
        if let myGatherGoal = myGatherGoal {
            self.myGatherGoal = myGatherGoal
        }
        if let myCareGoal = myCareGoal {
            self.myCareGoal = myCareGoal
        }
        if let myEnableGoal = myEnableGoal {
            self.myEnableGoal = myEnableGoal
        }
        if let familyLiveGoal = familyLiveGoal {
            self.familyLiveGoal = familyLiveGoal
        }
        if let familyGatherGoal = familyGatherGoal {
            self.familyGatherGoal = familyGatherGoal
        }
        if let familyCareGoal = familyCareGoal {
            self.familyCareGoal = familyCareGoal
        }
        if let familyEnableGoal = familyEnableGoal {
            self.familyEnableGoal = familyEnableGoal
        }
        
        if let isMyGoals = isMyGoals {
            if isMyGoals {
                liveTextView.text = self.myLiveGoal
                gatherTextView.text = self.myGatherGoal
                careTextView.text = self.myCareGoal
                enableTextView.text = self.myEnableGoal
            } else {
                liveTextView.text = self.familyLiveGoal
                gatherTextView.text = self.familyGatherGoal
                careTextView.text = self.familyCareGoal
                enableTextView.text = self.familyEnableGoal
            }
        }
    }
    
    func updateInputTextViewWithText(textView: UITextView, myGoalText: String, familyGoalText: String) {
        if let isMyGoals = isMyGoals {
            if isMyGoals {
                textView.text = myGoalText
            } else {
                textView.text = familyGoalText
            }
        }
    }
    
    func updateBackgroundColors(uiViews: [UIView], uiImageViews: [UIImageView], uiTextViews: [UITextView], color: UIColor) {
        for view in uiViews {
            view.backgroundColor = color
        }
        for imageView in uiImageViews {
            imageView.backgroundColor = color
        }
        for textView in uiTextViews {
            textView.backgroundColor = color
        }
    }
    
    func updateInputBackgroundColors(uiView: UIView) {
        if let isMyGoals = isMyGoals {
            if isMyGoals {
                uiView.backgroundColor = UIColor.myBlueColor()
            } else {
                uiView.backgroundColor = UIColor.myRedColor()
            }
        }
    }
    
    func setupImages() {
        if let isMyGoals = isMyGoals {
            if isMyGoals {
                liveImageView.image = UIImage(named: "Live2")
                inputImageView.image = UIImage(named: "Live2")
                gatherImageView.image = UIImage(named: "Gather2")
                inputGatherImageView.image = UIImage(named: "Gather2")
                careImageView.image = UIImage(named: "Care2")
                inputCareImageView.image = UIImage(named: "Care2")
                enableImageView.image = UIImage(named: "Enable2")
                inputEnableImageView.image = UIImage(named: "Enable2")
            } else {
                liveImageView.image = UIImage(named: "Live")
                inputImageView.image = UIImage(named: "Live")
                gatherImageView.image = UIImage(named: "Gather")
                inputGatherImageView.image = UIImage(named: "Gather")
                careImageView.image = UIImage(named: "Care")
                inputCareImageView.image = UIImage(named: "Care")
                enableImageView.image = UIImage(named: "Enable")
                inputEnableImageView.image = UIImage(named: "Enable")
            }
        }
    }
    
    func saveGoalText(text: String, key: String) {
        if let isMyGoals = isMyGoals {
            if isMyGoals {
                UserDefaults.standard.set(text, forKey: "my\(key)")
            } else {
                UserDefaults.standard.set(text, forKey: "family\(key)")
            }
        }
    }
    
    func addBlurEffect() {
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            self.view.backgroundColor = UIColor.clear
            // always fill the view
            self.blurEffectView.frame = self.view.bounds
            self.blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.view.addSubview(blurEffectView)
        } else {
            self.view.backgroundColor = UIColor.black
        }
    }
    
    func removeBlurEffect() {
        self.blurEffectView.removeFromSuperview()
        self.view.backgroundColor = UIColor.darkGray
    }
    
    // Changed the name of "Done" buttons to "Save" on storyboard
    @IBAction func inputCancelButtonTapped(_ sender: Any) {
        view.endEditing(true)
        
        removeBlurEffect()
    }
    @IBAction func inputDoneButtonTapped(_ sender: Any) {
        if let text = inputTextView.text {
            saveGoalText(text: text, key: "LiveGoal")
            updateWithText()
        }
        view.endEditing(true)
        removeBlurEffect()
    }
    @IBAction func inputGatherCancelButtonTapped(_ sender: Any) {
        view.endEditing(true)
        removeBlurEffect()
    }
    @IBAction func inputGatherDoneButtonTapped(_ sender: Any) {
        if let text = inputGatherTextView.text {
            saveGoalText(text: text, key: "GatherGoal")
            updateWithText()
        }
        view.endEditing(true)
        removeBlurEffect()
    }
    @IBAction func inputCareCancelButtonTapped(_ sender: Any) {
        view.endEditing(true)
        removeBlurEffect()
    }
    @IBAction func inputCareDoneButtonTapped(_ sender: Any) {
        if let text = inputCareTextView.text {
            saveGoalText(text: text, key: "CareGoal")
            updateWithText()
        }
        view.endEditing(true)
        removeBlurEffect()
    }
    @IBAction func inputEnableCancelButtonTapped(_ sender: Any) {
        view.endEditing(true)
        removeBlurEffect()
    }
    @IBAction func inputEnableDoneButtonTapped(_ sender: Any) {
        if let text = inputEnableTextView.text {
            saveGoalText(text: text, key: "EnableGoal")
            updateWithText()
        }
        view.endEditing(true)
        removeBlurEffect()
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.restorationIdentifier == "liveTextView" {
            inputTextView.becomeFirstResponder()
            updateInputBackgroundColors(uiView: inputUIView2)
            updateInputTextViewWithText(textView: inputTextView, myGoalText: self.myLiveGoal, familyGoalText: self.familyLiveGoal)
        } else if textView.restorationIdentifier == "gatherTextView" {
            inputGatherTextView.becomeFirstResponder()
            updateInputBackgroundColors(uiView: gatherUIView2)
            updateInputTextViewWithText(textView: inputGatherTextView, myGoalText: self.myGatherGoal, familyGoalText: self.familyGatherGoal)
        } else if textView.restorationIdentifier == "careTextView" {
            inputCareTextView.becomeFirstResponder()
            updateInputBackgroundColors(uiView: careUIView2)
            updateInputTextViewWithText(textView: inputCareTextView, myGoalText: self.myCareGoal, familyGoalText: self.familyCareGoal)
        } else if textView.restorationIdentifier == "enableTextView" {
            inputEnableTextView.becomeFirstResponder()
            updateInputBackgroundColors(uiView: enableUIView2)
            updateInputTextViewWithText(textView: inputEnableTextView, myGoalText: self.myEnableGoal, familyGoalText: self.familyEnableGoal)
        }
        addBlurEffect()
    }
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
