//
//  ViewController.swift
//  counter
//
//  Created by Владислав Афонин on 12/2/26.
//

import UIKit

class ViewController: UIViewController {
    
    private var counter = 0 {
        didSet {
            counterLabel.text = "\(counter)"
        }
    }
    
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var incrementButton: UIButton!
    
    @IBOutlet weak var decrementButton: UIButton!
    
    @IBOutlet weak var refreshCounterButton: UIButton!
    
    
    @IBOutlet weak var counterHistoryTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        incrementButton.tintColor = .systemGreen
        decrementButton.tintColor = .systemRed
        counterLabel.text = "\(counter)"
        setUpTextView()
    }

   
    
    @IBAction func incrementCounter(_ sender: Any) {
        counter += 1
        addHistory("значение изменено на +1")
    }
    
    @IBAction func decrementCounter(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            addHistory("значение изменено на -1")
        } else {
            addHistory("попытка изменить значение на -1")
        }
    }
    
    @IBAction func refreshCounter(_ sender: Any) {
        counter = 0
        addHistory("значение сброшено")
    }
    
    
    func addHistory(_ text: String) {
        counterHistoryTextView.text += "\(Date().dateTimeString): \(text)\n"
        
        let range = NSRange(location: counterHistoryTextView.text.count - 1, length: 1)
        counterHistoryTextView.scrollRangeToVisible(range)
    }
    
   private func setUpTextView() {
       
        let paragraphStyle = NSMutableParagraphStyle()
          paragraphStyle.lineSpacing = 6
       counterHistoryTextView.isSelectable = false
       counterHistoryTextView.isEditable = false
        counterHistoryTextView.typingAttributes = [.paragraphStyle: paragraphStyle, .font: UIFont.systemFont(ofSize: 16)]
        counterHistoryTextView.text = "История изменений:\n"
    }
    
}

