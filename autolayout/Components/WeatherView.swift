//
//  ViewComponent.swift
//  autolayout
//
//  Created by SKC on 23.11.2020.
//  Copyright © 2020 AndUser. All rights reserved.
//

import UIKit

final class WeatherView: UIView {

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

extension WeatherView {

    struct Model {
        let cornerRadius: CGFloat
        let backgroundColor: UIColor
    }

    func configure(with model: Model) {
        layer.cornerRadius = model.cornerRadius
        backgroundColor = model.backgroundColor
    }
}
