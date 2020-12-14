//
//  TestVC.swift
//  autolayout
//
//  Created by AndUser on 04.12.2020.
//  Copyright © 2020 AndUser. All rights reserved.
//

import UIKit

class TestVC: UIViewController {

    var stackView = UIStackView()
    
    let currencyView1 = CurrencyView()
    let currencyView2 = CurrencyView()
    let currencyView3 = CurrencyView()
    let currencyView4 = CurrencyView()

    let innerView1 = InnerView()
    let innerView2 = InnerView()
    let innerView3 = InnerView()
    let innerView4 = InnerView()

    let containerView: UIView = { // = CurrencyWidgetView
        let view = UIView()
        view.backgroundColor = .init(red: 0.969, green: 0.951, blue: 0.943, alpha: 1)
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let label: UILabel = { //
        let label = UILabel()
        label.text = "Курсы валют"
        label.font = helveticaNeue20
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let innerLabel: UILabel = {
        let label = UILabel()
        label.text = "28.10"
        label.font = .boldSystemFont(ofSize: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let innerLabel2: UILabel = {
        let label = UILabel()
        label.text = "33.10"
        label.font = .boldSystemFont(ofSize: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let innerLabel3: UILabel = {
        let label = UILabel()
        label.text = "0.33"
        label.font = .boldSystemFont(ofSize: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let innerLabel4: UILabel = {
        let label = UILabel()
        label.text = "37.70"
        label.font = .boldSystemFont(ofSize: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let dollarLabel: UILabel = {
        let label = UILabel()
        label.text = "$"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let euroLabel: UILabel = {
        let label = UILabel()
        label.text = "€"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let rubelLabel: UILabel = {
        let label = UILabel()
        label.text = "₽"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let poundLabel: UILabel = {
        let label = UILabel()
        label.text = "£"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray

        view.addSubview(containerView)
        containerView.addSubview(label)
        containerView.addSubview(stackView)
        currencyView1.addSubview(innerLabel)
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

        setupContainerView()
        setupLabelConstraints()
        configureStackView()
        configureViews()

        innerView1.configure(with:
            .init(cornerRadius: 10,
                  backgroundColor:lightGreenColor))

        innerView2.configure(with:
            .init(cornerRadius: 10,
                  backgroundColor: lightGreenColor))

        innerView3.configure(with:
            .init(cornerRadius: 10,
                  backgroundColor:lightGreenColor))

        innerView4.configure(with:
            .init(cornerRadius: 10,
                  backgroundColor:lightGreenColor))

        currencyView1.configure(with:
            .init(cornerRadius: 25, backgroundColor:.systemBackground))
        currencyView2.configure(with:
            .init(cornerRadius: 25, backgroundColor:.systemBackground))
        currencyView3.configure(with:
            .init(cornerRadius: 25, backgroundColor:.systemBackground))
        currencyView4.configure(with:
            .init(cornerRadius: 25, backgroundColor:.systemBackground))
    }

    func setupContainerView() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 168)
        ])
    }

    func setupLabelConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 14),
            label.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            label.heightAnchor.constraint(equalToConstant: 26),
            label.widthAnchor.constraint(equalToConstant: 130)
        ])
    }

    func configureStackView() {
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        setStackViewConstraints()
        addItemsToStackView(views: [currencyView2, currencyView3, currencyView1, currencyView4])
    }

    func setStackViewConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            stackView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 25),
//            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
        ])
    }

    func configureViews() {
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
            innerLabel.leadingAnchor.constraint(equalTo: currencyView1.leadingAnchor, constant: 6),
            innerLabel.trailingAnchor.constraint(equalTo: currencyView1.trailingAnchor, constant: -6),
            innerLabel.topAnchor.constraint(equalTo: currencyView1.topAnchor, constant: 20),
            innerLabel.bottomAnchor.constraint(equalTo: currencyView1.bottomAnchor, constant: -20),
            
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

    func addItemsToStackView(views: [UIView]) {
        for i in 0...views.count-1 {
            stackView.addArrangedSubview(views[i])
        }
    }

}
