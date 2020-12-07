//
//  WatchWidgetView.swift
//  autolayout
//
//  Created by AndUser on 02.12.2020.
//  Copyright © 2020 AndUser. All rights reserved.
//

import UIKit

final class WatchWidgetView: UIView {

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

extension WatchWidgetView {

    struct Model {
        let backgroundColor: UIColor
        let cornerRadius: CGFloat
    }

    func configure(with model: Model) {
        backgroundColor = model.backgroundColor
        layer.cornerRadius = model.cornerRadius
    }
}
