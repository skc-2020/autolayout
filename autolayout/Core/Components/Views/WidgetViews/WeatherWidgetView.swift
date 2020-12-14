//
//  WeatherWidgetView.swift
//  autolayout
//
//  Created by SKC on 23.11.2020.
//  Copyright © 2020 AndUser. All rights reserved.
//

import UIKit

final class WeatherWidgetView: WidgetView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

}

// MARK: - Configuration

extension WeatherWidgetView {

    struct Model {
        let backgroundColor: UIColor
    }

    func configure(with model: Model) {
        backgroundColor = model.backgroundColor
    }
}
