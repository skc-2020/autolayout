//
//  DollarView.swift
//  autolayout
//
//  Created by AndUser on 03.12.2020.
//  Copyright © 2020 AndUser. All rights reserved.
//

import UIKit

final class DollarView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        translatesAutoresizingMaskIntoConstraints = false
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Configuration

extension DollarView {

    struct Model {
        let backgroundColor: UIColor
        let value: UILabel
        let iconView: UIView
    }

    func configure(with model: Model) {
        backgroundColor = model.backgroundColor
//        text = model.value
    }
}
