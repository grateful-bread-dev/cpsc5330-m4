//
//  ViewController.swift
//  moodtrackerm4
//
//  Created by user278572 on 11/12/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var feelingLabel: UILabel!
    @IBOutlet weak var moodSlider: UISlider!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var savedEntryLabel: UILabel!
    
    var currentEmoji: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        moodSlider.minimumValue = 0
        moodSlider.maximumValue = 100
        moodSlider.value = 50
        
        updateFeelingLabel()
    }

    
    @IBAction func sliderChanged(_ sender: UISlider) {
        updateFeelingLabel()
    }
    
    private func updateFeelingLabel() {
        let value = Int(moodSlider.value)
        let description: String
        let emoji: String
        
        switch value {
        case 0...20:
            description = "Very Sad"
            emoji = "😢"
        case 21...40:
            description = "Sad"
            emoji = "☹️"
        case 41...60:
            description = "Neutral"
            emoji = "😐"
        case 61...80:
            description = "Happy"
            emoji = "🙂"
        case 81...100:
            description = "Very Happy"
            emoji = "😁"
        default:
            description = "Neutral"
            emoji = "😐"
        }
        currentEmoji = emoji
        feelingLabel.text = "Feeling: \(description) \(emoji)"
    }

    @IBAction func savePressed(_ sender: UIButton) {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        let dateString = formatter.string(from: datePicker.date)
        
        savedEntryLabel.text = "On \(dateString), you felt \(currentEmoji)"
    }
}

