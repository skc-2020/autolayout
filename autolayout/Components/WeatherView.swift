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
        //        weatherView.layer.cornerRadius = 20
        //        weatherView.backgroundColor = .init(red: 0.401, green: 0.465, blue: 0.541, alpha: 1)
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
