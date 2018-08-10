//
//  HCToastView.swift
//  HushCity
//
//  Created by Huy Nguyễn on 11/3/16.
//  Copyright © 2016 Edge Works Software. All rights reserved.
//

import UIKit

class HCToastView: DesignableLabel {
    
    // MARK: - Public API
    
    /**
     Static method to show a toast on the view
     
     - parameter text: The message show on the toast
     */
    static func showToast(withText text: String?) {
        
        perform(#selector(HCToastView.removeAllToasts), with: self, afterDelay: 1.5)
        
        let toastView = HCToastView()
        toastView.descr = text
    }
    
    /**
     Static method to remove all the toasts from the main key window
     */
    static func removeAllToasts() {
        
        let window = UIApplication.shared.keyWindow
        for view in window!.subviews {
            if let alertView = view as? HCToastView {
                
                UIView.animate(withDuration: 0.5, animations: { () -> Void in
                    alertView.alpha = 0
                }, completion: { (_) -> Void in
                    alertView.removeFromSuperview()
                })
            }
        }
    }
    
    /// internal property to store the description of the toast
    internal var descr: String? {
        didSet {
            text = descr
            self.layoutSubviews()
        }
    }
    
    // MARK: - Override
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if self.numberOfVisibleLines > 2 {
            toastHeight = 75
        } else {
            toastHeight = 50
        }
        frame = CGRect(x: (SCREEN_WIDTH - toastWidth)/2, y: SCREEN_HEIGHT - bottomOffset, width: toastWidth, height: toastHeight)
        
        layer.cornerRadius = frame.height / 2
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    // MARK: - Private API
    
    private let bottomOffset: CGFloat! = 155
    private var toastHeight: CGFloat! = 50
    private let toastWidth: CGFloat! = SCREEN_WIDTH - 80
    
    /// private property to store a reference to the main key window
    private var mainScreen: UIView? {
        get {
            return UIApplication.shared.keyWindow
        }
    }
    
    /**
     Private method for basic UI configurations
     */
    private func setupUI() {
        
        textColor = .white
        numberOfLines = 0
        textAlignment = .center
        backgroundColor = UIColor(white: 0.0, alpha: 0.7)
        clipsToBounds = true
        
        mainScreen?.addSubview(self)
    }
}

extension UILabel {
    var numberOfVisibleLines: Int {
        let textSize = CGSize(width: CGFloat(self.frame.size.width - 16), height: CGFloat(MAXFLOAT))
        let rHeight: Int = lroundf(Float(self.sizeThatFits(textSize).height))
        let charSize: Int = lroundf(Float(self.font.pointSize))
        return rHeight / charSize
    }
}
