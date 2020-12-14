//
//  WatchWidgetView.swift
//  autolayout
//
//  Created by AndUser on 02.12.2020.
//  Copyright © 2020 AndUser. All rights reserved.
//

import UIKit

final class WatchWidgetView: WidgetView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}

// MARK: - Configuration

extension WatchWidgetView {

    struct Model {
        let backgroundColor: UIColor
    }

    func configure(with model: Model) {
        backgroundColor = model.backgroundColor
    }
}
