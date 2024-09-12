//
//  CustomTextView.swift
//  layers-practise-uikit
//
//  Created by Pranav Singh on 12/09/24.
//

import UIKit

class CustomTextView: UITextView {
    
    override var attributedText: NSAttributedString? {
        didSet {
            // Call the function when attributedText is set
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // Get the layout manager and text container
        let layoutManager = self.layoutManager
        
        
        self.attributedText?.enumerateAttribute(.textHighlight, in: NSRange(location: 0, length: (self.attributedText?.length ?? 0)), options: []) { (value, range, stop) in
            
            // Ensure the value is of type `Highlight`
            guard let highlight = value as? Highlight else { return }
            
            // Get the glyph range for the character range
            let glyphRange = layoutManager.glyphRange(forCharacterRange: range, actualCharacterRange: nil)
            
            // Enumerate over the bounding rects of the glyphs
            layoutManager.enumerateEnclosingRects(forGlyphRange: glyphRange, withinSelectedGlyphRange: glyphRange, in: self.textContainer) { (rect, stop) in
                
                // Adjust the rect to bring the background color down
                let adjustedRect = rect.offsetBy(dx: 0, dy: highlight.verticalOffset)
                
                // Create a rounded rectangle path for the background
                // here dx and dy sets the padding
                let roundedRect = UIBezierPath(roundedRect: adjustedRect.insetBy(dx: -2, dy: -2), cornerRadius: 8)
                
                // Set the background color for the highlighted range
                highlight.backgroundColor.setFill()
                roundedRect.fill()
            }
        }
    }
}

extension NSAttributedString.Key {
    static let textHighlight = NSAttributedString.Key("textHighlight")
}

struct Highlight {
    var backgroundColor: UIColor
    var cornerRadius: CGFloat
    var verticalOffset: CGFloat
}
