//
//  WidgetStackView.swift
//  autolayout
//
//  Created by AndUser on 07.12.2020.
//  Copyright © 2020 AndUser. All rights reserved.
//

import UIKit

final class WidgetStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        translatesAutoresizingMaskIntoConstraints = false
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configuration

extension WidgetStackView {

    struct Model {
        let axis: NSLayoutConstraint.Axis
        let spacing: CGFloat
        let distribution: UIStackView.Distribution
    }

    func configure(with model: Model) {
        axis = model.axis
        spacing = model.spacing
        distribution = model.distribution
    }
    
    func addItemsToStackView(views: UIView...) {
//        for i in 0...views.count-1 {
//            self.addArrangedSubview(views[i])
//        }
        views.forEach { self.addArrangedSubview($0) }
    }
}
