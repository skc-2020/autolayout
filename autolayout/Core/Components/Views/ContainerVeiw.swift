//
//  ContainerVeiw.swift
//  autolayout
//
//  Created by AndUser on 02.12.2020.
//  Copyright © 2020 AndUser. All rights reserved.
//

import UIKit

final class ContainerView: UIView, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Constants

    let weatherWidgetView = WeatherWidgetView()
    let watchWidgetView = WatchWidgetView()
    let cellularWidgetView = CellularWidgetView()
    let schedulerWidgetView = SchedulerWidgetView()
    let schedulerTableView = SchedulerTableView()
    let currencyWidgetView = CurrencyWidgetView()

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

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        translatesAutoresizingMaskIntoConstraints = false

        setupView()
        setupWeatherWidgetView()
        setupWatchWidgetView()
        setupCellWidgetView()
        setupSchedulerWidgetView()
        setupSchedulerTableView()
        setupCurrencyWidgetConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configuration

extension ContainerView {

    func setupView() {

        self.addSubviews(views:
            weatherWidgetView,
                         watchWidgetView,
                         cellularWidgetView,
                         schedulerWidgetView,
                         currencyWidgetView)

        schedulerWidgetView.addSubview(schedulerTableView)

        weatherWidgetView.configure(with:
            .init(backgroundColor: customDarkBlueColor))

        watchWidgetView.configure(with:
            .init(backgroundColor: customGrayColor))

        cellularWidgetView.configure(with:
            .init(backgroundColor: lightGreenColor))

        currencyWidgetView.configure(with:
            .init(backgroundColor: customWhite))

        schedulerTableView.configure(with: .init(delegate: self,
        dataSource: self))

    }

    // MARK: - Constraints setup

    func setupWeatherWidgetView() {
        NSLayoutConstraint.activate([
            weatherWidgetView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            weatherWidgetView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
            weatherWidgetView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            weatherWidgetView.heightAnchor.constraint(equalToConstant: 376)
        ])
    }

    func setupWatchWidgetView() {
        NSLayoutConstraint.activate([
            watchWidgetView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            watchWidgetView.trailingAnchor.constraint(equalTo: cellularWidgetView.leadingAnchor, constant: -18),
            watchWidgetView.topAnchor.constraint(equalTo: weatherWidgetView.bottomAnchor, constant: 18),
            watchWidgetView.widthAnchor.constraint(equalTo: watchWidgetView.heightAnchor)
        ])
    }

    func setupCellWidgetView() {
        NSLayoutConstraint.activate([
            cellularWidgetView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
            cellularWidgetView.topAnchor.constraint(equalTo: weatherWidgetView.bottomAnchor, constant: 18),
            cellularWidgetView.widthAnchor.constraint(equalTo: watchWidgetView.widthAnchor),
            cellularWidgetView.heightAnchor.constraint(equalTo: watchWidgetView.heightAnchor)
        ])
    }

    func setupSchedulerWidgetView() {
        NSLayoutConstraint.activate([
            schedulerWidgetView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            schedulerWidgetView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
            schedulerWidgetView.topAnchor.constraint(equalTo: watchWidgetView.bottomAnchor, constant: 18),
            schedulerWidgetView.heightAnchor.constraint(equalToConstant: 350)
        ])
    }

    func setupSchedulerTableView() {
        NSLayoutConstraint.activate([
            schedulerTableView.leadingAnchor.constraint(equalTo: schedulerWidgetView.leadingAnchor),
            schedulerTableView.trailingAnchor.constraint(equalTo: schedulerWidgetView.trailingAnchor),
            schedulerTableView.topAnchor.constraint(equalTo: schedulerWidgetView.topAnchor),
            schedulerTableView.bottomAnchor.constraint(equalTo: schedulerWidgetView.bottomAnchor)
        ])
    }

    func setupCurrencyWidgetConstraints() {
        NSLayoutConstraint.activate([
            currencyWidgetView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            currencyWidgetView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
            currencyWidgetView.topAnchor.constraint(equalTo: schedulerWidgetView.bottomAnchor, constant: 18),
            currencyWidgetView.heightAnchor.constraint(equalToConstant: 168),
            currencyWidgetView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

}
