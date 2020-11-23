//
//  ViewController.swift
//  autolayout
//
//  Created by AndUser on 11.11.2020.
//  Copyright © 2020 AndUser. All rights reserved.
//

import UIKit

//let itemsArray = ["[Andersen] Daily Meeting": "a", "[Andersen] Аудит": "b", "ВОСКРЕСЕНЬЕ, 15 НОЯБ.": "c", "Turkish Grand Prix": "", "ПОНЕДЕЛЬНИК, 16 НОЯБ.": "", "SA_Platform features (mob)_we...": "", "ещё 1 событие": ""]

let itemsArray = [("ПЯТНИЦА, 13 НОЯБ.", ""), ("[Andersen] Daily Meeting", "15:30"), ("[Andersen] Аудит", "16:00"), ("ВОСКРЕСЕНЬЕ, 15 НОЯБ.", ""), ("Turkish Grand Prix", "12:10"), ("ПОНЕДЕЛЬНИК, 16 НОЯБ.", ""), ("SA_Platform features (mob)_we...", "10:30"), ("ещё 1 событие", "")]

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchLabel: UILabel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return itemsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        let keysArray = Array(itemsArray.keys)
//        cell.textLabel?.text = keysArray[indexPath.row]
//        cell.detailTextLabel?.text = itemsArray[keysArray[indexPath.row]]
        let item = itemsArray[indexPath.row]
        cell.textLabel?.text = item.0
        cell.detailTextLabel?.text = item.1

        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        myScrollView.addSubview(searchView)
//        myScrollView.contentSize = self.searchView.bounds.size
//        searchView.leadingAnchor.constraint(equalTo:
//            myScrollView.layoutMarginsGuide.leadingAnchor)
//        searchView.topAnchor.constraint(equalTo: myScrollView.layoutMarginsGuide.topAnchor)
        
    }

//    let frame: CGRect = .init(x: 0, y: 0, width: <#T##Int#>, height: <#T##Int#>)
//    let scrollView = UIScrollView(frame: <#T##CGRect#>)

//     weak var searchBarView: UIView! = {
//        let view = UIView()
//        
//        return view
//    }()

//    scrollView.addSubview(searchBarView)
}

