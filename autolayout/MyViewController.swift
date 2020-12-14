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

class MyViewController: UIViewController { //, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Constants

    let rootView = RootView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(rootView)
        setupRootView()
    }
}

// MARK: - Constraints Configuration

extension MyViewController {
    func setupRootView() {
        NSLayoutConstraint.activate([
            rootView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rootView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rootView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rootView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
