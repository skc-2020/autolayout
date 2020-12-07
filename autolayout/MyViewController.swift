//
// MyViewController.swift
// autolayout
//
// Created by AndUser on 14.11.2020.
// Copyright © 2020 AndUser. All rights reserved.
//

import UIKit
let itemsArray = [
    ("ПЯТНИЦА, 13 НОЯБ.", ""),
    ("[Andersen] Daily Meeting", "15:30"),
    ("[Andersen] Аудит", "16:00"),
    ("ВОСКРЕСЕНЬЕ, 15 НОЯБ.", ""),
    ("Turkish Grand Prix", "12:10"),
    ("ПОНЕДЕЛЬНИК, 16 НОЯБ.", ""),
    ("SA_Platform features (mob)_we...", "10:30"),
    ("ещё 1 событие", "")
]

class MyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let searchBar = SearchBar()
    let weatherWidgetView = WeatherWidgetView()
    let scrollView = ScrollView()
    let containerView = ContainerView()
    let watchWidgetView = WatchWidgetView()
    let cellularWidgetView = CellularWidgetView()
    let scheduleWidgetView = ScheduleWidgetView()
    let currencyWidgetView = CurrencyWidgetView()
    let currencyTitle = CurrencyLabel()
    let currencyLabel = CurrencyLabel()

    let currencyView1 = CurrencyView()
    let currencyView2 = CurrencyView()
    let currencyView3 = CurrencyView()
    let currencyView4 = CurrencyView()

    let innerView1 = InnerView()
    let innerView2 = InnerView()
    let innerView3 = InnerView()
    let innerView4 = InnerView()

    let stackView = WidgetStackView()

    let innerLabel1 = CurrencyLabel()
    let innerLabel2 = CurrencyLabel()
    let innerLabel3 = CurrencyLabel()
    let innerLabel4 = CurrencyLabel()

    let dollarLabel = CurrencyLabel()
    let euroLabel = CurrencyLabel()
    let rubelLabel = CurrencyLabel()
    let poundLabel = CurrencyLabel()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = itemsArray[indexPath.row]
        cell.textLabel?.text = item.0
        cell.detailTextLabel?.text = item.1
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleWidgetView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)

        view.addSubviews(views: searchBar,scrollView)
        scrollView.addSubview(containerView)
        currencyWidgetView.addSubviews(views: currencyTitle, stackView)
        containerView.addSubviews(views:
                                   weatherWidgetView,
                                   watchWidgetView,
                                   cellularWidgetView,
                                   scheduleWidgetView,
                                   currencyWidgetView)

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

        // MARK: - Components Initialization

        searchBar.configure(with:
            .init(text: "Поиск",
                  cornerRadius: searchbarCornerRadius,
                  backgroundColor: customDarkGrayColor,
                  searchBarStyle: .minimal,
                  textColor: .gray,
                  textFont: .systemFont(ofSize: 19)))

        weatherWidgetView.configure(with:
            .init(cornerRadius: widgetCornerRadius,
                  backgroundColor: customDarkBlueColor))

        scrollView.configure(with:.init(cornerRadius: widgetCornerRadius))

        watchWidgetView.configure(with:
            .init(backgroundColor: customGrayColor,
                  cornerRadius: widgetCornerRadius))

        cellularWidgetView.configure(with:
            .init(backgroundColor: lightGreenColor,
                  cornerRadius: widgetCornerRadius))

        scheduleWidgetView.configure(with: .init(delegate: self,
                                        dataSource: self,
                                        cornerRadius: widgetCornerRadius))

        currencyWidgetView.configure(with:
            .init(backgroundColor: customWhite, cornerRadius: widgetCornerRadius))

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
        
        setupSearchView()
        setupScrollView()
        setupcontainerView()
        setupWeatherWidgetView()
        setupRootView()
        setupWatchWidgetView()
        setupCellWidgetView()
        setupScheduleWidgetView()
        setupCurrencyWidgetView()
        setupCurrencyTitle()
        setStackViewConstraints()
        configureCurrencyViews()
    }

    // MARK: - Constrains Configuration

    func setupRootView() {
        view.backgroundColor = customDarkColor // makes safe area dark O_o
    }

    func setupSearchView() {
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func setupScrollView() {
        let constraint = scrollView.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        constraint.priority = .defaultLow

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            constraint
        ])
    }

    func setupcontainerView() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }

    func setupWeatherWidgetView() {
        NSLayoutConstraint.activate([
            weatherWidgetView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 18),
            weatherWidgetView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -18),
            weatherWidgetView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            weatherWidgetView.heightAnchor.constraint(equalToConstant: 376)
        ])
    }

    func setupWatchWidgetView() {
        NSLayoutConstraint.activate([
            watchWidgetView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 18),
            watchWidgetView.trailingAnchor.constraint(equalTo: cellularWidgetView.leadingAnchor, constant: -18),
            watchWidgetView.topAnchor.constraint(equalTo: weatherWidgetView.bottomAnchor, constant: 18),
            watchWidgetView.widthAnchor.constraint(equalTo: watchWidgetView.heightAnchor)
        ])
    }

    func setupCellWidgetView() {
        NSLayoutConstraint.activate([
            cellularWidgetView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -18),
            cellularWidgetView.topAnchor.constraint(equalTo: weatherWidgetView.bottomAnchor, constant: 18),
            cellularWidgetView.widthAnchor.constraint(equalTo: watchWidgetView.widthAnchor),
            cellularWidgetView.heightAnchor.constraint(equalTo: watchWidgetView.heightAnchor)
        ])
    }

    func setupScheduleWidgetView() {
        NSLayoutConstraint.activate([
            scheduleWidgetView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 18),
            scheduleWidgetView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -18),
            scheduleWidgetView.topAnchor.constraint(equalTo: watchWidgetView.bottomAnchor, constant: 18),
            scheduleWidgetView.heightAnchor.constraint(equalToConstant: 350)
        ])
    }

    func setupCurrencyWidgetView() {
        NSLayoutConstraint.activate([
            currencyWidgetView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 18),
            currencyWidgetView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -18),
            currencyWidgetView.topAnchor.constraint(equalTo: scheduleWidgetView.bottomAnchor, constant: 18),
            currencyWidgetView.heightAnchor.constraint(equalToConstant: 168),
            currencyWidgetView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }

    func setupCurrencyTitle() {
        NSLayoutConstraint.activate([
            currencyTitle.leadingAnchor.constraint(equalTo: currencyWidgetView.leadingAnchor, constant: 15),
            currencyTitle.topAnchor.constraint(equalTo: currencyWidgetView.topAnchor, constant: 20),
            currencyTitle.heightAnchor.constraint(equalToConstant: 26),
            currencyTitle.widthAnchor.constraint(equalToConstant: 130),
        ])
    }

    func setStackViewConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: currencyWidgetView.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: currencyWidgetView.trailingAnchor, constant: -15),
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

extension UIView {
    func addSubviews(views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}
