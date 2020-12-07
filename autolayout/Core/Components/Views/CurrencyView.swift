//
//  CurrencyView.swift
//  autolayout
//
//  Created by AndUser on 07.12.2020.
//  Copyright © 2020 AndUser. All rights reserved.
//

import UIKit

final class CurrencyView: UIView {

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

extension CurrencyView {

    struct Model {
        let cornerRadius: CGFloat
        let backgroundColor: UIColor
    }

    func configure(with model: Model) {
        backgroundColor = model.backgroundColor
        layer.cornerRadius = model.cornerRadius
    }
}