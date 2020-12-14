//
//  currencyLabel.swift
//  autolayout
//
//  Created by AndUser on 07.12.2020.
//  Copyright © 2020 AndUser. All rights reserved.
//

import UIKit

final class CurrencyLabel: UILabel {

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

extension CurrencyLabel {

    struct Model {
        let font: UIFont
        let text: String
    }

    func configure(with model: Model) {
        font = model.font
        text = model.text
    }
}
