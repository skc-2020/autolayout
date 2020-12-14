//
//  WidgetView.swift
//  autolayout
//
//  Created by AndUser on 08.12.2020.
//  Copyright © 2020 AndUser. All rights reserved.
//

import UIKit

class WidgetView: UIView {

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        basicSetup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configuration

extension WidgetView {
    func basicSetup() {
        layer.cornerRadius = 25
        translatesAutoresizingMaskIntoConstraints = false
    }
}
