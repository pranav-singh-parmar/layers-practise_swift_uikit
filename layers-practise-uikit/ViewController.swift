//
//  ViewController.swift
//  layers-practise-uikit
//
//  Created by Pranav Singh on 11/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Variables
    private let customLayer = CALayer()
    private let textView = CustomTextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCALayerInsideTextView()
    }
    
    /// to place UITextView inside calayer
    private func setUpTextViewInsideCALayer() {
        // Step 1: Create CALayer
        customLayer.frame = CGRect(x: 50, y: 100, width: 300, height: 50)
        customLayer.backgroundColor = UIColor.lightGray.cgColor
        self.view.layer.addSublayer(customLayer)
        
        // Step 2: Create attributed text
        let attributedString = NSMutableAttributedString(string: "Hello, Core Animation!")
        
        // Add attributes to parts of the text
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 24), range: NSRange(location: 0, length: 5)) // "Hello"
        attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: 5)) // "Hello"
        
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 24), range: NSRange(location: 7, length: 14)) // "Core Animation"
        attributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: NSRange(location: 7, length: 14)) // "Core Animation"
        
        // Step 3: Add UITextView with attributed text to the CALayer
        textView.frame = customLayer.bounds
        textView.backgroundColor = .clear // Set background to clear to match CALayer
        textView.isEditable = false
        textView.attributedText = attributedString
        textView.textAlignment = .center
        textView.attributedText = attributedString
        
        // Add UITextView to the CALayer
        self.view.addSubview(textView)
        
        // Step 5: Animate CALayer (for example, fade-in animation)
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 10.0 // Duration of 10 seconds
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        customLayer.add(animation, forKey: "fadeIn")
        customLayer.opacity = 1.0 // Set final state after animation
    }
    
    /// to place UITextView inside CALayer
    private func setUpCALayerInsideTextView() {
        // Step 1: Create UITextView
        textView.frame = CGRect(x: 50, y: 100, width: 300, height: 150)
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.black.cgColor
        
        // Add UITextView to the view
        self.view.addSubview(textView)
        
        // Step 2: Create attributed text
        let attributedString = NSMutableAttributedString(string: "Hello, Core Animation!")
        
        // Add attributes to parts of the text
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 24), range: NSRange(location: 0, length: 5)) // "Hello"
        attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: 5)) // "Hello"
        
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 24), range: NSRange(location: 7, length: 14)) // "Core Animation"
        attributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: NSRange(location: 7, length: 14)) // "Core Animation"
        
        textView.attributedText = attributedString
        textView.backgroundColor = .purple
        
        // Step 3: Create CALayer (as overlay)
        customLayer.frame = textView.bounds // Same frame as UITextView
        customLayer.backgroundColor = UIColor.black.withAlphaComponent(0.2).cgColor // Semi-transparent black overlay
        
        // Step 4: Add CALayer as a sublayer of UITextView's layer
        textView.layer.addSublayer(customLayer)
        
        // Optional: Add some animation or additional effect on the overlay layer
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 10.0
        customLayer.add(animation, forKey: "fadeIn")
    }
    
    @IBAction func hightTextBA() {
        let hello = "Hello"
        let core = "Core"
        let animation = "Animation"
        let attributedString = NSMutableAttributedString(string: "\(hello), \(core) \(animation)!")
        
        // Add updated attributes (highlight 'Core')
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 24), range: NSRange(location: 0, length: 5)) // "Hello"
        attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: 5)) // "Hello"
        
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 24), range: NSRange(location: 7, length: 4)) // "Core"
        attributedString.addAttribute(.foregroundColor, value: UIColor.white, range: NSRange(location: 7, length: 4)) // "Core"
        
        let highlight = Highlight(backgroundColor: .green,
                                  cornerRadius: 8,
                                  verticalOffset: 8)
        
        attributedString.addAttribute(.textHighlight, value: highlight, range: NSRange(location: 7, length: 4)) // "Core"
        
        attributedString.addAttribute(.backgroundColor, value: UIColor.brown, range: NSRange(location: 7, length: 4)) // Highlight 'Core'
        
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 24), range: NSRange(location: 12, length: 9)) // "Animation"
        attributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: NSRange(location: 12, length: 9)) // "Animation"
        
        // Update UILabel text
//        textView.setAttributedTextWithHighlight()
        textView.attributedText = attributedString
    }
}

