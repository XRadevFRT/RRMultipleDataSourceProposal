//
//  UIView+NSAnchors.swift
//  UniperEnergy
//
//  Created by Radoslav Radev on 5.02.20.
//  Copyright © 2020 Upnetix. All rights reserved.
//

import UIKit

public enum Anchor {
    case top(_ top: NSLayoutYAxisAnchor, constant: CGFloat = 0)
    case leading(_ leading: NSLayoutXAxisAnchor, constant: CGFloat = 0)
    case bottom(_ bottom: NSLayoutYAxisAnchor, constant: CGFloat = 0)
    case trailing(_ trailing: NSLayoutXAxisAnchor, constant: CGFloat = 0)
    case height(_ constant: CGFloat)
    case width(_ constant: CGFloat)
}

extension UIView {
    
    open func anchor(_ anchors: Anchor...) {
        translatesAutoresizingMaskIntoConstraints = false
        anchors.forEach { anchor in
            switch anchor {
            case .top(let anchor, let constant):
                topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            case .leading(let anchor, let constant):
                leadingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            case .bottom(let anchor, let constant):
                bottomAnchor.constraint(equalTo: anchor, constant: -constant).isActive = true
            case .trailing(let anchor, let constant):
                trailingAnchor.constraint(equalTo: anchor, constant: -constant).isActive = true
            case .height(let constant):
                if constant > 0 {
                    heightAnchor.constraint(equalToConstant: constant).isActive = true
                }
            case .width(let constant):
                if constant > 0 {
                    widthAnchor.constraint(equalToConstant: constant).isActive = true
                }
            }
        }
    }
    
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        guard let superviewTopAnchor = superview?.topAnchor,
            let superviewBottomAnchor = superview?.bottomAnchor,
            let superviewleadingAnchor = superview?.leadingAnchor,
            let superviewTrailingAnchor = superview?.trailingAnchor else {
                return
        }
        anchor(.top(superviewTopAnchor, constant: padding.top),
               .bottom(superviewBottomAnchor, constant: padding.bottom),
               .leading(superviewleadingAnchor, constant: padding.left),
               .trailing(superviewTrailingAnchor, constant: padding.right))
    }
    
    func addPinnedSubview(_ view: UIView) {
        addSubview(view)
        view.fillSuperview()
    }
}
