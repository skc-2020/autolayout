//
//  CurrencyWidgetView.swift
//  autolayout
//
//  Created by AndUser on 02.12.2020.
//  Copyright © 2020 AndUser. All rights reserved.
//

import UIKit

 class CurrencyWidgetView: WidgetView {

    // MARK: - Private variables

    private let currencyTitle = CurrencyLabel()

    private let currencyView1 = CurrencyView()
    private let currencyView2 = CurrencyView()
    private let currencyView3 = CurrencyView()
    private let currencyView4 = CurrencyView()

    private let innerView1 = InnerView()
    private let innerView2 = InnerView()
    private let innerView3 = InnerView()
    private let innerView4 = InnerView()

    private let stackView = WidgetStackView()

    private let innerLabel1 = CurrencyLabel()  // -- reduce 4 calls to 1
    private let innerLabel2 = CurrencyLabel()
    private let innerLabel3 = CurrencyLabel()
    private let innerLabel4 = CurrencyLabel()

    private let dollarLabel = CurrencyLabel()
    private let euroLabel = CurrencyLabel()
    private let rubelLabel = CurrencyLabel()
    private let poundLabel = CurrencyLabel()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }
}

// MARK: - Configuration

extension CurrencyWidgetView {

    struct Model {
        let backgroundColor: UIColor
    }

    func configure(with model: Model) {
        backgroundColor = model.backgroundColor
    }
}

private extension CurrencyWidgetView {
    func setupViews() {
        self.addSubviews(views: currencyTitle, stackView)
        stackView.addItemsToStackView(views: currencyView1,
                              currencyView2,
                              currencyView3,
                              currencyView4)

        currencyView1.addSubview(innerLabel1)
        currencyView1.addSubview(innerView1)
        innerView1.addSubview(dollarLabel)
        currencyView2.addSubview(innerLabel2)
        currencyView2.addSubview(innerView2)
        innerView2.addSubview(euroLabel)
        currencyView3.addSubview(innerLabel3)
        currencyView3.addSubview(innerView3)
        innerView3.addSubview(rubelLabel)
        currencyView4.addSubview(innerLabel4)
        currencyView4.addSubview(innerView4)
        innerView4.addSubview(poundLabel)

        // MARK: - Initialization of components

        self.configure(with:
            .init(backgroundColor: customWhite))

        currencyTitle.configure(with:
            .init(font: UIFont.systemFont(ofSize: 20),
                  text: "Курс валют"))

        stackView.configure(with: .init(axis: .horizontal,
                                        spacing: 15,
                                        distribution: .fillEqually))

        currencyView1.configure(with:
            .init(cornerRadius: 25, backgroundColor: .systemBackground))
        currencyView2.configure(with:
            .init(cornerRadius: 25, backgroundColor: .systemBackground))
        currencyView3.configure(with:
            .init(cornerRadius: 25, backgroundColor: .systemBackground))
        currencyView4.configure(with:
            .init(cornerRadius: 25, backgroundColor: .systemBackground))

        innerView1.configure(with:
            .init(cornerRadius: 10,
                  backgroundColor: lightGreenColor))

        innerView2.configure(with:
            .init(cornerRadius: 10,
                  backgroundColor: lightGreenColor))

        innerView3.configure(with:
            .init(cornerRadius: 10,
                  backgroundColor: lightGreenColor))

        innerView4.configure(with:
            .init(cornerRadius: 10,
                  backgroundColor: lightGreenColor))

        innerLabel1.configure(with: .init(font: .boldSystemFont(ofSize: 23), text: "28.10"))
        innerLabel2.configure(with: .init(font: .boldSystemFont(ofSize: 23), text: "33.10"))
        innerLabel3.configure(with: .init(font: .boldSystemFont(ofSize: 23), text: "0.33"))
        innerLabel4.configure(with: .init(font: .boldSystemFont(ofSize: 23), text: "37.70"))

        dollarLabel.configure(with: .init(font: .boldSystemFont(ofSize: 23), text: "$"))
        euroLabel.configure(with: .init(font: .boldSystemFont(ofSize: 23), text: "€"))
        rubelLabel.configure(with: .init(font: .boldSystemFont(ofSize: 23), text: "₽"))
        poundLabel.configure(with: .init(font: .boldSystemFont(ofSize: 23), text: "£"))

        // MARK: - Adding constraints

        setupCurrencyTitle()
        setStackViewConstraints()
        configureCurrencyViews()

    }
}

private extension CurrencyWidgetView {

    func setupCurrencyTitle() {
        NSLayoutConstraint.activate([
            currencyTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            currencyTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            currencyTitle.heightAnchor.constraint(equalToConstant: 26),
            currencyTitle.widthAnchor.constraint(equalToConstant: 130),
        ])
    }

