//
//  ActivityView.swift
//  autolayout
//
//  Created by AndUser on 30.11.2020.
//  Copyright © 2020 AndUser. All rights reserved.
//

import UIKit

final class ActivityView: UIView {

    private enum ViewMetrics {
        static let labelFontSize: CGFloat = 56.0
        static let buttonFontSize: CGFloat = 32.0
        static let buttonInset: CGFloat = 10.0
    }

    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: ViewMetrics.labelFontSize)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = NSLocalizedString("Get Ready!", comment: "")
        return label
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Skater"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let button: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        let title = NSLocalizedString("Start", comment: "")
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: ViewMetrics.buttonFontSize)
        button.contentEdgeInsets = UIEdgeInsets(top: ViewMetrics.buttonInset, left: 0.0, bottom: ViewMetrics.buttonInset, right: 0.0)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        addSubview(label)
        addSubview(imageView)
        addSubview(button)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            label.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            label.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),

            imageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            imageView.topAnchor.constraint(equalToSystemSpacingBelow: label.bottomAnchor, multiplier: 1.0),
            imageView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),

            button.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            button.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 1.0),
            button.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
            ])
    }
}
