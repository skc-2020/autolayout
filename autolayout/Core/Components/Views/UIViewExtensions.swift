//
//  UIViewExtensions.swift
//  autolayout
//
//  Created by AndUser on 13.12.2020.
//  Copyright © 2020 AndUser. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviews(views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}
