//
//  UIView+Ext.swift
//  CoffeeCraft
//
//  Created by Aruuke Turgunbaeva on 18/4/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