    func setStackViewConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            stackView.topAnchor.constraint(equalTo: currencyTitle.bottomAnchor, constant: 25),
        ])
    }

    func configureCurrencyViews() {
        NSLayoutConstraint.activate([
            currencyView1.heightAnchor.constraint(equalTo: currencyView1.widthAnchor)
        ])

        setupCurrencyView1()
        setupCurrencyView2()
        setupCurrencyView3()
        setupCurrencyView4()
    }

    func setupCurrencyView1() {
        NSLayoutConstraint.activate([
            innerLabel1.leadingAnchor.constraint(equalTo: currencyView1.leadingAnchor, constant: 6),
            innerLabel1.trailingAnchor.constraint(equalTo: currencyView1.trailingAnchor, constant: -6),
            innerLabel1.topAnchor.constraint(equalTo: currencyView1.topAnchor, constant: 20),
            innerLabel1.bottomAnchor.constraint(equalTo: currencyView1.bottomAnchor, constant: -20),

            innerView1.trailingAnchor.constraint(equalTo: currencyView1.trailingAnchor),
            innerView1.bottomAnchor.constraint(equalTo: currencyView1.bottomAnchor),
            innerView1.heightAnchor.constraint(equalToConstant: 29),
            innerView1.widthAnchor.constraint(equalTo: innerView1.heightAnchor),

            dollarLabel.topAnchor.constraint(equalTo: innerView1.topAnchor, constant: 3),
            dollarLabel.bottomAnchor.constraint(equalTo: innerView1.bottomAnchor, constant: -3),
            dollarLabel.centerXAnchor.constraint(equalTo: innerView1.centerXAnchor)
        ])
    }

    func setupCurrencyView2() {
        NSLayoutConstraint.activate([
            innerLabel2.leadingAnchor.constraint(equalTo: currencyView2.leadingAnchor, constant: 6),
            innerLabel2.trailingAnchor.constraint(equalTo: currencyView2.trailingAnchor, constant: -6),
            innerLabel2.topAnchor.constraint(equalTo: currencyView2.topAnchor, constant: 20),
            innerLabel2.bottomAnchor.constraint(equalTo: currencyView2.bottomAnchor, constant: -20),

            innerView2.trailingAnchor.constraint(equalTo: currencyView2.trailingAnchor),
            innerView2.bottomAnchor.constraint(equalTo: currencyView2.bottomAnchor),
            innerView2.heightAnchor.constraint(equalToConstant: 29),
            innerView2.widthAnchor.constraint(equalTo: innerView2.heightAnchor),

            euroLabel.topAnchor.constraint(equalTo: innerView2.topAnchor, constant: 3),
            euroLabel.bottomAnchor.constraint(equalTo: innerView2.bottomAnchor, constant: -3),
            euroLabel.centerXAnchor.constraint(equalTo: innerView2.centerXAnchor)
        ])
    }

    func setupCurrencyView3() {
        NSLayoutConstraint.activate([
            innerLabel3.leadingAnchor.constraint(equalTo: currencyView3.leadingAnchor, constant: 6),
            innerLabel3.trailingAnchor.constraint(equalTo: currencyView3.trailingAnchor, constant: -6),
            innerLabel3.topAnchor.constraint(equalTo: currencyView3.topAnchor, constant: 20),
            innerLabel3.bottomAnchor.constraint(equalTo: currencyView3.bottomAnchor, constant: -20),

            innerView3.trailingAnchor.constraint(equalTo: currencyView3.trailingAnchor),
            innerView3.bottomAnchor.constraint(equalTo: currencyView3.bottomAnchor),
            innerView3.heightAnchor.constraint(equalToConstant: 29),
            innerView3.widthAnchor.constraint(equalTo: innerView3.heightAnchor),

            rubelLabel.topAnchor.constraint(equalTo: innerView3.topAnchor, constant: 3),
            rubelLabel.bottomAnchor.constraint(equalTo: innerView3.bottomAnchor, constant: -3),
            rubelLabel.centerXAnchor.constraint(equalTo: innerView3.centerXAnchor)
        ])
    }

    func setupCurrencyView4() {
        NSLayoutConstraint.activate([
            innerLabel4.leadingAnchor.constraint(equalTo: currencyView4.leadingAnchor, constant: 6),
            innerLabel4.trailingAnchor.constraint(equalTo: currencyView4.trailingAnchor, constant: -6),
            innerLabel4.topAnchor.constraint(equalTo: currencyView4.topAnchor, constant: 20),
            innerLabel4.bottomAnchor.constraint(equalTo: currencyView4.bottomAnchor, constant: -20),

            innerView4.trailingAnchor.constraint(equalTo: currencyView4.trailingAnchor),
            innerView4.bottomAnchor.constraint(equalTo: currencyView4.bottomAnchor),
            innerView4.heightAnchor.constraint(equalToConstant: 29),
            innerView4.widthAnchor.constraint(equalTo: innerView4.heightAnchor),

            poundLabel.topAnchor.constraint(equalTo: innerView4.topAnchor, constant: 3),
            poundLabel.bottomAnchor.constraint(equalTo: innerView4.bottomAnchor, constant: -3),
            poundLabel.centerXAnchor.constraint(equalTo: innerView4.centerXAnchor)
        ])
    }

}
