//
//  SearchView.swift
//  autolayout
//
//  Created by AndUser on 30.11.2020.
//  Copyright © 2020 AndUser. All rights reserved.
//

import UIKit

final class ScrollView: UIScrollView {

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

extension ScrollView {

    struct Model {
        let text: String
        let cornerRadius: CGFloat
        let backgroundColor: UIColor
    }

    func configure(with model: Model) {
        layer.cornerRadius = model.cornerRadius
        backgroundColor = model.backgroundColor
    }
}

