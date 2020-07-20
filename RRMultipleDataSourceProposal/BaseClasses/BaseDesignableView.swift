//
//  BaseDesignableView.swift
//  IBDesignables
//
//  Created by Martin Vasilev on 13.11.18.
//  Copyright © 2018 Upnetix. All rights reserved.
//

import UIKit

@IBDesignable
class BaseDesignableView: UIView {
    
    /// Should be used to access the actual visible view.
    var contentView: UIView?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    /// Autoresizes the view to constrain the content view loaded from the interface builder
    private func xibSetup() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        view.autoresizingMask =
            [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
    }
    
    /// Finds the view (It should be named the same as the class!) and returns it to be set as content view
    ///
    /// - Returns: The actual visible view in the interface builder
    private func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        return nib.instantiate(
            withOwner: self,
            options: nil).first as? UIView
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        xibSetup()
        contentView?.prepareForInterfaceBuilder()
    }
}
